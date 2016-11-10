-- Project: Business Sample App
--
-- File name: photogallery.lua
--
-- Author: Corona Labs
--
-- Abstract: Display a gallery of photo thumbnails.
--
--
-- Target devices: simulator, device
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2013 Corona Labs Inc. All Rights Reserved.
---------------------------------------------------------------------------------------
--[[

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

]]--
---------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

local widget = require("widget")
local myMap = require("mymap")

--widget.setTheme(myApp.theme)

--local slideView = require( "slideView" )

local photoFiles

local photosThumbnails = {}
local photosThumbGroups = {}
function goBack( event )
    print("goBack", event.phase)
    if event.phase == "ended" then
        composer.hideOverlay( "fade", 250 )
    end
    return true
end
local function showPhoto(event)
	if event.phase == "ended" then
        composer.showOverlay("picsoverlay", {time=250, effect="crossFade", params={start=event.target.index, FP=photoFiles}})
	end
	return true
end


function scene:create( event )
    print("createph")
    local sceneGroup = self.view

    local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
    background:setFillColor( 0.95, 0.95, 0.95 )
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    photoFiles = event.params.photos
    sceneGroup:insert(background)
    local p = event.params.pin
    assert(p, "Error: pin not set")
    local leftButton = {
        onEvent = goBack,
        width = 59,
        height = 32,
        defaultFile = "images/backbutton7_white.png",
        overFile = "images/backbutton7_white.png",
        
    }
    local navBar = widget.newNavigationBar({
        title = "Photos of "..p.label,
        backgroundColor = { 138/255, 13/255, 39/255},
        titleColor = {1, 1, 1},
        font = myMap.fontBold,
        y = 0,
        leftButton = leftButton,
    })
    sceneGroup:insert(navBar)

    local row = 0
    local col = 0

    local thumbnailMask = graphics.newMask("images/mask-80x80.png")
    
    local groupOffset = 0
    if tonumber( system.getInfo("build") ) < 2013.2000 then
        groupOffset = 40
    end

    local maxCol = math.floor( display.contentWidth / 80 ) - 1

    for i = 1, #photoFiles do
    	photosThumbnails[i] = display.newImage(photoFiles[i])
    	local aspectRatio = photosThumbnails[i].width / photosThumbnails[i].height
    	local scale
    	if aspectRatio > 1 then -- landscape photo
    		scale = 80 / photosThumbnails[i].height
    	else
    		scale = 80 / photosThumbnails[i].width
    	end
    	--print(scale, aspectRatio, photosThumbnails[i].width, photosThumbnails[i].width * scale, photosThumbnails[i].height, photosThumbnails[i].height * scale)
   		photosThumbnails[i]:scale(scale,scale)
   		photosThumbGroups[i] = display.newGroup()
   		photosThumbnails[i].x = groupOffset --col * 80 + 40
   		photosThumbnails[i].y = groupOffset --row * 80 + 40 + 70
   		photosThumbGroups[i]:insert(photosThumbnails[i])
		photosThumbGroups[i].x = col * 80 + 40
		photosThumbGroups[i].y = row * 80 + 40 + 75
		photosThumbGroups[i]:setMask(thumbnailMask)
		photosThumbGroups[i].maskX = groupOffset
		photosThumbGroups[i].maskY = groupOffset 
		photosThumbGroups[i].index = i
		photosThumbGroups[i]:addEventListener("touch", showPhoto)
		col = col + 1
		if col > maxCol then 
			row = row + 1
			col = 0
		end
		sceneGroup:insert(photosThumbGroups[i])

    end
    print("Memory", system.getInfo("textureMemoryUsed") / (1024 * 1024))
end

function scene:show( event )
    local sceneGroup = self.view
    
end

function scene:hide( event )
    local sceneGroup = self.view

    --
    -- Clean up any native objects and Runtime listeners, timers, etc.
    --
    
end

function scene:destroy( event )
    local sceneGroup = self.view
    
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
