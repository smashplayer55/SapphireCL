local npcWindowDialog = nil
local buttonHolder = nil
local lblTitle = nil
local lblMessage = nil
local outfitBox = nil

function init()
	connect(g_game, { 
		onGameEnd = offline, 
		onTextMessage = getMessageDialog 
	})
	
	npcWindowDialog = g_ui.displayUI('npcChat')
	npcWindowDialog:hide()
	
	buttonHolder = npcWindowDialog:getChildById('buttonHolder')
	lblTitle = npcWindowDialog:getChildById('lblTitle')
	lblMessage = npcWindowDialog:getChildById('lblMessage')
	outfitBox = npcWindowDialog:getChildById('outfitBox')
end

function terminate()
	disconnect(g_game, { 
		onGameEnd = offline, 
		onTextMessage = getMessageDialog 
	})
	npcWindowDialog:destroy()
end

function offline()
	npcWindowDialog:destroy()
end

function toggle()
	if npcWindowDialog:isVisible() then
		npcWindowDialog:setFocusable(false)
		npcWindowDialog:hide()
	else
		openDialog()
	end
end

function openDialog()
	npcWindowDialog:show()
	npcWindowDialog:raise()
	npcWindowDialog:focus()
end

function createMessageDialog(param)
	local buttonsWidth = 0
	local buttonsHeight = 0
		
	local message = param[2]:split('@')
	
	lblTitle:setText(message[1])
	lblMessage:setText(message[3])
	outfitBox:setOutfit({type=message[2]})
	
	if message[4] ~= nil then
		local option = message[4]:split('&')
		for i = 1, #option do			
			local button = g_ui.createWidget('OptionButton', buttonHolder)
			button:setText(option[i])		
			if i == 1 then
				button:setMarginLeft(0)
				button:addAnchor(AnchorBottom, 'parent', AnchorBottom)
				button:addAnchor(AnchorLeft, 'parent', AnchorLeft)
				buttonsHeight = button:getHeight()
			else
				button:addAnchor(AnchorBottom, 'prev', AnchorBottom)
				button:addAnchor(AnchorLeft, 'prev', AnchorRight)
			end
			button.onClick = function() g_game.talk(option[i]) end
			buttonsWidth = buttonsWidth + button:getWidth() + button:getMarginLeft()
		end
	end
	
	buttonHolder:setWidth(buttonsWidth)
	buttonHolder:setHeight(buttonsHeight)
	
	openDialog()
	
end

function getMessageDialog(mode, text)
	if not g_game.isOnline() then return end
	if mode == MessageModes.Failure then 
		if string.find(text, "NpcDialog=") then
			createMessageDialog(text:explode('='))
		end
	end
end
