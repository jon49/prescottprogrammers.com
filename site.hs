--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Hakyll.Core.Util.String
import           Data.List (isSuffixOf)

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "images/favicon.ico" $ do
        route   (constRoute "favicon.ico")
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.md", "contact.md", "calendar.md"]) $ do
        route   $ asFolderWithIndex
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "posts/*" $ do
        route $ asFolderWithIndex
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls
    
    match "posts/slides/*" $ do
        route $ gsubRoute "posts/" (const "")
        compile $ copyFileCompiler

    create ["archive/index.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= cleanIndexUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= cleanIndexUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

-- Blog posts
-- Create folders for dashes `-` to `/` and make index file name.md to index.html
asFolderWithIndex =
    gsubRoute "-" (const "/")
    `composeRoutes` gsubRoute "\\." (const "/index.")
    `composeRoutes` setExtension "html"

cleanIndexUrls :: Item String -> Compiler (Item String) 
cleanIndexUrls = return . fmap (withUrls clean) 
    where 
      idx = "index.html" 
      clean url 
          | idx `isSuffixOf` url = take (length url - length idx) url 
          | otherwise            = url 
