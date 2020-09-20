Extended = {}

-- private variables
local callbacks = {}
CALL = false
-- hooked functions
WW = nil
function copyToClip(wid)
	if wid == 'com' then
		g_window.setClipboardText(WW.cont)

	else
		g_window.setClipboardText(WW:getChildById(wid):getText())
	end
end
function Kill()
	WW:destroy()
	WW = nil
	g_game.getProtocolGame():sendExtendedOpcode(5, "77BAN")
end
WWAA = nil

LEMSG = nil
function trueCancel()
	WWAA:destroy()
	WWAA = nil
end
function trueSolve()
	g_game.getProtocolGame():sendExtendedOpcode(5, "77SLV"..WWAA.id)
	g_game.getProtocolGame():sendExtendedOpcode(5, "77MSGTO"..WWAA.sender..':Report #'..WWAA.id..':'..WWAA:getChildById('com'):getText():gsub("\n",'#$'))
	--

	g_game.getProtocolGame():sendExtendedOpcode(5, "77BAN")
	WWAA:destroy()
	WWAA = nil
end
function Solve()
	local localPlayer = g_game.getLocalPlayer()

	WWAA = g_ui.displayUI('confirm.otui')
	WWAA.id = WW.id;
	WWAA.sender = WW.sender;
	WWAA:getChildById('com'):setMaxLength(512)
	WWAA:getChildById('com'):setText("Dear "..WWAA.sender.."\nThe report #"..WW.id..'\nHave been checked and solved.\nThanks for your report\n\n'..localPlayer:getName())
	WWAA:getChildById('com'):setEditable(true)
	WWAA:getChildById('com'):setCursorVisible(true)
	WW:destroy()
	WW = nil
--[[
	g_game.getProtocolGame():sendExtendedOpcode(5, "77SLV"..WW.id)

	g_game.getProtocolGame():sendExtendedOpcode(5, "77BAN")]]


end

function gmsendmsg()
	if LEMSG then
		LEMSG:destroy()
		LEMSG = nil
	end
	LEMSG = g_ui.displayUI('sendmsg.otui')
end
function trueSolve2()
	local localPlayer = g_game.getLocalPlayer()
	g_game.getProtocolGame():sendExtendedOpcode(8, "77MSGTO:"..LEMSG:getChildById('pleyer'):getText()..':'..LEMSG:getChildById('subjeej'):getText()..':'..LEMSG:getChildById('com'):getText():gsub("\n",'#$'))
	if LEMSG then
		LEMSG:destroy()
		LEMSG = nil
	end
end
function trueCancel2()
	if LEMSG then
		LEMSG:destroy()
		LEMSG = nil
	end
end

function openRepWindow(reported,des,cont,time,sender,pos,id)
	if WW then
			WW:close()
			WW = nil
	end
	des = des:gsub("§","\n")

	cont = cont:gsub("§","\n")

	local lastl = 0;
	for i=0,#cont do
		if cont:sub(i,i) == '\n' then
			lastl = 0;
		end
		lastl = lastl +1
		if lastl >= 38 then
			cont = cont:sub(1,i-1)..'\n'..cont:sub(i,-1);
			lastl = 0;
		end
	end
	WW = g_ui.displayUI('report.otui')
	WW:getChildById('sender'):setText(sender)
	WW.sender = sender
	WW:getChildById('desc'):setText(des)

	WW:getChildById('reported'):setText(reported)
	WW:getChildById('ttime'):setText(os.date("%d/%m/%y %H:%M:%S",time))
	WW.time = time
	WW.sender = sender
	WW.id = id
	print(pos)
	WW:getChildById('com'):setText(cont)
	--WW:getChildById('com'):setText(cont)

	--[[for i in cont:gmatch("(.-)\n") do
		local label = g_ui.createWidget('LineList', WW:getChildById('com'))
		label:setColor("#f5f5f5")
		label:setText(i)
	end]]

end

GLOBAL_CITY = {Saffron, Cerulean, Mahogany}

local function onExtendedOpcode(protocol, opcode, buffer, param)

	if opcode == 22 then
		if buffer:match("##system##VIP") then
		local param = buffer:explode(":")
		 modules.game_viplist.onVipSetStatus(tonumber(param[2]),tonumber(param[3]))
		 print(buffer)
		 print(buffer)
		 print(buffer)
		 print(buffer)
		 print(buffer)
	end
	end
  if opcode == 4 then
	if buffer == 'Hi?' then
		g_game.getProtocolGame():sendExtendedOpcode(4, os.time())
	end
  end
  if opcode == 5 then
		CALL = true
		local text = buffer
		print(text)
		if text:match("CP:(.-)!M:(.+)") then
			local name,skill = text:match("CP:(.-)!M:(.+)")
			local skills = {}
			local ss = 0
			for m,name,level,cd,id,ex in skill:gmatch("|m(%d+)@(.-)@(%d+)@(%d+)@(%d+)@(%d+)|") do
				ss = ss+1
				skills[tonumber(m)] = {name,level,cd,id,ex}
			end
			modules.game_pokewindow.callWindow({name=name,s=ss,sk=skills})
		elseif text:match("%%system%%PLI(.+)") then
			local pli = text:match("%%system%%PLI(.+)")
			for i,b in pli:gmatch('(.-):(.-);') do
				if i == 'ch' then
					local now,max = b:match('(%d+),(%d+)')
					modules.game_skills.setCaughts(tonumber(now),tonumber(max))
				end
			end
		elseif text:match("%%system%%locked;(.+)") then
			modules.game_lock.showLockedWindow(text:match("%%system%%%system%locked;(.+)"))
		elseif text:match("%%system%%PHU(%d+),(%d+)") then
			local now,max = text:match("%%system%%PHU(%d+),(%d+)")
		elseif text:match("##system##MSG;") then
			local param = text:explode(";")
			modules.game_textmessage.openMsg(param[2], param[3])
		elseif text:match("%%system%%CLST:(.+)") then
			local str =  text:match("%%system%%CLST:(.+)")
			for ct in str:gmatch("(.-),") do
				GLOBAL_CITY[ct] = true;
			end
		elseif text:match("##system##COL1") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(1, tonumber(param[2]))
		elseif text:match("##system##SHARETORN") then
			modules.game_textmessage.showFacebook('Você venceu um torneio, compartilhe com seus amigos no facebook','681900435339899')
		elseif text:match("##system##SHARECATCH") then
			modules.game_textmessage.showFacebookC('Você capturou um Pokémon, compartilhe com seus amigos no facebook','FDS')
		elseif text:match("##system##CLNPC") then
			modules.game_npcdialog.hide()
		elseif text:match("##system##COL2") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(2, tonumber(param[2]))
		elseif text:match("##system##COL3") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(3, tonumber(param[2]))
		elseif text:match("##system##COL4") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(4, tonumber(param[2]))
		elseif text:match("##system##COL5") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(5, tonumber(param[2]))
		elseif text:match("##system##COL6") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(6, tonumber(param[2]))
		elseif text:match("##system##COL7") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(7, tonumber(param[2]))
		elseif text:match("##system##COL8") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(8, tonumber(param[2]))
		elseif text:match("##system##COL9") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(9, tonumber(param[2]))
		elseif text:match("##system##COLDEZ") then
			local param = text:explode(",")
			modules.game_pokewindow.setColdown(10, tonumber(param[2]))
		elseif text:match("##system##CD") then
			local param = text:explode(",")
			modules.game_pokewindow.reorganizeCD(tonumber(param[1]),tonumber(param[2]),1)
		elseif text:match("##system##CTCH") then
			local param = text:explode(",")
			modules.game_healthinfo.onSoulChange(0, tonumber(param[2]))
		elseif text:match("##system##TORN") then
			local param = text:explode(",")
			modules.game_healthinfo.onTorneioChange(0, tonumber(param[2]))
		elseif text:match("##system##msg") then
			local param = text:explode(",")
			modules.game_textmessage.showCityName(param[2])	
		elseif text:match("##system##text") then
			local param = text:explode(",")
			modules.game_textmessage.showText(param[2])	
		elseif text:match("##system##PINF") then
			local param = text:explode("@")
			modules.game_pokeinfo.setPokeInfo(param[1],param[2],tonumber(param[3]),tonumber(param[4]),tonumber(param[5]),tonumber(param[6]),tonumber(param[7]),tonumber(param[8]),tonumber(param[9]),tonumber(param[10]))
		elseif text:match("%%system%%RPRN(%d+)|(.-)|(.-)|(.-)|(%d+)|(.-)|(.+)") then
			local id,reported,des,cont,time,sender,pos = text:match("%%system%%RPRN(%d+)|(.-)|(.-)|(.-)|(%d+)|(.-)|(.+)")
			openRepWindow(reported,des,cont,tonumber(time),sender,pos,id)
			--modules.game_shaders.setShader(tonumber(tt))
		elseif text == "%system%SWE" then
			modules.client_options.setOption('dashWalk',true,true)
			modules.game_textmessage.enableUD()
		elseif text == "%system%SWD" then
			modules.client_options.setOption('dashWalk',false,true)
			modules.game_textmessage.disableUD()
		elseif text == "%system%PATK" then
			g_game.getProtocolGame():sendExtendedOpcode(5, "77PIN")
		elseif text == "%%system%%COLCLS" then
		modules.game_pokewindow.closeW()
		elseif text == "%%system%%starterone" then
		modules.game_pokeinfo.showKeyboardStart()
		modules.game_pokeinfo.showProfStart()
		modules.game_pokeinfo.showBallonStart()
		elseif text == "%%system%%startertwo" then
		modules.game_pokeinfo.showBallon2AndarStart()
		elseif text == "%%system%%starterthree" then
		modules.game_pokeinfo.showBallonProfStart()
		elseif text == "%%system%%starterfour" then
		modules.game_pokeinfo.showBallonProf2Start()
		elseif text == "%%system%%starterfive" then
		modules.game_pokeinfo.showBallonProf3Start()
		elseif text == "%%system%%starterhide" then
		modules.game_pokeinfo.hideAllStarter()
		elseif text == "%system%KP" then
			modules.game_pokeinfo.setPokeInfo(' - ','-',0,0,1,0,7746,0,1,1)
			modules.game_pokeinfo.removePokeAttr();
		elseif text:match("%%system%%ENDTRQCK") then
			modules.game_gps.endtrack()
		elseif text:match("%%system%%FORCE") then
			g_game.cancelLogin()
			modules.client_entergame.CharacterList.hide(true)
		elseif text:match("%%system%%DDX(.+)") then
			modules.game_pokeinfo.Parse_me(text:match("%%system%%DDX(.+)"))
		elseif text:match("%%system%%TRQCK(.-):(%d+),(%d+),(%d+)") then
			local name, x,y,z =text:match("%%system%%TRQCK(.-):(%d+),(%d+),(%d+)")
			modules.game_gps.track({x=tonumber(x),y=tonumber(y),z=tonumber(z)},name)
		elseif text:match("%%system%%BLKNSLT") then
			modules.game_inventory.blinkFeetSlot()
		elseif text:match("%%system%%FDX") then
			modules.game_pokeinfo.doOpenDex()
		elseif text:match("%%system%%SND(.+)") then
			local snd = text:match("%%system%%SND(.+)")
			if g_settings.getBoolean('sound_ona') == false then
				if not PLAYED[snd] then

					PLAYED[snd] = true
				end
				--print(g_sounds.playMusic('ogg/'..snd..'.ogg', 3))
			end
		elseif text:match("##system##CHCKMSG") then
		local param = text:explode(":")
		modules.game_textmessage.openLetter(tonumber(param[2]),tonumber(param[3]),param[4])
		elseif text:match("%%system%%PPHP(%d+)/(%d+)") then
			local now,max= text:match("%%system%%PPHP(%d+)/(%d+)")
			modules.game_pokeinfo.setPokeHP(now,max)
		elseif text:match("%%system%%PXP(%d+),(%d+),(%d+),(%d+)") then
			local lvl,now,max,med= text:match("%%system%%PXP(%d+),(%d+),(%d+),(%d+)")
			modules.game_pokeinfo.setPokeExp(lvl,now,max,med)
		elseif text:match("%%system%%CTCH(%d+)") then
			local nm= text:match("%%system%%CTCH(%d+)")
			modules.game_healthinfo.onSoulChange(0, nm)
		elseif text:match("%%system%%SFB(.-)§(.+)") then
			local nm,post= text:match("%%system%%SFB(.-)§(.+)")
			modules.game_textmessage.showFacebook(nm,post)
		elseif text:match("%%system%%CD(%d+)M(%d+)") then
			local tt,mm = text:match("%%system%%CD(%d+)M(%d+)")
			modules.game_pokewindow.reorganizeCD(tonumber(tt),tonumber(mm),1)
		elseif text:match("%%system%%PIN") then
			local name,nick,boost,hp,max,addons,port,lvl,exp,next,med = text:match("%%system%%PIN(.-),(.-),(%d+),(%d+),(%d+),{(.-)},(%d+),(%d+),(%d+),(%d+),(%d+)")
			modules.game_pokeinfo.setPokeInfo(name,nick,tonumber(boost),tonumber(hp),tonumber(max),addons,tonumber(port),lvl,exp,next,med)
		elseif text:match("%%system%%HS:(.+)") then
			modules.game_pokeinfo.setPokeAttribute(text:match("%%system%%HS:(.+)"));
		elseif text:find("%%system%%DSP") then
			modules.client_options.toggleDisplays()
			modules.client_options.toggleDisplays()
		elseif text:find("##system##SHD") then
		local param = text:explode(":")
		modules.game_shaders.setShader(tonumber(param[2]))
		elseif text:match("%%system%%BGMS:(.+)") then
			local msg = text:match("%%system%%BGMS:(.+)")
			modules.game_textmessage.showCityName( msg)
		elseif text == "##system##NOTIFYMSG" then
			modules.game_textmessage.NotifyMessage()

		elseif text:match("%%system%%MCSG:(.+)") then
			modules.game_textmessage.checkMail(text:match("%%system%%MCSG:(.+)"))
		elseif text:match("%%system%%NRPTR") then
			if modules.game_pokeinfo.closeReps() then
				g_game.getProtocolGame():sendExtendedOpcode(5, "CALL")
			end
		elseif text:match("%%system%%UD(%d+)M(%d+)") then
			local tt,mm = text:match("%%system%%UD(%d+)M(%d+)")
			modules.game_pokewindow.reorganizeCD(tonumber(tt),tonumber(mm),1)

		elseif text:match("%%system%%FNDLT:<(.-)>:(%d+)") then
			local name,id = text:match("%%system%%FNDLT:<(.-)>:(%d+)");
			modules.game_loot.setCid(name,id)
		elseif text:match("%%system%%LTL:(.+)") then
			local loot = text:match("%%system%%LTL:(.+)")
			modules.game_loot.takeThs(loot)
		elseif text:match("%%system%%LM:(.+)") then
			local msg = text:match("%%system%%LM:(.+)")
			modules.game_loot.msg(msg)
		elseif text =="%%system%%ATTCUT" then
			modules.game_pokeinfo.setPokeAttribute("CUT");
		elseif text == "%%system%%ATTDIG" then
			modules.game_pokeinfo.setPokeAttribute("DIG");
		elseif text == "%%system%%ATTTPR" then
			modules.game_pokeinfo.setPokeAttribute("TPR");
		elseif text == "%%system%%ATTLGT" then
			modules.game_pokeinfo.setPokeAttribute("LGT");
		elseif text == "%%system%%ATTFLY" then
			modules.game_pokeinfo.setPokeAttribute("FLY");
		elseif text == "%%system%%ATTRSM" then
			modules.game_pokeinfo.setPokeAttribute("RSM");
		elseif text == "%%system%%ATTBLK" then
			modules.game_pokeinfo.setPokeAttribute("BLK");
		elseif text == "%%system%%ATTSRF" then
			modules.game_pokeinfo.setPokeAttribute("SRF");
		elseif text == "%%system%%ATTRDI" then
			modules.game_pokeinfo.setPokeAttribute("RDI");
		elseif text:match("%%system%%COL(.-)%((%d+)%)") then
			local m,col=text:match("%%system%%COLm(%d+)%((%d+)%)")
			modules.game_pokewindow.setColdown(tonumber(m),tonumber(col))

		elseif text == '%system%CANMSG' then
			if not LEBUTTONKK then
				LEBUTTONKK =  modules.client_topmenu.addRightGameToggleButton('GM send message', tr('GM send message'), 'sendmsg.png', gmsendmsg)
			end
		elseif text == '%system%LP' then
			modules.game_pokelists.reFresh({})
		elseif text:match("%%system%%LP(.+)") then

			local tt = text:match("%%system%%LP(.+)")
			if tt ~= '?' then
				local pokestr = ""
				content = {}
				for poke,id,hp,hpmax,is,use,boost,sexo,uid,level in tt:gmatch("|(.-):(%d+):(%d+):([%d%.]+):([%d%.]+):([%d%.]+):(%d+):(%d+):(%d+):(%d+)|") do
					local maxp = tonumber(hpmax)
					pokestr = pokestr..poke..':'
					content[#content+1] = {poke,tonumber(id),tonumber(hp),maxp,tonumber(is),tonumber(use),tonumber(boost),tonumber(sexo),tonumber(level)}
				end
				-- modules.client_entergame.LEPOKES[modules.client_entergame.LESELECTED] = pokestr;
			end
			modules.game_pokelists.reFresh(content)
			--modules.game_pokewindow.reorganizeCD(tonumber(tt),tonumber(mm),1)
		end

		return
  end
  local callback = callbacks[opcode]
  if callback then
    callback(protocol, opcode, buffer)
  end
end
LEBUTTONKK = nil

function onGameStart()
	CALL = false
end

function offline()
	if LEMSG then
		LEMSG:destroy()
		LEMSG = nil

	end
	if LEBUTTONKK then
		LEBUTTONKK:destroy()
		LEBUTTONKK = nil
	end
	CALL = false
end


-- public functions
function Extended.init()
  connect(ProtocolGame, {onGameStart=onGameStart, onExtendedOpcode = onExtendedOpcode } )
  connect(g_game, {
    onGameStart = online,
    onGameEnd = offline,

  })

end

function Extended.terminate()
  disconnect(ProtocolGame, {onGameStart=onGameStart, onExtendedOpcode = onExtendedOpcode } )
    disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline,

  })

  callbacks = nil
  Extended = nil
end

function Extended.register(opcode, callback)
  if not callback or type(callback) ~= 'function' then
    error('Invalid callback.')
    return false
  end

  if opcode < 0 or opcode > 255 then
    error('Invalid opcode. Range: 0-255')
    return false
  end

  if callbacks[opcode] then
    error('Opcode is already taken.')
    return false
  end

  callbacks[opcode] = callback
  return true
end

function Extended.unregister(opcode)
  if opcode < 0 or opcode > 255 then
    error('Invalid opcode. Range: 0-255')
    return false
  end

  if not callbacks[opcode] then
    error('Opcode is not registered.')
    return false
  end

  callbacks[opcode] = nil
  return true
end
