-- MEU OVO KKK
EMOTICONS = {
[":)"] = 'blush',
["(like)"] = 'like',
["(bear)"] = 'bear',
["(!)"] = 'att',
["(n)"] = '-1',
["(y)"] = '+1',
["o:)"] = 'angel',
["(angry)"] = 'angry',
["(bike)"] = 'bike',
["(birthday)"] = 'birthday',
["</3"] = 'broken_heart',
["(book)"] = 'closed_book',
["(pc)"] = 'computer',
[":/"] = 'confused',
["(love)"] = 'couple_with_heart',
["(ghost)"] = 'ghost',
["(inlove)"] = 'heart_eyes',
["<3"] = 'heart',
["(kiss)"] = 'kiss',
[":*"] = 'kissing_face',
[";*"] = 'kissing_heart',
["(sick)"] = 'mask',
["\\m/"] = 'metal',
[":l"] = 'neutral_face',
["(stop)"] = 'no_good',
["(ok)"] = 'ok_hand',
["(pizza)"] = 'pizza',
["(poop)"] = 'poop',
["(pray)"] = 'pray',
["(punch)"] = 'punch',
["(rage)"] = 'rage',
["(ring)"] = 'ring',
["(rose)"] = 'rose',
["(santa)"] = 'santa',
[":o"] = 'scream',
[":D"] = 'smiley',
["(smirk)"] = 'smirk',
[":,("] = 'sob',
[";p"] = 'stuck_out_tongue_winking_eye',
["B)"] = 'sunglasses',
["(sweat)"] = 'sweat',
["(trollface)"] = 'trollface',
["(18+)"] = 'underage',
["(v)"] = 'v',
[";)"] = 'wink',
[":("] = 'worried',
[":p"] = 'yum',
["(zzz)"] = 'zzz',
}

Eoptions = {ignore=false;}
function findEmoticons(text)
	if Eoptions.ignore then
		return {};
	end
	--local text = "oie blz {eu tenho} muita :-) batata pra vc {com} :-) leite :)  AEAEAEAEA =]"
	local tmpData = {}
	--[[for b,i in pairs(EMOTICONS) do
		b = b:gsub('%-',"%%%-")
		b = b:gsub('%)',"%%%)")
		b = b:gsub('%(',"%%%(")
		while string.find(text,b,(tmpData[#tmpData] or {})[2]) do
			local x,y,z = string.find(text,b,(tmpData[#tmpData] or {})[2])
			tmpData[#tmpData+1] = {x,y,b}
			print("Located:",b)
		end
	end]]
	for i=1,#text do
		for b,name in pairs(EMOTICONS) do
			local find = true;
			local params = {}
			local ended = 0
			for e=1,b:len() do
				--[[if b:sub(e,e) == '&' and text:sub(i+(e-1),i+(e-1)) ~= '*'  then
					if string.byte(text:sub(i+(e-1),i+(e-1))) <= '0' and
					params[#params+1] = text:sub(i+(e-1),i+(e-1))
				elseif b:sub(e,e) == '*'  and b:sub(e+1,e+1) == "*" then
					print("ext")
					local ext = ""
					local thisE = e;
					e = e+1
					print(text:sub(i+(e-1),i+(e-1)) )
					while text:sub(i+(e-1),i+(e-1)) ~= '*' and i+(e-1) <= #text do
						ext  = ext..text:sub(i+(e-1),i+(e-1));
						e = e+1
						print(ext,e)
					end
					ended = e;
					params[#params+1] = ext
					break
				else]]
				if text:sub(i+(e-1),i+(e-1)) ~= b:sub(e,e) then
					find = false

					break
				end
				ended = e;
			end
			if find then
				tmpData[#tmpData+1] = {i,i+ended-1,name,unpack(params)}
			end
		end
	end
	return tmpData
end




-- SpeakTypesSettings = {
  -- none = {},
  -- say = { speakType = MessageModes.Say, color = '#FFFF00' },
  -- whisper = { speakType = MessageModes.Whisper, color = '#FFFF00' },
  -- yell = { speakType = MessageModes.Yell, color = '#FFFF00' },
  -- broadcast = { speakType = MessageModes.GamemasterPrivateFrom, color = '#F55E5E' },
  -- private = { speakType = MessageModes.PrivateTo, color = '#5FF7F7', private = true },
  -- privateRed = { speakType = MessageModes.GamemasterTo, color = '#F55E5E', private = true },
  -- privatePlayerToPlayer = { speakType = MessageModes.PrivateTo, color = '#9F9DFD', private = true },
  -- privatePlayerToNpc = { speakType = MessageModes.NpcTo, color = '#9F9DFD', private = true, npcChat = true },
  -- privateNpcToPlayer = { speakType = MessageModes.NpcFrom, color = '#5FF7F7', private = true, npcChat = true },
  -- channelYellow = { speakType = MessageModes.Channel, color = '#FFFF00' },
  -- channelWhite = { speakType = MessageModes.ChannelManagement, color = '#FFFFFF' },
  -- channelRed = { speakType = MessageModes.GamemasterChannel, color = '#F55E5E' },
  -- channelOrange = { speakType = MessageModes.ChannelHighlight, color = '#FE6500' },
  -- monsterSay = { speakType = MessageModes.MonsterSay, color = '#FE6500', hideInConsole = true},
  -- monsterYell = { speakType = MessageModes.MonsterYell, color = '#FE6500', hideInConsole = true},
  -- rvrAnswerFrom = { speakType = MessageModes.RVRAnswer, color = '#FE6500' },
  -- rvrAnswerTo = { speakType = MessageModes.RVRAnswer, color = '#FE6500' },
  -- rvrContinue = { speakType = MessageModes.RVRContinue, color = '#FFFF00' },
-- }

-- SpeakTypes = {
  -- [MessageModes.Say] = SpeakTypesSettings.say,
  -- [MessageModes.Whisper] = SpeakTypesSettings.whisper,
  -- [MessageModes.Yell] = SpeakTypesSettings.yell,
  -- [MessageModes.GamemasterBroadcast] = SpeakTypesSettings.broadcast,
  -- [MessageModes.PrivateFrom] = SpeakTypesSettings.private,
  -- [MessageModes.GamemasterPrivateFrom] = SpeakTypesSettings.privateRed,
  -- [MessageModes.NpcTo] = SpeakTypesSettings.privatePlayerToNpc,
  -- [MessageModes.NpcFrom] = SpeakTypesSettings.privateNpcToPlayer,
  -- [MessageModes.Channel] = SpeakTypesSettings.channelYellow,
  -- [MessageModes.ChannelManagement] = SpeakTypesSettings.channelWhite,
  -- [MessageModes.GamemasterChannel] = SpeakTypesSettings.channelRed,
  -- [MessageModes.ChannelHighlight] = SpeakTypesSettings.channelOrange,
  -- [MessageModes.MonsterSay] = SpeakTypesSettings.monsterSay,
  -- [MessageModes.MonsterYell] = SpeakTypesSettings.monsterYell,
  -- [MessageModes.RVRChannel] = SpeakTypesSettings.channelWhite,
  -- [MessageModes.RVRContinue] = SpeakTypesSettings.rvrContinue,
  -- [MessageModes.RVRAnswer] = SpeakTypesSettings.rvrAnswerFrom,

  -- ignored types
  -- [MessageModes.Spell] = SpeakTypesSettings.none,
  -- [MessageModes.BarkLow] = SpeakTypesSettings.none,
  -- [MessageModes.BarkLoud] = SpeakTypesSettings.none,
-- }

-- SayModes = {
  -- [1] = { speakTypeDesc = 'whisper', icon = '/images/game/console/whisper' },
  -- [2] = { speakTypeDesc = 'say', icon = '/images/game/console/say' },
  -- [3] = { speakTypeDesc = 'yell', icon = '/images/game/console/yell' }
-- }
-- filters = {}

-- MAX_HISTORY = 7100
-- MAX_LINES = 7000
-- opacity = 1.0
-- HELP_CHANNEL = 9
-- IGNOREPM = false;
-- consolePanel = nil
-- consoleContentPanel = nil
-- consoleTabBar = nil
-- consoleTextEdit = nil
-- channels = nil
-- channelsWindow = nil
-- ownPrivateName = nil
-- EmojiW = nil
-- messageHistory = {}
-- currentMessageIndex = 0
-- ignoreNpcMessages = false
-- defaultTab = nil
-- serverTab = nil
-- loadedList = {{255,"Go to..."}}
-- loadedOnce = false
--dexhere
-- pokedex_UI = nil
-- topButton = nil
--rep
-- REPORTS = {}
-- Rep_window = nil
-- itemWidget = nil
pokeinfowindow = nil
topButton2 = nil
-- consoleToggleChat = nil

hided = false;
-- function hideChat(f)
	-- if f == true then
		-- hided = true
	-- end
	-- if not hided and modules.game_interface.currentViewMode == 2 then
		-- consolePanel:setVisible(false)
		-- modules.game_interface.getBottomPanel():setVisible(false)
		-- modules.game_interface.getBottomSplitter():setVisible(false)
		-- modules.game_interface.getHideButton():setVisible(true)
		-- hided = true
		-- disableChat()
		-- modules.game_pokewindow.drag(self,0)
	-- else
		-- consolePanel:setVisible(true)
		-- modules.game_interface.getBottomPanel():setVisible(true)
		-- modules.game_interface.getBottomSplitter():setVisible(true)
		-- modules.game_interface.getHideButton():setVisible(false)
		-- hided = false
		-- enableChat()
		-- modules.game_pokewindow.drag(self,0)
	-- end

-- end
function changeSize()
	if not modules.game_pokewindow.PRESSED then
		modules.game_pokewindow.drag(self)
	end
end

function changeOpacity()
    opacity = opacity or 1.0
	opacity = opacity - 0.1
	if (opacity <= 0.1) then
		opacity = 1.0
	end
	consolePanel:setOpacity(opacity)

	g_settings.setNode('asdfchannel',{[1] = opacity})
end
function init()

  connect(g_game, { 
  -- onTalk = onTalk,
  -- onEditText = onGameEditText,
  -- onWalk = onWalk,
                    -- onChannelList = onChannelList,
                    -- onOpenChannel = onOpenChannel,
                    -- onOpenPrivateChannel = onOpenPrivateChannel,
                    -- onOpenOwnPrivateChannel = onOpenOwnPrivateChannel,
                    -- onCloseChannel = onCloseChannel,
					onGameStart = online,
					onGameEnd = offline})
  -- topButton = modules.client_topmenu.addRightGameToggleButton('Pokedex',tr('Open pokedex'), 'dexicon.png', callpokedex)


  topButton2 =  modules.client_topmenu.addRightGameToggleButton('Pokeinfo', tr('Open poke info'), 'pokemon.png', callpokedata)

   

  -- consolePanel = g_ui.loadUI('console.otui', modules.game_interface.getBottomPanel())

  --consolePanel:setVisible(false)
  -- modules.game_interface.getBottomPanel():setVisible(true)



  -- consoleTextEdit = consolePanel:getChildById('consoleTextEdit')
  -- consoleContentPanel = consolePanel:getChildById('consoleContentPanel')
  -- consoleTabBar = consolePanel:getChildById('consoleTabBar')
  -- consoleTabBar:setContentWidget(consoleContentPanel)


	--consoleContentPanel:setVisible(false)

  -- channels = {}
  -- opacity = (g_settings.getNode('asdfchannel') or {[1]=1.0})
  -- opacity = opacity[1] or 1.0

  -- consolePanel:setOpacity(opacity)

  -- defaultTab = addTab(tr('Default'), true,true)
  -- serverTab = addTab(tr('Server Log'), false,true)

  -- g_keyboard.bindKeyPress('Shift+Up', function() navigateMessageHistory(1) end, consolePanel)

  -- g_keyboard.bindKeyPress('Shift+Down', function() navigateMessageHistory(-1) end, consolePanel)
  -- g_keyboard.bindKeyPress('Tab', function() consoleTabBar:selectNextTab() end, consolePanel)
  -- g_keyboard.bindKeyPress('Shift+Tab', function() consoleTabBar:selectPrevTab() end, consolePanel)
  -- g_keyboard.bindKeyDown('Enter', sendCurrentMessage, consolePanel)


  -- apply buttom functions after loaded
  -- consolePanel:getChildById('nextChannelButton').onClick = function() consoleTabBar:selectNextTab() end
  -- consolePanel:getChildById('prevChannelButton').onClick = function() consoleTabBar:selectPrevTab() end
  -- consoleTabBar.onTabChange = onTabChange



  -- tibia like hotkeys
  -- g_keyboard.bindKeyDown('Ctrl+O', g_game.requestChannels)
  -- g_keyboard.bindKeyDown('Ctrl+E', removeCurrentTab)
  -- g_keyboard.bindKeyDown('Ctrl+H', openHelp)


   g_keyboard.bindKeyPress('Ctrl+C',
    function()

		local buffer = consoleTabBar:getTabPanel(getCurrentTab()):getChildById('consoleBuffer')
		local count = buffer:getChildCount()
		for i=1,count do
			local c = buffer:getChildById('consoleLabel'..i)
			if c:hasSelection() then
				g_window.setClipboardText(c:getSelection())
				return true
			end
		end
				--[[label:setId('consoleLabel' .. )
				if not buffer:hasSelection() then return false end
				--g_window.buffer(label:getSelection())
				print("aee")]]
				return true
    end,consolePanel)


	-- Eoptions = g_settings.getNode('EmojiOptions') or{ignore=false}

  REPORTS = {}

		-- consoleToggleChat = consolePanel:getChildById('toggleChat')

    itemWidget = g_ui.createWidget('UIItem')
  itemWidget:setVirtual(true)
  itemWidget:setVisible(false)
  itemWidget:setFocusable(false)
  setPokeHP(0,1)
  -- toggleHeal(false)
  -- IGNORED= g_settings.getNode('IGNOREDSTUFF') or {}
  -- IGNOREPM= g_settings.getNode('IGNOREPM')


	-- table.sort(IGNORED)


end

-- function toggleChat()
  -- if consoleToggleChat:isChecked() then
    -- disableChat()
  -- else
    -- enableChat()
  -- end
-- end

-- function enableChat()
  -- local gameInterface = modules.game_interface

  -- consoleTextEdit:setVisible(true)
  -- consoleTextEdit:setText("")

  -- g_keyboard.unbindKeyUp("Space")
  -- g_keyboard.unbindKeyUp("Enter")

  -- gameInterface.unbindWalkKey("W")
  -- gameInterface.unbindWalkKey("D")
  -- gameInterface.unbindWalkKey("S")
  -- gameInterface.unbindWalkKey("A")

  -- consoleToggleChat:setTooltip(tr("Disable chat mode, allow to walk using ASDW"))
-- end

-- function disableChat()
  -- local gameInterface = modules.game_interface

  -- consoleTextEdit:setVisible(false)
  -- consoleTextEdit:setText("")

  -- local quickFunc = function()
    -- if consoleToggleChat:isChecked() then
      -- consoleToggleChat:setChecked(false)
    -- end
    -- enableChat()
  -- end
  -- g_keyboard.bindKeyUp("Space", quickFunc)
  -- g_keyboard.bindKeyUp("Enter", quickFunc)

  -- gameInterface.bindWalkKey("W", North)
  -- gameInterface.bindWalkKey("D", East)
  -- gameInterface.bindWalkKey("S", South)
  -- gameInterface.bindWalkKey("A", West)

  -- consoleToggleChat:setTooltip(tr("Enable chat mode"))
-- end


BLOCKWID = nil
LESELECTED = nil
-- function onClickIgnoreButton()
	-- if not BLOCKWID then
		-- BLOCKWID = g_ui.displayUI('blockeds.otui')
		-- local list = BLOCKWID:getChildById('listoza')

		-- for i,b in pairs(IGNORED) do
			-- local label = g_ui.createWidget('ReprList', list)
			-- label:setId("RP"..i)
			-- label:setColor("#ff0000")
			-- label:setText(i)

		-- end
		-- local label = g_ui.createWidget('ReprList', list)
		-- label:setId("RP6669")
		-- label:setColor("#ffffff")
		-- label:setText("--End--")
		-- LESELECTED = label

		-- local k = BLOCKWID:recursiveGetChildById('PMBAN')


		-- k:setChecked(IGNOREPM)


		-- connect(list, { onChildFocusChange =  function (self, focusedChild,old) LESELECTED = focusedChild end } )
	-- end


-- end
-- function toggleBan()
	-- if BLOCKWID then
		-- local k = BLOCKWID:recursiveGetChildById('PMBAN')
		-- IGNOREPM = not IGNOREPM
		-- k:setChecked(IGNOREPM)
		-- g_settings.setNode('IGNOREPM', IGNOREPM)
	-- end
-- end
-- function removeSelected()
	-- if LESELECTED:getText() ~= '--End--' then
		-- IGNORED[LESELECTED:getText()] = nil
		-- LESELECTED:destroy()

	-- end
	-- table.sort(IGNORED)
-- end
-- function deleteMe()
	-- if BLOCKWID then
		-- BLOCKWID:destroy()
		-- BLOCKWID = nil
	-- end
-- end
function toggleHeal(t)
    if pokeinfowindow then
		local buttom = pokeinfowindow:recursiveGetChildById('reala')

		buttom:setEnabled(t)


    end
end
function pressB(i)
	if i == 'b' then
		g_game.talk("!@pokebar@ 1")
	elseif i == 'c' then
		g_game.talk("correr")

	elseif i == 'h' then
		g_game.talk("h2")
	elseif i == 'm' then
		g_game.talk("h1")
	

	else

	itemWidget:setItemId(3453)
	modules.game_interface.startUseWith(itemWidget:getItem())

	end
end

function newClient()
g_game.talk("77CLI")
end

function pressA(i)
	g_game.talk("a"..i)
end
function togglebutton(i)
	if pokeinfowindow then
		if i then
			pokeinfowindow:recursiveGetChildById('locka'):setText("Call")
		else
			pokeinfowindow:recursiveGetChildById('locka'):setText("Call")

		end
	end
end
CURRENT_POKE = {' - ','-',0,0,100,0,7746,0,0,100,attr={}}
ATTRIBUTTES = {
	["RDI"]={self=1,"Use Ride",on=true},
	["TPR"]={"Teleport",callMenu=1,on=true},
	["LGT"]={"Use Flash",on=true,f=function() g_game.getProtocolGame():sendExtendedOpcode(5, "77FLSHPLS") end},
	["CUT"]={"Use cut",on=true},
	["DIG"]={"Use dig",on=true},
	["FLY"]={self=1,"Use fly",on=true},
	["RSM"]={"Use rock smash",on=true},
	["BLK"]={"Blink",on=true},
}
function removePokeAttr()
	CURRENT_POKE.attr = {}
	updateAttr()
end

function setPokeAttribute(var)
	CURRENT_POKE.attr[var] = true;

	updateAttr()
end
function setAttributeOnOff(var,bool)
	ATTRIBUTTES[var].on = bool
	updateAttr()
end
function updateAttr()
	if not pokeinfowindow then
		return
	end
	local content = pokeinfowindow:recursiveGetChildById('conditionPanel')
	for b,i in pairs(ATTRIBUTTES ) do
		local icon = content:getChildById(b)
		if icon then
			icon:destroy()
		end
		if CURRENT_POKE.attr[b] then

			local icon = g_ui.createWidget('ConditionWidget', content)
			icon:setId(b)

			if i.on then
				icon:setImageSource("special/"..b..".png")
			else
				icon:setImageSource("special/"..b.."of.png")

			end

			if i.on then
				icon:setTooltip(tr(i[1]))
				icon.onClick = function()
					if i.f then
						i.f();
					elseif i.self and i.on then

						g_game.useInventoryItemWith(3453, g_game.getLocalPlayer())
					elseif not i.wait and not i.callMenu then
						itemWidget:setItemId(3453)
						modules.game_interface.startUseWith(itemWidget:getItem())
					elseif i.wait and i.on then
						modules.game_interface.callSurfAuto()
					elseif i.callMenu then
						local menu = g_ui.createWidget('PopupMenu')
						
						

						-- for i,b in pairs(modules.client_extended.GLOBAL_CITY) do
							-- menu:addOption(i:sub(1,1):upper()..i:sub(2,-1), function() g_game.talk("!teleport \""..i:sub(1,1):upper()..i:sub(2,-1)) end)
							menu:addOption("House", function() g_game.talk("!\house") end)
							menu:addOption("<============= Free =============>")
							menu:addOption("Cerulean", function() g_game.talk("!teleport \cerulean") end)
							menu:addOption("Lavender", function() g_game.talk("!teleport \lavender") end)
							menu:addOption("Fuchsia", function() g_game.talk("!teleport \Fuchsia") end)
							menu:addOption("Celadon", function() g_game.talk("!teleport \celadon") end)
							menu:addOption("Viridian", function() g_game.talk("!teleport \Viridian") end)
							menu:addOption("Vermilion", function() g_game.talk("!teleport \Vermilion") end)
							menu:addOption("Pewter", function() g_game.talk("!teleport \pewter") end)
							menu:addOption("Cinnabar", function() g_game.talk("!teleport \cinnabar") end)
							menu:addOption("Pallet", function() g_game.talk("!teleport \pallet") end)
							menu:addOption("Saffron", function() g_game.talk("!teleport \saffron") end)
							menu:addOption("<============= VIP ==============>")
							menu:addOption("Goldenrod", function() g_game.talk("!teleport \goldenrod") end)
							menu:addOption("Azalea", function() g_game.talk("!teleport \Azalea") end)
							menu:addOption("Ecruteak", function() g_game.talk("!teleport \ecruteak") end)
							menu:addOption("Olivine", function() g_game.talk("!teleport \olivine") end)
							menu:addOption("Violet", function() g_game.talk("!teleport \Violet") end)
							menu:addOption("Cherrygrove", function() g_game.talk("!teleport \cherrygrove") end)
							menu:addOption("New Bark", function() g_game.talk("!teleport New Bark") end)
							menu:addOption("Mahogany", function() g_game.talk("!teleport \mahogany") end)
							menu:addOption("Larosse", function() g_game.talk("!teleport \larosse") end)
							menu:addOption("Orre", function() g_game.talk("!teleport \orre") end)
							menu:addOption("Canavale", function() g_game.talk("!teleport \canavale") end)
							menu:addOption("Singer", function() g_game.talk("!teleport \singer") end)
							menu:addOption("Hunter Village", function() g_game.talk("!teleport \hunter village") end)
							menu:addOption("Sunshine", function() g_game.talk("!teleport \sunshine") end)
							menu:addOption("Batlle City", function() g_game.talk("!teleport battle city") end)
							menu:addOption("Blackthorn", function() g_game.talk("!teleport \Black city") end)
						-- end
						menu:display(mousePos)

					end
				end
			else
				-- icon:setTooltip(tr("You cannot").." "..tr(i[1]).." "..tr("right now"))
			end
		end
	end
end

-- function onWalk(dir,dash)
	-- if modules.game_interface.isSurfAble(dir) then
		-- modules.game_interface.showSurf();
	-- else
		-- modules.game_interface.hideSurf()
	-- end
-- end

function leCloseButton()
	topButton2:setOn(false)
end

function callpokedata(id)
	if topButton2:isOn() and id ~= 4 or id == 5 then
		if not pokeinfowindow then
			pokeinfowindow = g_ui.loadUI('pokedata.otui',modules.game_interface.getRightPanel());
			pokeinfowindow:disableResize()
			pokeinfowindow:setup()
		end
		pokeinfowindow:close()
		topButton2:setOn(false)
	else
		if pokeinfowindow == nil then
			pokeinfowindow = g_ui.loadUI('pokedata.otui',modules.game_interface.getRightPanel());
			pokeinfowindow:disableResize()
			pokeinfowindow:setup()

		else
			pokeinfowindow:open()
		end
	    setPokeInfo(unpack(CURRENT_POKE))
		topButton2:setOn(true)
	end
end



-- function callpokedex()
	-- if pokedex_UI then
		-- pokedex_UI:destroy()
		-- pokedex_UI = nil
		-- topButton:setOn(false)
	-- else
		-- doOpenDex()
	-- openDex(data)
	-- g_game.talk("*s*% ")
	-- g_game.getProtocolGame():sendExtendedOpcode(5, "77D")
	-- end
	-- if pokedex_UI then
		-- local loc= modules.client_locales.getCurrentLocale().name

		-- pokedex_UI:getChildById('lecloselol'):setImageSource(loc..".png")
	-- end
-- end

function terminate()



  disconnect(g_game, { 
  -- onTalk = onTalk,
  -- onEditText = onGameEditText,
    -- onWalk = onWalk,
                       -- onChannelList = onChannelList,
                       -- onOpenChannel = onOpenChannel,
                       -- onOpenPrivateChannel = onOpenPrivateChannel,
                       -- onOpenOwnPrivateChannel = onOpenPrivateChannel,
                       -- onCloseChannel = onCloseChannel,
                       onGameStart = online,
                       onGameEnd = offline })

  if g_game.isOnline() then offline() end

  -- g_keyboard.unbindKeyDown('Ctrl+O')
  -- g_keyboard.unbindKeyDown('Ctrl+E')
  -- g_keyboard.unbindKeyDown('Ctrl+H')
   itemWidget:destroy()
   if BLOCKWID then
	BLOCKWID:destroy()
   end

  if channelsWindow then
    channelsWindow:destroy()
    channelsWindow = nil
  end
	-- if pokedex_UI then
		-- pokedex_UI:destroy()
		-- pokedex_UI = nil
		-- topButton:setOn(false)
	-- end
	if Rep_window then
		Rep_window:destroy()
		Rep_window = nil
	end
	if EmojiW then
		EmojiW:destroy()
		EmojiW = nil
	end
  consolePanel:destroy()
  topButton:destroy()
  topButton2:destroy()
  topButton = nil
  topButton2 = nil
  consolePanel = nil
  consoleTextEdit = nil
  consoleContentPanel = nil
  consoleTabBar = nil
	if LEFIND then
		LEFIND:destroy();
		LEFIND = nil
	end
  ownPrivateName = nil

  Console = nil
end
local function tabBlink(tab)
  if not tab.blinking then return end
  tab:setOn(not tab:isOn())
  tab:setColor("#ff5555")
  tab.blinkEvent = scheduleEvent(function() tabBlink(tab) end, 500)
end

function blinkTab(tab)



  if tab:isChecked() or tab.blinking then return end
  tab.blinking = true
  tabBlink(tab)
end

function setPokeExp(lvl,exp,next,naw)
	if not pokeinfowindow then
		return
	end
	CURRENT_POKE[9] = lvl;
	CURRENT_POKE[10] = exp;
	CURRENT_POKE[11] = next;
	CURRENT_POKE[12] = naw;
	if exp == next then
		pokeinfowindow:recursiveGetChildById('SL'):setTooltip(tr("Exp: %d/%d",exp,next))
	else
		pokeinfowindow:recursiveGetChildById('SL'):setTooltip(tr("Exp: %d/%d you need %d to go.",exp,next,(next-exp)))
	end
	pokeinfowindow:recursiveGetChildById('fishbar'):setPercent(((exp-naw)/(next-naw))*100)
	pokeinfowindow:recursiveGetChildById('fishbar2'):setText(exp.."/"..next)
	pokeinfowindow:recursiveGetChildById('fishbar2'):setTooltip(tr("Exp: %d/%d you need %d to go.",exp,next,(next-exp)))
end


function setPokeHP(hp,max)
	CURRENT_POKE[4] = hp;
	CURRENT_POKE[5] = max;
	if not pokeinfowindow then
		return
	end
	if max == 0 then
		max = 1
		hp = 1
	end
	pokeinfowindow:recursiveGetChildById('bar'):setPercent((hp/max)*100)
	pokeinfowindow:recursiveGetChildById('bar'):setTooltip(hp.."/"..max)
end

function setPokeInfo(name,nick,boost,hp,max,addons,port,level,exp,next,naw,port2)

	if (name ~= CURRENT_POKE[1]) then
		CURRENT_POKE = {name,nick,boost,hp,max,addons,port,level,exp,next,naw,attr={}}
	end
	if not pokeinfowindow then
		return
	end

	if max == 0 then
		max = 1
		hp = 1
	end
	naw = naw or 0
	if exp == next then
		pokeinfowindow:recursiveGetChildById('SL'):setTooltip(tr("Exp: %d/%d",exp,next))
	else
		pokeinfowindow:recursiveGetChildById('pwin'):setTooltip(tr("Exp: %d/%d you need %d to go.",exp,next,(next-exp)))
	end

	pokename = nick
	
	
	local image = "/modules/game_console/pokes/"..pokename..".png"
	
	pokeinfowindow:recursiveGetChildById('SL'):setItemId(tonumber(port2))
	pokeinfowindow:recursiveGetChildById('hpp'):setText(string.format("%.1d",((hp/max)*100)).."%")
	pokeinfowindow:recursiveGetChildById('bar'):setPercent((hp/max)*100)
	pokeinfowindow:recursiveGetChildById('bar2'):setTooltip(hp.."/"..max)
	pokeinfowindow:recursiveGetChildById('fishbar'):setPercent(((exp)/(next))*100)
	pokeinfowindow:recursiveGetChildById('fishbar2'):setFont("terminus-10px")
	-- pokeinfowindow:recursiveGetChildById('fishbar'):setText(exp.." / "..next)
	pokeinfowindow:recursiveGetChildById('nome'):setText(string.format("%s",(nick ~='-' and nick:sub(1,1):upper()..nick:sub(2,-1) or name:sub(1,1):upper()..name:sub(2,-1)) ) )
	pokeinfowindow:recursiveGetChildById('expp'):setText(string.format("%.1d",((exp/next)*100)).."%")
	-- pokeinfowindow:recursiveGetChildById('fishbar'):setTooltip(tr("Exp: %d/%d you need %d to go.",exp,next,(next-exp)))
	pokeinfowindow:recursiveGetChildById('fishbar2'):setTooltip(tr("Exp: %d/%d you need %d to go.",exp,next,(next-exp)))
end

function ignoreEmojis(self)
	self:setChecked(not self:isChecked())
	Eoptions.ignore = EmojiW:getChildById('ignore'):isChecked()
	g_settings.setNode('EmojiOptions',Eoptions)
end
function emoticons()
	if EmojiW then
		EmojiW:destroy()
	end
	EmojiW = g_ui.displayUI('showemo.otui')
	if not EmojiW then
		return
	end


	img = EmojiW:getChildById('img')
	for i,b in pairs(EMOTICONS) do
		local questLabel = g_ui.createWidget('UIItem', img)
		questLabel:setImageSource('emoticons/'..b..'.png')
		questLabel:setHeight(14)
		questLabel:setWidth(14)
		questLabel.itemName = i
		questLabel:setId("C"..i)

		--[[questLabel:getChildById("jaaj"):setItemId(b['2'])
		questLabel.onMouseRelease = function(self, mousePos, mouseButton)
			leMeni(self, mousePos, mouseButton,questLabel,i)
		end]]
	end
	name = EmojiW:getChildById('name')
	for i,b in pairs(EMOTICONS) do
		local questLabel = g_ui.createWidget('UIItem', name)
		questLabel:setText(i)
		questLabel:setHeight(14)

		--[[questLabel:getChildById("jaaj"):setItemId(b['2'])
		questLabel.onMouseRelease = function(self, mousePos, mouseButton)
			leMeni(self, mousePos, mouseButton,questLabel,i)
		end]]
	end


	EmojiW.onDestroy = function()
		lootWindow = nil
	end
	EmojiW:getChildById('ignore'):setChecked(Eoptions.ignore )

end

function onTabChange(tabBar, tab)
  if tab == defaultTab or tab == serverTab then
    consolePanel:getChildById('closeChannelButton'):disable()
    consolePanel:getChildById('saveChannel'):disable()
  else
    consolePanel:getChildById('saveChannel'):enable()
    consolePanel:getChildById('closeChannelButton'):enable()
  end
end

function offline()
  if pokeinfowindow then
	pokeinfowindow:destroy()
	pokeinfowindow = nil
  end
  -- save last open channels
  -- if pokedex_UI then
		-- pokedex_UI:destroy()
		-- pokedex_UI = nil
		-- topButton:setOn(false)
	-- end
		if Rep_window then
		Rep_window:destroy()
		Rep_window = nil
	end
  local lastChannelsOpen = g_settings.getNode('lastChannelsOpen') or {}
  local char = g_game.getLocalPlayer():getName() --g_game.getLocalPlayer():setStatus(2)
  local savedChannels = {}
  local set = false
  --for channelId, channelName in pairs(channels) do
    --if type(channelId) == 'number' then
      --savedChannels[channelName] = channelId
      --set = true
    --end
  --end
  if set then
    lastChannelsOpen[char] = savedChannels
  else
    lastChannelsOpen[char] = nil
  end
  g_settings.setNode('lastChannelsOpen', lastChannelsOpen)

  -- close channels
  --for _, channelName in pairs(channels) do
    --local tab = consoleTabBar:getTab(channelName)
    --consoleTabBar:removeTab(tab)
  --end
  channels = {}

  --serverTab.tabPanel:getChildById('consoleBuffer'):destroyChildren()

  --local npcTab = consoleTabBar:getTab('NPCs')
  if npcTab then
    --consoleTabBar:removeTab(npcTab)
  end

  --consoleTextEdit:clearText()

  if channelsWindow then
    channelsWindow:destroy()
    channelsWindow = nil
  end
end


function setTextEditText(text)
  consoleTextEdit:setText(text)
  for i=1,#text do
		consoleTextEdit:moveCursorHorizontally(true)
  end

end

function openHelp()
  g_game.joinChannel(HELP_CHANNEL)
end

function addTab(name, focus,notClose)
  -- local tab = getTab(name)
  if(tab) then -- is channel already open
    if(not focus) then focus = true end
  else
    -- tab = consoleTabBar:addTab(name)
  end
  if focus then
    consoleTabBar:selectTab(tab)
  elseif not serverTab or name ~= serverTab:getText() then
    consoleTabBar:blinkTab(tab)
  end
  --tab:setWidth(math.min(130,tab:getWidth()));
  tab.notclose = notClose
  return tab
end

function removeCurrentTab()
  local tab = consoleTabBar:getCurrentTab()
  if tab == defaultTab or tab == serverTab then return end

  -- notificate the server that we are leaving the channel
  if tab.channelId then
    for k, v in pairs(channels) do
      if (k == tab.channelId) then channels[k] = nil end
    end
    g_game.leaveChannel(tab.channelId)
  elseif tab:getText() == "NPCs" then
    g_game.closeNpcChannel()
  end

  consoleTabBar:removeTab(tab)
end

function saveChannels()
  local tab = consoleTabBar:getCurrentTab()
  if tab == defaultTab or tab == serverTab then return end
  local name = tab:getText()
  if MSGS[name] then
	local f = io.open(name.." "..os.date("%d-%m-%y-%H-%M-%S",os.time()).. "- Save.txt",'a+')
	if f then
		modules.game_textmessage.displayMessage(MessageModes.Login, "Saved on file ".."saves\\" ..(name.." - Save.txt").."")
		f:write(os.date("Saved at: %d/%m/%y  %H:%M:%S\n",os.time()))
		for i,b in pairs(MSGS[name]) do
			f:write(b..'\n')
		end
		f:write("End\n")
		f:close()
	end
  end


end


function getTab(name)
  -- return consoleTabBar:getTab(name)
end

function getCurrentTab()
  return consoleTabBar:getCurrentTab()
end

function addChannel(name, id)
  channels[id] = name
  local tab = addTab(name, true)
  tab.channelId = id
  return tab
end

function addPrivateChannel(receiver)
  channels[receiver] = receiver
  return addTab(receiver, true)
end

function addPrivateText(text, speaktype, name, isPrivateCommand, creatureName)
  local focus = false
  if speaktype.npcChat then
    name = 'NPCs'
    focus = true
  end
  local privateTab = getTab(name)
  if privateTab == nil then
    if (modules.client_options.getOption('showPrivateMessagesInConsole') and not focus) or (isPrivateCommand and not privateTab) then
      privateTab = defaultTab
    else
      privateTab = addTab(name, focus)
      channels[name] = name
    end
    privateTab.npcChat = speaktype.npcChat
  elseif focus then
    consoleTabBar:selectTab(privateTab)
  end
  if not MSGS[name] then
	MSGS[name] = {}
  end
  MSGS[name][#MSGS[name]+1] = os.date('%H:%M')..' '..text
  addTabText(text, speaktype, privateTab, creatureName)
end

MSGS={}
function addText(text, speaktype, tabName, creatureName)
  local tab = getTab(tabName)
  if tab ~= nil then

	if not MSGS[tabName] then
		MSGS[tabName] = {}
	end
	MSGS[tabName][#MSGS[tabName]+1] = os.date('%H:%M')..' '..text
	if IGNORED[creatureName] then

		return --ignored
	end
    addTabText(text, speaktype, tab, creatureName)
  end
end


local letterWidth = {  -- New line (10) and Space (32) have width 1 because they are printed and not replaced with spacer
  [10] = 1, [32] = 1, [33] = 3, [34] = 6, [35] = 8, [36] = 7, [37] = 13, [38] = 9, [39] = 3, [40] = 5, [41] = 5, [42] = 6, [43] = 8, [44] = 4, [45] = 5, [46] = 3, [47] = 8,
  [48] = 7, [49] = 6, [50] = 7, [51] = 7, [52] = 7, [53] = 7, [54] = 7, [55] = 7, [56] = 7, [57] = 7, [58] = 3, [59] = 4, [60] = 8, [61] = 8, [62] = 8, [63] = 6,
  [64] = 10, [65] = 9, [66] = 7, [67] = 7, [68] = 8, [69] = 7, [70] = 7, [71] = 8, [72] = 8, [73] = 5, [74] = 5, [75] = 7, [76] = 7, [77] = 9, [78] = 8, [79] = 8,
  [80] = 7, [81] = 8, [82] = 8, [83] = 7, [84] = 8, [85] = 8, [86] = 8, [87] = 12, [88] = 8, [89] = 8, [90] = 7, [91] = 5, [92] = 8, [93] = 5, [94] = 9, [95] = 8,
  [96] = 5, [97] = 7, [98] = 7, [99] = 6, [100] = 7, [101] = 7, [102] = 5, [103] = 7, [104] = 7, [105] = 3, [106] = 4, [107] = 7, [108] = 3, [109] = 11, [110] = 7,
  [111] = 7, [112] = 7, [113] = 7, [114] = 6, [115] = 6, [116] = 5, [117] = 7, [118] = 8, [119] = 10, [120] = 8, [121] = 8, [122] = 6, [123] = 7, [124] = 4, [125] = 7, [126] = 8,
  [127] = 1, [128] = 7, [129] = 6, [130] = 3, [131] = 7, [132] = 6, [133] = 11, [134] = 7, [135] = 7, [136] = 7, [137] = 13, [138] = 7, [139] = 4, [140] = 11, [141] = 6, [142] = 6,
  [143] = 6, [144] = 6, [145] = 4, [146] = 3, [147] = 7, [148] = 6, [149] = 6, [150] = 7, [151] = 10, [152] = 7, [153] = 10, [154] = 6, [155] = 5, [156] = 11, [157] = 6, [158] = 6,
  [159] = 8, [160] = 4, [161] = 3, [162] = 7, [163] = 7, [164] = 7, [165] = 8, [166] = 4, [167] = 7, [168] = 6, [169] = 10, [170] = 6, [171] = 8, [172] = 8, [173] = 16, [174] = 10,
  [175] = 8, [176] = 5, [177] = 8, [178] = 5, [179] = 5, [180] = 6, [181] = 7, [182] = 7, [183] = 3, [184] = 5, [185] = 6, [186] = 6, [187] = 8, [188] = 12, [189] = 12, [190] = 12,
  [191] = 6, [192] = 9, [193] = 9, [194] = 9, [195] = 9, [196] = 9, [197] = 9, [198] = 11, [199] = 7, [200] = 7, [201] = 7, [202] = 7, [203] = 7, [204] = 5, [205] = 5, [206] = 6,
  [207] = 5, [208] = 8, [209] = 8, [210] = 8, [211] = 8, [212] = 8, [213] = 8, [214] = 8, [215] = 8, [216] = 8, [217] = 8, [218] = 8, [219] = 8, [220] = 8, [221] = 8, [222] = 7,
  [223] = 7, [224] = 7, [225] = 7, [226] = 7, [227] = 7, [228] = 7, [229] = 7, [230] = 11, [231] = 6, [232] = 7, [233] = 7, [234] = 7, [235] = 7, [236] = 3, [237] = 4, [238] = 4,
  [239] = 4, [240] = 7, [241] = 7, [242] = 7, [243] = 7, [244] = 7, [245] = 7, [246] = 7, [247] = 9, [248] = 7, [249] = 7, [250] = 7, [251] = 7, [252] = 7, [253] = 8, [254] = 7, [255] = 8
}

function getHighlightedText(text)
  local tmpData = {}

  repeat
    local tmp = {string.find(text, "{([^}]+)}", tmpData[#tmpData-1])}
    for _, v in pairs(tmp) do
      table.insert(tmpData, v)
    end
  until not(string.find(text, "{([^}]+)}", tmpData[#tmpData-1]))

  return tmpData
end


function addTabText(text, speaktype, tab, creatureName)

  if not tab or tab.locked or not text or #text == 0 then return end

  if modules.client_options.getOption('showTimestampsInConsole') then
    text = os.date('%H:%M') .. ' ' .. text
  end



  local panel = consoleTabBar:getTabPanel(tab)
  local consoleBuffer = panel:getChildById('consoleBuffer')
  local label = g_ui.createWidget('ConsoleLabel', consoleBuffer)
  label:setId('consoleLabel' .. (consoleBuffer:getChildCount()-1))

  label:setColor(speaktype.color)
	label.tex = text
  blinkTab(tab)


  -- Overlay for consoleBuffer which shows highlighted words only

	if speaktype.npcChat and (g_game.getLocalPlayer():getName() ~= creatureName or g_game.getLocalPlayer():getName() == 'Account Manager') then
		local highlightData = getHighlightedText(text)
		if #highlightData > 0 then
			local labelHighlight = g_ui.createWidget('ConsolePhantomLabel', label)
			labelHighlight:fill('parent')
			labelHighlight:setId('consoleLabelHighlight' .. consoleBuffer:getChildCount())
			labelHighlight:setColor("#1f9ffe")

			-- Remove the curly braces
			for i = 1, #highlightData / 3 do
				local dataBlock = { _start = highlightData[(i-1)*3+1], _end = highlightData[(i-1)*3+2], words = highlightData[(i-1)*3+3] }
				text = text:gsub("%{(.-)%}", dataBlock.words, 1)

				-- Recalculate positions as braces are removed
				highlightData[(i-1)*3+1] = dataBlock._start - ((i-1) * 2)
				highlightData[(i-1)*3+2] = dataBlock._end - (1 + (i-1) * 2)
			end
			label:setText(text)

			-- Calculate the positions of the highlighted text and fill with string.char(127) [Width: 1]
			local drawText = label:getDrawText()
			local tmpText = ""
			for i = 1, #highlightData / 3 do
				local dataBlock = { _start = highlightData[(i-1)*3+1], _end = highlightData[(i-1)*3+2], words = highlightData[(i-1)*3+3] }
				local lastBlockEnd = (highlightData[(i-2)*3+2] or 1)

				for letter = lastBlockEnd, dataBlock._start-1 do
				local tmpChar = string.byte(drawText:sub(letter, letter))
				local fillChar = (tmpChar == 10 or tmpChar == 32) and string.char(tmpChar) or string.char(127)

				tmpText = tmpText .. string.rep(fillChar, letterWidth[tmpChar])
			end
			tmpText = tmpText .. dataBlock.words
		end

		-- Fill the highlight label to the same size as default label
		local finalBlockEnd = (highlightData[(#highlightData/3-1)*3+2] or 1)
		for letter = finalBlockEnd, drawText:len() do
			local tmpChar = string.byte(drawText:sub(letter, letter))
			local fillChar = (tmpChar == 10 or tmpChar == 32) and string.char(tmpChar) or string.char(127)
			tmpText = tmpText .. string.rep(fillChar, letterWidth[tmpChar])
		end

		labelHighlight:setText(tmpText)
		--[[labelHighlight.onMouseRelease = function (self, mousePos, mouseButton)
				local speaktype = SpeakTypesSettings['privatePlayerToNpc']
				local player = g_game.getLocalPlayer()
				g_game.talkPrivate(11, "NPCs", tmpText)
				local panel = consoleTabBar:getTabPanel(tab)
				local consoleBuffer = panel:getChildById('consoleBuffer')
				local labela = g_ui.createWidget('ConsoleLabel2', consoleBuffer)
				local label = g_ui.createWidget('ConsoleLabel', labela)
				label:setText(os.date('%H:%M') .. ' ' .. tmpText)
				label:setColor(speaktype.color)
			end]]
		else
			label:setText(text)
		end
	else

		local f = findEmoticons(text);

		if #f == 0 then

			label:setText(text)
		else
			--Insert emoticons
			local fisrt = true;
			for i,b in pairs(f) do
				local child = g_ui.createWidget('ConsolePhantomLabelEmoticon', label)
				child:setId('consoleLabel' .. label:getChildCount())
				child:setColor(speaktype.color)
				child:setText(text:sub((fisrt and 0 or f[i-1][2])+1,b[1]-1))
				fisrt = false

				if b[6] then
					local child2 = g_ui.createWidget('ConsolePhantomLabelEmoticon', label)
					child2:setId('consoleLabel' .. label:getChildCount())
					child2:setColor("#"..b[4]..b[5]..b[6]..b[7]..b[8]..b[9])
					child2:setText(b[10])

				else
					local child2 = g_ui.createWidget('ConsolePhantomLabelEmoticonImg', label)
					child2:setId('consoleLabel' .. label:getChildCount())
					--child2:setText(text:sub(b[1],b[2]))


					child2:setImageSource('emoticons/'..EMOTICONS[text:sub(b[1],b[2])]..'.png')
				end


			end
			if f[#f][2] < text:len() then
				local child2 = g_ui.createWidget('ConsolePhantomLabelEmoticon', label)
				child2:setId('consoleLabel' .. label:getChildCount())
				child2:setColor(speaktype.color)
				child2:setText(text:sub(f[#f][2]+1,-1))
			end

		end

 end

label:clearMultiColorAttr()
  
  if speaktype.consoleTab == "Server Log" and speaktype.screenTarget and speaktype.screenTarget == "highCenterLabel" then
    local isMultiColor = false

    local initPos = {}
    local lastPos = {}
    local item = {}
    local color = {}

    if label:getText():match("You see") then
      if not text:match("You see yourself") then
        item[1] = label:getText():match("You see ([%d%w%s+-%p\'\{\}]*)")
        if item[1] then
          isMultiColor = true
          initPos[1], lastPos[1] = label:getText():find(item[1])
          color[1] = modules.game_textmessage.getColorByItemName(item[1])
        end
      end
    elseif label:getText():lower():match("loot of") then
      for k,v in pairs(modules.game_textmessage.getItemsFromLootString(label:getText())) do
        table.insert(item, v)
      end

      if #item > 0 then
        isMultiColor = true
      end

      for k,v in pairs(item) do
        initPos[k], lastPos[k] = label:getText():find(v)
        color[k] = modules.game_textmessage.getColorByItemName(item[k])
      end
    end

    
	
    if isMultiColor and #item > 0 then  
      label:setMultiColor(isMultiColor)
    end

    if isMultiColor then
      for i=1, #item do
        if initPos[i] and item[i] and color[i] then
          label:addMultiColorTextPosition(initPos[i]-1)
          label:addMultiColorTextLength(item[i]:len())
          label:addColor(color[i])
        end
      end
    end
  end

  label.name = creatureName
  label.onMouseRelease = function (self, mousePos, mouseButton)
    processMessageMenu(mousePos, mouseButton, creatureName, text, self, tab)
  end

   --g_window.setClipboardText(label:hasSelection()) moq

  if consoleBuffer:getChildCount() > MAX_LINES then
    consoleBuffer:getFirstChild():destroy()
  end
end

function addTabTextNpc(text, speaktype, tab, creatureName)
	local panel = consoleTabBar:getTabPanel(tab)
	local consoleBuffer = panel:getChildById('consoleBuffer')
	local txt2= ''
	local kk = 6
	if text:len() >math.floor(consoleBuffer:getWidth()/kk) then
		txt2 = text:sub(math.floor(consoleBuffer:getWidth()/kk),text:len())
		text = text:sub(1,math.floor(consoleBuffer:getWidth()/kk))..'-'
	end

  if modules.client_options.getOption('showTimestampsInConsole') then
    text = os.date('%H:%M') .. ' ' .. text
  end

  local panel = consoleTabBar:getTabPanel(tab)


  local labela = g_ui.createWidget('ConsoleLabel2', consoleBuffer)

  labela:setId('consoleLabel' .. panel:getChildCount())

	if text:find("{.-}") then

		local first = true
		local last = ''
		for i,b in text:gmatch("(.-){(.-)}") do
			local label;
			if first then
				label = g_ui.createWidget('ConsoleLabel', labela)
				label:setText(i)
				label:setColor(speaktype.color)
				first = false
			else
				label = g_ui.createWidget('ConsoleLabelColor', labela)
				label:setText(i)
				label:setColor(speaktype.color)
			end
			if b then
				label = g_ui.createWidget('ConsoleLabelColor', labela)
				label:setText(b)
				label:setColor("#9F9DFF")

				last = b
			end


		end
		local label = g_ui.createWidget('ConsoleLabelColor', labela)
		label:setText(text:match('{'..last..'}(.+)'))
		label:setColor(speaktype.color)


	else
	  local label = g_ui.createWidget('ConsoleLabel', labela)
	  label:setText(text)
  if not MSGS[tab:getText()] then
	MSGS[tab:getText()] = {}
  end
  MSGS[tab:getText()][#MSGS[tab:getText()]+1] = text
	  label:setColor(speaktype.color)
	end
     --consoleTabBar:blinkTab(tab)



  if consoleBuffer:getChildCount() > MAX_LINES then
    consoleBuffer:getFirstChild():destroy()
  end
  if (txt2:len() > 2) then
	addTabTextNpc(txt2, speaktype, tab, creatureName)
  end
end

IGNORED = {}


function popupMenu(mousePos, mouseButton, creatureName, text,isNpc)
  if mouseButton == MouseRightButton then
    local menu = g_ui.createWidget('PopupMenu')
    if creatureName then

      if creatureName ~= g_game.getLocalPlayer():getName()and not isNpc then
		menu:addOption(tr('Message to ' .. creatureName), function () g_game.openPrivateChannel(creatureName) end)
        if (not Player:hasVip(creatureName)) then

          menu:addOption(tr('Add to VIP list'), function () g_game.addVip(creatureName) end)
		  menu:addOption(tr('Report'), function () modules.game_playerreport.show(creatureName,nil,true) end)
        end
		        if modules.game_console.getOwnPrivateTab() then
          menu:addSeparator()
          menu:addOption(tr('Invite to private chat'), function() g_game.inviteToOwnChannel(creatureName) end)
          menu:addOption(tr('Exclude from private chat'), function() g_game.excludeFromOwnChannel(creatureName) end)
        end
        -- TODO ignore creatureName
        menu:addSeparator()
      end
      --TODO select all
      menu:addOption(tr('Copy message'), function () g_window.setClipboardText(text) end)
      if modules.game_ruleviolation.hasWindowAccess() and not isNpc then
        menu:addSeparator()
        menu:addOption(tr('Rule Violation'), function() local k = text:match('.+%:%s(.+)'); modules.game_ruleviolation.show(creatureName, k ,true) end)
      end

      menu:addSeparator()
      menu:addOption(tr('Copy name'), function () g_window.setClipboardText(creatureName) end)
      menu:addOption(tr((IGNORED[creatureName] and tr("Unignore") or tr("Ignore"))..' '..creatureName), function ()
		--ignore
		IGNORED[creatureName] = IGNORED[creatureName] and nil or true
	  end)
    else
      --TODO select all
      menu:addOption(tr('Copy message'), function () g_window.setClipboardText(text) end)
    end
    menu:display(mousePos)
  end

end



-- function processMessageMenu(mousePos, mouseButton, creatureName, text, label, tab)
  -- if mouseButton == MouseRightButton then
    -- local menu = g_ui.createWidget('PopupMenu')
    -- if creatureName and #creatureName > 0 then
      -- if creatureName ~= g_game.getLocalPlayer():getName() then
        -- menu:addOption(tr('Message to ' .. creatureName), function () g_game.openPrivateChannel(creatureName) end)
        -- if not g_game.getLocalPlayer():hasVip(creatureName) then
          -- menu:addOption(tr('Add to VIP list'), function () g_game.addVip(creatureName) end)
        -- end
        -- if modules.game_console.getOwnPrivateTab() then
          -- menu:addSeparator()
          -- menu:addOption(tr('Invite to private chat'), function() g_game.inviteToOwnChannel(creatureName) end)
          -- menu:addOption(tr('Exclude from private chat'), function() g_game.excludeFromOwnChannel(creatureName) end)
        -- end
        -- menu:addOption(tr((IGNORED[creatureName] and tr("Unignore") or tr("Ignore"))..' '..creatureName), function ()
		-- ignore
		-- IGNORED[creatureName] = IGNORED[creatureName] and nil or true
	  -- end)
        -- menu:addSeparator()
      -- end
      -- if modules.game_ruleviolation.hasWindowAccess() then
        -- menu:addOption(tr('Rule Violation'), function() modules.game_ruleviolation.show(creatureName, text:match('.+%:%s(.+)')) end)
        -- menu:addSeparator()
      -- end

      -- menu:addOption(tr('Copy name'), function () g_window.setClipboardText(creatureName) end)
    -- end
    -- if label:hasSelection() then
      -- menu:addOption(tr('Copy'), function() g_window.setClipboardText(label:getSelection()) end, '(Ctrl+C)')
    -- end
    -- menu:addOption(tr('Copy message'), function() g_window.setClipboardText(text) end)
    -- menu:addOption(tr('Select all'), function() label:selectAll() end)
    -- if tab.violations then
      -- menu:addSeparator()
      -- menu:addOption(tr('Process') .. ' ' .. creatureName, function() processViolation(creatureName, text) end)
      -- menu:addOption(tr('Remove') .. ' ' .. creatureName, function() g_game.closeRuleViolation(creatureName) end)
    -- end
    -- menu:display(mousePos)
  -- end
-- end



-- function getRuleViolationsTab()
  -- if violationsChannelId then
    -- return getChannelTab(violationsChannelId)
  -- end
  -- return nil
-- end

-- function sendCurrentMessage()
  -- local message = consoleTextEdit:getText()
  -- if #message == 0 then return end
  -- consoleTextEdit:clearText()

  -- send message
  -- sendMessage(message)
-- end


-- function sendMessage(message, tab)
  -- local tab = tab or getCurrentTab()
  -- if not tab then return end

  -- for k,func in pairs(filters) do
    -- if func(message) then
      -- return true
    -- end
  -- end

  -- when talking on server log, the message goes to default channel
  -- local name = tab:getText()
  -- if tab == serverTab or tab == getRuleViolationsTab() then
    -- tab = defaultTab
    -- name = defaultTab:getText()
  -- end

  -- handling chat commands
  -- local channel = tab.channelId
  -- local originalMessage = message
  -- local chatCommandSayMode
  -- local chatCommandPrivate
  -- local chatCommandPrivateReady
  -- local chatCommandMessage

  -- player used yell command
  -- chatCommandMessage = message:match("^%#[y|Y] (.*)")
  -- if chatCommandMessage ~= nil then
    -- chatCommandSayMode = 'yell'
    -- channel = 0
    -- message = chatCommandMessage
  -- end

   -- player used whisper
  -- local chatCommandMessage = message:match("^%#[w|W] (.*)")
  -- if chatCommandMessage ~= nil then
    -- chatCommandSayMode = 'whisper'
    -- message = chatCommandMessage
    -- channel = 0
  -- end

  -- player say
  -- local chatCommandMessage = message:match("^%#[s|S] (.*)")
  -- if chatCommandMessage ~= nil then
    -- chatCommandSayMode = 'say'
    -- message = chatCommandMessage
    -- channel = 0
  -- end

  -- local findIni, findEnd, chatCommandInitial, chatCommandPrivate, chatCommandEnd, chatCommandMessage = message:find("([%*%@])(.+)([%*%@])(.*)")
  -- if findIni ~= nil and findIni == 1 then -- player used private chat command
    -- if chatCommandInitial == chatCommandEnd then
      -- chatCommandPrivateRepeat = false
      -- if chatCommandInitial == "*" then
        -- setTextEditText('*'.. chatCommandPrivate .. '* ')
      -- end
      -- message = chatCommandMessage:trim()
      -- chatCommandPrivateReady = true
    -- end
  -- end

  -- message = message:gsub("^(%s*)(.*)","%2") -- remove space characters from message init
  -- if #message == 0 then return end

  -- add new command to history
  -- currentMessageIndex = 0
  -- if #messageHistory == 0 or messageHistory[#messageHistory] ~= originalMessage then
    -- table.insert(messageHistory, originalMessage)
    -- if #messageHistory > MAX_HISTORY then
      -- table.remove(messageHistory, 1)
    -- end
  -- end

  -- local speaktypedesc
  -- if (channel or tab == defaultTab) and not chatCommandPrivateReady then
    -- if tab == defaultTab then
      -- speaktypedesc = chatCommandSayMode or SayModes[consolePanel:getChildById('sayModeButton').sayMode].speakTypeDesc
      -- if speaktypedesc ~= 'say' then sayModeChange(2) end -- head back to say mode
    -- else
      -- speaktypedesc = chatCommandSayMode or 'channelYellow'
    -- end

    -- g_game.talkChannel(SpeakTypesSettings[speaktypedesc].speakType, channel, message)
    -- return
  -- else
    -- local isPrivateCommand = false
    -- local priv = true
    -- local tabname = name
    -- if chatCommandPrivateReady then
      -- speaktypedesc = 'privatePlayerToPlayer'
      -- name = chatCommandPrivate
      -- isPrivateCommand = true
    -- elseif tab.npcChat then
      -- speaktypedesc = 'privatePlayerToNpc'
    -- elseif tab == violationReportTab then
      -- if violationReportTab.locked then
        -- modules.game_textmessage.displayFailureMessage('Wait for a gamemaster reply.')
        -- return
      -- end
      -- speaktypedesc = 'rvrContinue'
      -- tabname = tr('Report Rule') .. '...'
    -- elseif tab.violationChatName then
      -- speaktypedesc = 'rvrAnswerTo'
      -- name = tab.violationChatName
      -- tabname = tab.violationChatName .. '\'...'
    -- else
      -- speaktypedesc = 'privatePlayerToPlayer'
    -- end


    -- local speaktype = SpeakTypesSettings[speaktypedesc]
    -- local player = g_game.getLocalPlayer()
    -- g_game.talkPrivate(speaktype.speakType, name, message)

    -- message = applyMessagePrefixies(g_game.getLocalPlayer():getName(), player:getLevel(), message)
    -- addPrivateText(message, speaktype, tabname, isPrivateCommand, g_game.getLocalPlayer():getName())
  -- end
-- end


-- function sayModeChange(sayMode)
  -- local buttom = consolePanel:getChildById('sayModeButton')
  -- if sayMode == nil then
    -- sayMode = buttom.sayMode + 1
  -- end

  -- if sayMode > #SayModes then sayMode = 1 end

  -- buttom:setIcon(SayModes[sayMode].icon)
  -- buttom.sayMode = sayMode
-- end

-- function getOwnPrivateTab()
  -- if not ownPrivateName then return end
  -- return getTab(ownPrivateName)
-- end

-- function setIgnoreNpcMessages(ignore)
  -- ignoreNpcMessages = ignore
-- end

-- function navigateMessageHistory(step)
  -- local numCommands = #messageHistory
  -- if numCommands > 0 then
    -- currentMessageIndex = math.min(math.max(currentMessageIndex + step, 0), numCommands)
    -- if currentMessageIndex > 0 then
      -- local command = messageHistory[numCommands - currentMessageIndex + 1]
      -- consoleTextEdit:setText(command)
    -- else
      -- consoleTextEdit:clearText()
    -- end
  -- end
-- end



-- function applyMessagePrefixies(name, level, message)
  -- if name then
    -- if modules.client_options.getOption('showLevelsInConsole') and level > 0 then
      -- message = name .. ' [' .. level .. ']: ' .. message
    -- else
      -- message = name .. ': ' .. message
    -- end
  -- end
  -- return message
-- end

-- function onTalk(name, level, mode, message, channelId, creaturePos)
  -- if mode == MessageModes.PrivateFrom and IGNOREPM then
	-- consolePanel:getChildById('blockedPlayers'):setIcon("blcokedred.png")
	-- scheduleEvent(function()
		-- consolePanel:getChildById('blockedPlayers'):setIcon("blcoked.png")
	-- end, 1000)
	-- return true
  -- end
  -- if ignoreNpcMessages and mode == MessageModes.NpcFrom then return end


    -- if IGNORED[name] then
	-- consolePanel:getChildById('blockedPlayers'):setIcon("blcokedred.png")
	-- scheduleEvent(function()
		-- consolePanel:getChildById('blockedPlayers'):setIcon("blcoked.png")
	-- end, 1000)
	-- return true
  -- end


  -- if (mode == MessageModes.Say or mode == MessageModes.Whisper or mode == MessageModes.Yell or
      -- mode == MessageModes.Spell or mode == MessageModes.MonsterSay or mode == MessageModes.MonsterYell or
      -- mode == MessageModes.NpcFrom or mode == MessageModes.BarkLow or mode == MessageModes.BarkLoud) and
     -- creaturePos then
    -- local staticText = StaticText.create()
	-- if mode == MessageModes.NpcFrom then
		-- staticText:addMessage(name, mode, message:gsub('[{}]',' '))
	-- else
		-- staticText:addMessage(name, mode, message)
	-- end
    -- g_map.addThing(staticText, creaturePos, -1)
  -- end

  -- local defaultMessage = mode <= 3 and true or false
  -- speaktype = SpeakTypes[mode]

  -- if not speaktype then
    -- perror('unhandled onTalk message mode ' .. mode .. ': ' .. message)
    -- return
  -- end

  -- if speaktype == SpeakTypesSettings.none then return end

  -- if speaktype.hideInConsole then return end

  -- local composedMessage = applyMessagePrefixies(name, level, message)

  -- if speaktype.private then
    -- addPrivateText(composedMessage, speaktype, name, false, name)
    -- if modules.client_options.getOption('showPrivateMessagesOnScreen') and speaktype ~= SpeakTypesSettings.privateNpcToPlayer then
      -- modules.game_textmessage.displayPrivateMessage(name .. ':\n' .. message)
    -- end
  -- else
    -- local channel = tr('Default')
    -- if not defaultMessage then
      -- channel = channels[channelId]
    -- end

    -- if channel then
      -- addText(composedMessage, speaktype, channel, name)
    -- elseif channelId ~= 0 then
      -- server sent a message on a channel that is not open
      -- pwarning('message in channel id ' .. channelId .. ' which is unknown, this is a server bug, relogin if you want to see messages in this channel')
    -- end
  -- end
-- end

function onOpenChannel(channelId, channelName)
  addChannel(channelName, channelId)
  local ss = {'Avisos: Tutores e GMs não podem ficar logando em outros mundos, se forem vistos em outros mundos poderam ser banidos. Qualquer membro da Staff que for visto ofendendo players e/ou outros membros da Staff podem ter seus cargos retirados sem aviso.',
		'É proibido membros da Staff dividir a acc, por isso quem for visto logando na acc de outros players ou deixando outro player ou membro da Staff entrar na sua acc vai ter o cargo retirado.',
		'Sempre que ver um player fazendo algo errado avise que ele não pode fazer isso, diga o motivo e se ele continuar então deve ser aplicada uma NOTATAION. Sempre antes de aplicar uma punição avisem no counselor, mesmo que achem que não tem ninguem ON.',
		'Tutores nunca devem dar ban diretamente, com exceção de anuncios de sites hackers, ou criação de contas fakes com proposito de anuncios indevidos ou ofensas a Staff e/ou otPokemon.',
		'Casos de bot, uso de bugs, roubos, e outras coisas não relacionadas aos chats não devem ser punidos por tutores, os tutores que forem informados sobre essas coisas devem reportar, ctrl+r, e esperar que outro membro da equipe resolva. Bom jogo pra todos.',
		"Bem-vindo ao canal de ajuda.\nAqui você poderá tirar dúvidas relevantes sobre o jogo. Perguntas sobre localizações e respawns devem ser feitas no game-chat."
	}
	if channelId == 4 then
		addText(ss[math.random(1,#ss)], SpeakTypesSettings.channelWhite, channelName, '')
	end
setPokeInfo(' - ','-',0,0,1,0,7746,0,0,100)
removePokeAttr();
end

function onOpenPrivateChannel(receiver)
  addPrivateChannel(receiver)
end

-- function onOpenOwnPrivateChannel(channelId, channelName)
  -- local privateTab = getTab(channelName)
  -- if privateTab == nil then
    -- addChannel(channelName, channelId)
  -- end
  -- ownPrivateName = channelName
-- end

-- function onCloseChannel(channelId)
  -- local channel = channels[channelId]
  -- if channel then
    -- local tab = getTab(channel)
    -- if tab then
      -- consoleTabBar:removeTab(tab)
    -- end
    -- for k, v in pairs(channels) do
      -- if (k == tab.channelId) then channels[k] = nil end
    -- end
  -- end
-- end

function doChannelListSubmit()
  local channelListPanel = channelsWindow:getChildById('channelList')
  local openPrivateChannelWith = channelsWindow:getChildById('openPrivateChannelWith'):getText()
  if openPrivateChannelWith ~= '' then
    g_game.openPrivateChannel(openPrivateChannelWith)
  else
    local selectedChannelLabel = channelListPanel:getFocusedChild()
    if not selectedChannelLabel then return end
    if selectedChannelLabel.channelId == 0xFFFF then
      g_game.openOwnChannel()
    else
      g_game.joinChannel(selectedChannelLabel.channelId)
    end
  end

  channelsWindow:destroy()
end


function onGameEditText(id, itemId, maxLength, text, writter, time)

end
function matar()
	-- if pokedex_UI then
		-- pokedex_UI:destroy()
		-- pokedex_UI = nil
		-- topButton:setOn(false)
	-- end
end
function closeRep()
	if Rep_window then
		Rep_window:destroy()
		Rep_window = nil
	end
end




CHKS = 0
function chooseRep(widget, focusedChild,old)
	local id = tonumber(focusedChild.id) or 0
	if id then

		CHKS = id
		Rep_window:getChildById('chk'):enable()
	else
		Rep_window:getChildById('chk'):disable()
	end
end


function Scan()
	if CHKS  then
		closeRep()

		g_game.getProtocolGame():sendExtendedOpcode(5, "77GTB"..CHKS)

	end
end
function closeReps()
	if Rep_window then
		Rep_window:destroy()
		Rep_window = nil
		return true
	end
	return false
end
function onChannelList(channelList,poke) ---dexhere    vazio

	if channelsWindow then channelsWindow:destroy() end
		if not channelList then
			channelList = loadedList
		end
		loadedList = channelList


		if channelList[1][2]:match('BNN(%d+)') then
			for i,b in pairs(channelList) do
				if Rep_window then
					return
				end
				Rep_window = g_ui.displayUI('reprwdw.otui')
				Rep_window:getChildById('chk'):disable()
				local list = Rep_window:getChildById('listoza')
				--
				for k,v in pairs(channelList) do
					if k > 1 then
						local channelId = v[1]
						local channelName = v[2]
						local label = g_ui.createWidget('ReprList', list)
						label:setId("RP"..channelId)
						label:setColor("#00ff00")
						label:setText(channelName)
						label.id = tonumber(string.match(channelName,"%[(%d+)%]"))
					else
						local label = g_ui.createWidget('ReprList', list)
						label:setId("RP0")
						label:setColor("#ff7777")
						label:setText("Reports :)")
					end
				end
				local label = g_ui.createWidget('ReprList', list)
				label:setId("RP9999")
				label:setColor("#a3a3ff")
				label:setText("End reports =]")
				connect(list, { onChildFocusChange =  function (self, focusedChild,old) chooseRep(self, focusedChild,old) end } )
			end
			return
		end


  if channelsWindow then channelsWindow:destroy() end
  channelsWindow = g_ui.displayUI('channelswindow')
  local channelListPanel = channelsWindow:getChildById('channelList')
  channelsWindow.onEnter = doChannelListSubmit
  channelsWindow.onDestroy = function() channelsWindow = nil end
  g_keyboard.bindKeyPress('Down', function() channelListPanel:focusNextChild(KeyboardFocusReason) end, channelsWindow)
  g_keyboard.bindKeyPress('Up', function() channelListPanel:focusPreviousChild(KeyboardFocusReason) end, channelsWindow)

  for k,v in pairs(channelList) do
    local channelId = v[1]
    local channelName = v[2]

    if #channelName > 0 then
      local label = g_ui.createWidget('ChannelListLabel', channelListPanel)
      label.channelId = channelId
      label:setText(channelName)

      label:setPhantom(false)
      label.onDoubleClick = doChannelListSubmit
    end
  end


end

FIRST = true
DEXDATA = {}
MOAR = "Você ainda não completou sua PokeDex!\nComplete para ganhar prêmios e pontos!"
JAAJITEM =0
function countP()
	local i = 0
	for a=1,544 do
		if DEXDATA[a] then
			i = i+1
		end
	end
	return i
end
function Parse_me(txt)
	for i,b in txt:gmatch("(%d+),(.-);") do
		DEXDATA[tonumber(i)] = b
	end
end
-- function info()
	-- if MOAR ~= '' and MOAR ~= nil then
		-- modules.game_textwindow.onGameEditText(os.time(), 3270, 0,MOAR, 0, os.time())
	-- end
-- end
-- LAST_SELECTED = ""
-- FISTDEX = false;
-- function doOpenDex(text,texto,item)
	-- MOAR = text or a
	-- text = text or a

	-- if (text == 0)then
		-- g_game.getProtocolGame():sendExtendedOpcode(5, "77RFRSH")
		-- scheduleEvent(function() FIRST = false refreshDexList() end, 800)
		-- text = nil
	-- end

	-- if not pokedex_UI then
		-- pokedex_UI = g_ui.displayUI('pokedex.otui')
		-- topButton:setOn(true)
		-- local PX =  g_window.getWidth()/2 - (653/2)
		-- local PY =  g_window.getHeight()/2 - (474/2)
		-- pokedex_UI:setX(PX)
		-- pokedex_UI:setY(PY)

		-- list = pokedex_UI:getChildById('listoza')
		-- connect(list, { onChildFocusChange =  function (self, focusedChild,old) selecting(self,focusedChild,old,-1) end } )
		-- pokedex_UI:getChildById('gotoo'):disable()
		-- for k=1,544 do
			-- if DEXDATA[k] then
				-- loadedOnce = k
				-- local channelId = k
				-- local channelName = string.format("%.3d",k)..' - '..DEXDATA[k]
				-- local label = g_ui.createWidget('DexList', list)
				-- label:setId("PK"..channelId)
				-- label:setColor("#37ae20")
				-- label:setText(channelName)

			-- else
				-- loadedOnce = k
				-- local channelId = k
				-- local channelName = string.format("%.3d",k)..' - ???'
				-- local label = g_ui.createWidget('DexList', list)
				-- label:setId("PK"..channelId)
				-- label:setColor("#121296")
				-- label:setText(channelName)
			-- end
		-- end
	-- end
		-- JAAJITEM=item
		-- if not text then
			-- if not text and not FIRST then
				-- pokedex_UI:getChildById('description'):setText(tr(texto,countP() or 0))
			-- end
		-- else
			-- local Abriged = "Name: %s\nType: %s\nMinimum level %s\n\nTo more informations click\nnon the (I) button\n"

			-- local nome = text:match("Name: %s+(.-)\n") or text:match("Name: %s+(.-)\n")
			-- for k=1,544 do
				-- if DEXDATA[k] and nome:lower() == DEXDATA[k]:lower() then
					-- Abriged = Abriged..'Nº '..string.format("%.3d",k)
					-- break
				-- end
			-- end
			-- MOAR = text
			-- local f = io.open("modules/game_console/pokes/"..nome..".png","r");
			-- if not f then

				-- pokedex_UI:getChildById('portrait'):setImageSource("unknow.png")
			-- else
				-- f:close()
				-- pokedex_UI:getChildById('portrait'):setImageSource("pokes/"..nome..".png")
			-- end
			-- pokedex_UI:getChildById('description'):setText(Abriged:format(nome:gsub('%a',string.upper,1),text:match("Tipo: (.-)\n") or text:match("Type: (.-)\n"),text:match("Necessario:%s*(%d+)") or text:match("required:%s*(%d+)") or 0))
		-- end
		-- pokedex_UI:getChildById('description'):setColor("#101010")
		-- pokedex_UI:getChildById('portrait'):setItemId(item or 7746)




		-- pokedex_UI:getChildById('portrait'):setItemId(item or 7746)

		-- pokedex_UI:getChildById('description'):setColor("#101010")

		-- if FIRST then

			-- g_game.getProtocolGame():sendExtendedOpcode(5, "77RFRSH")
			-- scheduleEvent(function() FIRST = false refreshDexList(true) end, 800)
		-- end

-- end
focused = nil

--Finding message
LEFIND = nil
lookforall = true
function setLookForAll(self)
	self:setChecked(not self:isChecked())
	lookforall = LEFIND:getChildById('ignore'):isChecked()

end
function openFind_destroy()
	if LEFIND then
		LEFIND:destroy();
		LEFIND = nil
	end
end
function openFind()
	openFind_destroy()
	LEFIND = g_ui.displayUI('lookfor.otui')
	if not LEFIND then
		return
	end

	LEFIND.onDestroy = function()
		LEFIND = nil
	end
	LEFIND:getChildById('ignore'):setChecked(lookforall )

end
function openFind_search()
	local msg = LEFIND:getChildById('msgs'):getText():lower();
	openFind_destroy()
	if msg:len() < 4 then
		modules.game_textmessage.displayMessage(MessageModes.Login, tr("You need at least 3 letters."))
		return true;
	end
	local find = {}
	if lookforall then
		for channel, messages in pairs(MSGS) do
			for i,message in pairs(messages) do
				if tostring(message):lower():find(msg) then
					find[#find +1] = {message,channel};
				end
			end
		end
	else
		local tab = consoleTabBar:getCurrentTab()
		for channel, messages in pairs(MSGS) do
			if channel:lower() == tab:getText():lower() then
				for i,message in pairs(messages) do
					if tostring(message):lower():find(msg) then
						find[#find +1] = {message,channel};
					end
				end
			end
		end
	end
	if #find == 0 then
		modules.game_textmessage.displayMessage(MessageModes.Login, tr("No matches."))
	else
		modules.game_textmessage.displayMessage(MessageModes.Login, (#find)..tr(" matches found"))
		local window = g_ui.displayUI('found.otui');

		img = window:getChildById('img')
		local gray=false;
		for i,b in pairs(find) do
			local questLabel = g_ui.createWidget('UIItem', img)
			questLabel:setBackgroundColor(gray and "#444444" or "#777777")
			questLabel:setText(b[2])
			questLabel:setHeight(14)
			questLabel.onMouseRelease = function (self, mousePos, mouseButton)
				leOpenMenuCopy(mousePos, mouseButton,  b[1])
			end
			if (b[1]:len() > 50) then

				local questLabel = g_ui.createWidget('UIItem', img)
				questLabel:setBackgroundColor(gray and "#444444" or "#777777")
				questLabel:setText(" ")
				questLabel:setHeight(14)
			end
			gray = not gray;


		end
		gray = false;
		name = window:getChildById('name')
		for i,b in pairs(find) do
			local questLabel = g_ui.createWidget('UIItem', name)
			questLabel:setBackgroundColor(gray and "#444444" or "#777777")
			questLabel:setText(b[1]:sub(1,50)..(b[1]:len() > 50 and "..." or ""))
			questLabel:setHeight(14)
			questLabel.onMouseRelease = function (self, mousePos, mouseButton)
				leOpenMenuCopy(mousePos, mouseButton,  b[1])
			end
			if (b[1]:len() > 50) then
				local questLabel = g_ui.createWidget('UIItem', name)
				questLabel:setBackgroundColor(gray and "#444444" or "#777777")
				questLabel:setText(b[1]:sub(50,100)..(b[1]:len() > 100 and "..." or ""))
				questLabel:setHeight(14)
				questLabel.onMouseRelease = function (self, mousePos, mouseButton)
					leOpenMenuCopy(mousePos, mouseButton,  b[1])
				end
			end
			gray = not gray;
		end




	end
end

function leOpenMenuCopy(mousePos, mouseButton, text)
  if mouseButton == MouseRightButton then
    local menu = g_ui.createWidget('PopupMenu')

      menu:addOption(tr('Copy message'), function () g_window.setClipboardText(text) end)
	  if (text:match("%d+:%d+ (.-)%s*%[%d+%]")) then
	    local name  = text:match("%d+:%d+ (.-)%s*%[%d+%]")
		menu:addSeparator()
		menu:addOption(tr('Copy name'), function () g_window.setClipboardText(name) end)
		menu:addOption(tr('Send message to')..' ' .. name, function () openFind_destroy() g_game.openPrivateChannel(name) end)
	  end

    menu:display(mousePos)
	end
end


--End

-- function selecting(self,focusedChild,old,jaaj)
	-- focused = focusedChild

	-- if not focusedChild:getText():find('?') and LAST_SELECTED ~= focusedChild:getText() then
		-- pokedex_UI:getChildById('listoza'):focusChild(focusedChild)
		-- LAST_SELECTED = focusedChild:getText();

		-- g_game.getProtocolGame():sendExtendedOpcode(5,"77OP"..tostring(focusedChild:getText():match("%d+")))

	-- end
-- end
-- function refreshDexList(cancel_desc)
	-- if pokedex_UI then
		-- local list = pokedex_UI:getChildById('listoza')
		-- for k=1,544 do
			-- if DEXDATA[k] then
				-- local wid = list:getChildById('PK'..k)
				-- wid:setColor("#37ae20")
				-- wid:setText(string.format("%.3d",k)..' - '..DEXDATA[k])
			-- end
		-- end
		--[[if not text then
			pokedex_UI:getChildById('description'):setText("Hello. This is the pokedex.\n\nYou have found "..countP().." pokemon.\n\n\n\n\n\n\n"..os.date("%H:%M:%S - %d/%m/%Y",os.time()))
		else
			pokedex_UI:getChildById('description'):setText(text)
		end]]
	-- end
-- end
-- function goNext()
	-- local ok = false
	-- if pokedex_UI then
		-- local list = pokedex_UI:getChildById('listoza')
		-- for k=1,544 do
			-- local wid = list:getChildById('PK'..k)

			-- if ok and not wid:getText():find('?') then
				-- selecting(list,wid,nil)
				-- return true
			-- end
			-- if wid == focused then
				-- ok = true
			-- end
		-- end
		-- for k=1,544 do
			-- local wid = list:getChildById('PK'..k)
			-- if not wid:getText():find('?') then
				-- selecting(list,wid,nil)

				-- return true
			-- end
		-- end
	-- end
-- end

-- function goPrev()
	-- local ok = false
	-- if pokedex_UI then
		-- local list = pokedex_UI:getChildById('listoza')
		-- for k=544,1,-1 do
			-- local wid = list:getChildById('PK'..k)

			-- if ok and not wid:getText():find('?') then
				-- selecting(list,wid,nil)
				-- return true
			-- end
			-- if wid == focused then
				-- ok = true
			-- end
		-- end
		-- for k=544,1,-1 do
			-- local wid = list:getChildById('PK'..k)
			-- if not wid:getText():find('?') then
				-- selecting(list,wid,nil)
				-- return true
			-- end
		-- end
	-- end
-- end

-- function openPlayerReportRuleViolationWindow()
  -- if violationWindow or violationReportTab then return end
  -- violationWindow = g_ui.loadUI('violationwindow', rootWidget)
  -- violationWindow.onEscape = function()
    -- violationWindow:destroy()
    -- violationWindow = nil
  -- end
  -- violationWindow.onEnter = function()
    -- local text = violationWindow:getChildById('text'):getText()
    -- g_game.talkChannel(MessageModes.RVRChannel, 0, text)
    -- violationReportTab = addTab(tr('Report Rule') .. '...', true)
    -- addTabText(tr('Please wait patiently for a gamemaster to reply') .. '.', SpeakTypesSettings.privateRed, violationReportTab)
    -- addTabText(applyMessagePrefixies(g_game.getCharacterName(), 0, text),  SpeakTypesSettings.say, violationReportTab, g_game.getCharacterName())
    -- violationReportTab.locked = true
    -- violationWindow:destroy()
    -- violationWindow = nil
  -- end
-- end

-- function lookFor()
	-- if pokedex_UI then
		-- local asd = pokedex_UI:getChildById('searchk')
		-- local look = asd:getText():lower();
		-- if look:len() < 2 then
			-- return;
		-- end
		-- local max = 545;
		-- if focused then
			-- local n = focused:getId():match("(%d+)");
			-- max = math.min(n,max)
			-- if max <= 1 then
				-- max = 545;
			-- end
		-- end
		-- local list = pokedex_UI:getChildById('listoza')
		-- local firstF = nil
		-- for k=max-1,1,-1 do
			-- local wid = list:getChildById('PK'..k)
			-- if not firstF then
				-- firstF = wid;
			-- end
			-- if wid and not wid:getText():find('?') then
				-- local pname = wid:getText():lower();

				-- if pname:find(look) then
					-- selecting(list,wid,nil)
					-- return true
				-- end
			-- end
		-- end
		-- focused = firstF;local lastChannelsOpen = g_settings.getNode('lastChannelsOpen')
  -- if lastChannelsOpen then
    -- local savedChannels = lastChannelsOpen[g_game.getCharacterName()]
    -- if savedChannels then
      -- for channelName, channelId in pairs(savedChannels) do
        -- channelId = tonumber(channelId)
        -- if channelId ~= -1 and channelId < 100 then
          -- if not table.find(channels, channelId) then
            -- g_game.joinChannel(channelId)
            -- table.insert(ignoredChannels, channelId)
          -- end
        -- end
      -- end
    -- end
  -- end
  -- scheduleEvent(function() ignoredChannels = {} end, 3000)

	-- end
-- end
-- function online()
  -- if g_game.getProtocolVersion() < 862 then
    -- g_keyboard.bindKeyDown('Ctrl+R', openPlayerReportRuleViolationWindow)
  -- end
  -- open last channels
  -- 
-- end