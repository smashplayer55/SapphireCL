function init()
  connect(g_game, { onGameEnd = onGameEnd })
	  ProtocolGame.registerExtendedOpcode(138, function(protocol, opcode, buffer) show() end)
  deadWindow = g_ui.displayUI('eng')
  deadWindow:hide()
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })

  deadWindow:destroy()
end

function onGameEnd()
  if deadWindow:isVisible() then
    deadWindow:hide()
  end
end

function show()
  deadWindow:show()
  deadWindow:raise()
  deadWindow:focus()
end

function hide()
	if deadWindow:isVisible() then
	  deadWindow:hide()
	end
end
 
function sendRequestShow(op)
   g_game.getProtocolGame():sendExtendedOpcode(138, "heldTrade-" .. op)
end