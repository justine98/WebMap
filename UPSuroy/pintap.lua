local composer = require("composer")
local scene = composer.newScene()



function scene:create(event)

	local sceneGroup = self.view
	local rect = display.newRect(0, 0, display.contentWidth, display.contentHeight)
rect.x = display.contentWidth/2
rect.y =  display.contentHeight

sceneGroup:insert(rect)
end


function scene:show(event)
	local sceneGroup = self.view
end
function scene:hide(event)
		local sceneGroup = self.view
	end
	function scene:destroy(event)
			local sceneGroup = self.view
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene