local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local myMap = require( "mymap" )

--local utility = require( "utility" )

--widget.setTheme(myMap.theme)

local backButton 
local playButton
local titleText
local webView

local function goBack(event)
    composer.hideOverlay( "slideRight", 250)
    return true
end

function scene:create( event )
    local sceneGroup = self.view
        
    local params = event.params
    local story = event.params.story

    --
    -- setup a page background, really not that important 
    --

    local background = display.newImage("bg.png")

    background.x = display.contentCenterX
    background.y = display.contentCenterY

    sceneGroup:insert(background)

    local title = story.title
    if title and title:len() > 16 then
        title = title:sub(1,16) .. "..."
    end

    local leftButton = {
        onEvent = goBack,
        width = 59,
        height = 32,
        defaultFile = "images/backbutton7_white.png",
        overFile = "images/backbutton7_white.png"
    }

    navBar = widget.newNavigationBar({
        title = title,
        backgroundColor = { 231/255, 76/255, 60/255 },
        titleColor = {1, 1, 1},
        font = myMap.fontBold,
        leftButton = leftButton,
        y = -20,
    })
    sceneGroup:insert(navBar)

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    local params = event.params

    if event.phase == "did" then
        local story = params.story
        --local enclosures = story.enclosuers

        local title = "UP video"
       

        navBar:setLabel( title )
        
        --utility.print_r( story )

        -- do nothing when the podcast finishes playing.
        local function onComplete(event)
            return true
        end
        
        -- function to play the podcast.  We get the URL to stream from the story.enclosures
        -- table.
        local function playPodcast()
            --print("playPodcast", story.link)
            media.playVideo(story.link, media.RemoteSource, true, onComplete )
            return true
        end
        
       

        -- now we write out the story body, which likely has HTML code in it to a
        -- temporary file that we will load back in to our web view.
        
        local path = system.pathForFile( "story.html", system.TemporaryDirectory )
     
        -- io.open opens a file at path. returns nil if no file found
        local fh, errStr = io.open( path, "w" )
     
        -- 
        -- Write out the required headers to make sure the content fits into our
        -- window and then dump the body.
        --
        if fh then
            print( "Created file" )
            fh:write("<!doctype html>\n<html>\n<head>\n<meta charset=\"utf-8\">")
            fh:write("<meta name=\"viewport\" content=\"width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;\"/>\n")
            fh:write("<style type=\"text/css\">\n html { -webkit-text-size-adjust: none; font-family: HelveticaNeue-Light, Helvetica, Droid-Sans, Arial, san-serif; font-size: 1.0em; } h1 {font-size:1.25em;} p {font-size:0.9em; } </style>")
            fh:write("</head>\n<body>\n")
            if story.title then
                fh:write("<h1>" .. story.title .. "</h1>\n")
            end
            if story.link then 
                local videoID = story.link:sub(33)
                print(videoID)
                local height = math.floor(display.contentWidth / 16 * 9)
                fh:write([[<iframe width="100%" height="]] .. height .. [[" src="http://www.youtube.com/embed/]] .. videoID .. [[?html5=1" frameborder="0" allowfullscreen></iframe>]])
            end
            if story.content_encoded then
                fh:write( story.content_encoded)
            elseif story.description then
                fh:write(story.description)
            end

            fh:write( "\n</body>\n</html>\n" )
            io.close( fh )
        else
            print( "Create file failed!" )
        end

        --
        -- handler to deal with clicking on any anchor tags in the above HTML.
        --
        local function webListener(event)
            print("showWebPopup callback")
            
            local url = story.link

            if string.find(url, "http://www.youtube.com") then
                return true
            end

            if( string.find( url, "http:" ) ~= nil or string.find( url, "mailto:" ) ~= nil ) then
                print("url: ".. url)
                system.openURL(url)
            end

            return true
        end
       
        local isTall = 0
        if myMap.isTall then
            isTall = 88
        end

        -- turn off the activity indicator and show the webview
        --native.setActivityIndicator( false )
    --    local options = { hasBackground=false, baseUrl=system.TemporaryDirectory, urlRequest=listener }
        --local options = { hasBackground=true,  urlRequest=listener }
    --    native.showWebPopup(0, 51 + 60 + 20 + 60, display.contentWidth, 220 + isTall, "story.html", options )
        
        webView = native.newWebView(0, 71, display.contentWidth, display.contentHeight)
        webView.x = display.contentCenterX
       -- webView.y = navBar.y + 50 + display.topStatusBarContentHeight
        webView.y = navBar.y + 50 
        webView.anchorY  = 0
        webView:request("story.html", system.TemporaryDirectory)
        webView:addEventListener( "urlRequest", webListener )
        -- add a button to see the full article in the web browser
          
	end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    --
    -- Clean up any native objects and Runtime listeners, timers, etc.
    --
    if event.phase == "will" then
        if webView and webView.removeSelf then
            webView:removeSelf()
            webView = nil
        end
    end   
end

function scene:destroy( event )
    local sceneGroup = self.view
    
    print("destroy scene")
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "create", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "show", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "hide", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene