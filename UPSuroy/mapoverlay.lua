local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local myMap = require("mymap")
local widgetExtras = require("widget-extras")

local screenW, screenH = display.contentWidth, display.contentHeight
local viewableScreenW, viewableScreenH = display.viewableContentWidth, display.viewableContentHeight
local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight

local imgNum = nil
local images = nil
local touchListener, nextImage, prevImage, cancelMove, initImage, jumpToImage
local background
local imageNumberText, imageNumberTextShadow
local backbutton
local navBar
local pins
local index
local descPressed = 0
--widget.theme = myMap.theme


local function goBack( event )
	print(event.phase)
	if event.phase == "ended" then
		--composer.hideOverlay( "fade", 250 )
		local currScene = composer.getSceneName( "current" )

		composer.removeScene( currScene )
		
		composer.gotoScene("menu", "fade", 200)
	end
	return true
end
local function showPanel( event )
    	if event.phase == "ended" then
    		sharingPanel:show()
    	end
    	return true
    end
local function setSlideNumber()
		
		navBar:setLabel(pins[index].label)
		--imageNumberTextShadow.text = imgNum .. " of " .. #images
	end
--function new( imageSet, slideBackground, top, bottom )	
function scene:create( event )
	local sceneGroup = self.view
	print("create mapoverlay")
	local pad = 0
	local top = top or 0
	local bottom = bottom or 0

	local start = 1
	if event.params and event.params.start then
		start = event.params.start
	end
	pins = event.params.pinDetails
	 index = event.params.index
	 videostory = pins[index].video
	 photos = event.params.photos

	assert(pins, "Error: pins list not set")

	viewableScreenW = display.contentWidth
	viewableScreenH = display.contentHeight - 120 -- status bar + top bar + tabBar
		
    local background = display.newRect(0,0,display.contentWidth, display.contentHeight +30)
    --background:setFillColor( 0.95, 0.95, 0.95 )
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    background.id = 'background'
    sceneGroup:insert(background)
    textbox = native.newTextBox(display.contentWidth/2, 360, display.contentWidth,100)
		textbox.size = 16
		textbox.text = pins[index].text
		textbox.isEditable = false
		
		sceneGroup:insert(textbox)
   -- sharingPanel = widget.newSharingPanel({
    --	})
    	textbox.isVisible = true
    local vtPress = function(event)

    	local story =  videostory
    	textbox.isVisible = false
    	composer.showOverlay("videoScene", {time = 100, effect = "slideRight", isModal= true, params= {story = story}})

	end
    --local descPress = function( event )
    --if descPressed == 0 then
		 
		--descPressed = 1
	--else
		--textbox:removeSelf()
		--descPressed = 0 
	--end
	--return true;
	--end 
	local picsPress = function(event)
		local options =
{
	    effect = "fade",
	    time = 100,
	     isModal =true,
	    params = {
	        pin = pins[index],
	        photos = photos,

	    }
	}
		textbox.isVisible = false
		composer.showOverlay("picsScene", options)
	end
	local roomsPress = function( event )

		if(pins[index].hasFP == 1) then 
			textbox.isVisible = false
			composer.showOverlay("picsoverlay", {time=100, effect="crossFade", isModal = true, params={FP= pins[index].FP}})

		end
		return true;
	end

	local leftButton = {
		onEvent = goBack,
		width = 59,
		height = 32,
		defaultFile = "images/backbutton7_white.png",
		overFile = "images/backbutton7_white.png"
	}

	local rightButton = {
		onEvent = showPanel,
		width = 40,
		height = 48,
		defaultFile = "images/sendToButton.png",
		overFile = "images/sendToButtonOver.png",
	}
	--local button =widget.newButton()
    navBar = widget.newNavigationBar({
        title = "VR MAP",
        backgroundColor = { 231/255, 76/255, 60/255 },
        titleColor = {1, 1, 1},
        font = myMap.fontBold,
        leftButton = leftButton,
        rightButton = rightButton,
        y = 0,
    })
    navBar.y = -20
    sceneGroup:insert(navBar)
	setSlideNumber()
	images = {}
	
		local p = display.newImage(pins[index].image)
		local h = viewableScreenH-(top+bottom)
		if p.width > viewableScreenW or p.height > h then
			if p.width/viewableScreenW > p.height/h then 
					p.xScale = viewableScreenW/p.width
					p.yScale = viewableScreenW/p.width
			else
					p.xScale = h/p.height
					p.yScale = h/p.height
			end		 
		end
		p.x = screenW*.5
		p.y = h*.5 + 20 + 50
		sceneGroup:insert(p)
	    
	
		roomsButton = widget.newButton
		{
			defaultFile = "Button_rooms.PNG",
			overFile = "Button_roomsPressed.PNG",
			onPress = roomsPress,
			--onRelease = button1Release,
		}
		roomsButton.x = display.contentWidth/2; roomsButton.y = 450
		sceneGroup:insert(roomsButton)
		
		videoButton = widget.newButton
		{
			defaultFile = "Button_videos.PNG",
			overFile = "Button_videosPressed.PNG",
			onPress = vtPress,
			--onRelease = button1Release,
		}
		videoButton.x = roomsButton.x -100; videoButton.y = 450
		sceneGroup:insert(videoButton)
		
		picsButton = widget.newButton
		{
			defaultFile = "Button_photos.PNG",
			overFile = "Button_photosPressed.PNG",
			onPress = picsPress,
			--onRelease = button1Release,
		}
		picsButton.x = roomsButton.x + 100; picsButton.y = 450
		sceneGroup:insert(picsButton)

	
	sceneGroup.x = 0
	sceneGroup.y = top + display.screenOriginY
			
	
	function background:touchListener(self, event) 
	print(event.id)
	return true
end
	
	


	background.touch = touchListener
	background:addEventListener( "touch", background )

	------------------------
	-- Define public methods



end


function scene:show( event )
    local sceneGroup = self.view
    print("mapoverlay:show", event.phase)
end

function scene:hide( event )
    local sceneGroup = self.view
    print("mapoverlay:hide", event.phase)

    --
    -- Clean up any native objects and Runtime listeners, timers, etc.
    --
    
end

function scene:destroy( event )
    local sceneGroup = self.view
      textbox:removeSelf()
    print("mapoverlay:destroy", event.phase)
    
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

