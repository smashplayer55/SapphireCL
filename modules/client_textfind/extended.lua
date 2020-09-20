function init()

	connect(g_game, 'onTextMessage', serverComunication)
	connect(g_game, { onGameEnd = hide } )
end

function terminate()
	disconnect(g_game, { onGameEnd = hide })
	disconnect(g_game, 'onTextMessage', serverComunication)

end

function hide()
end

GLOBAL_CITY = {'Saffron', 'Cerulean'}

function serverComunication(mode, text)
	if not g_game.isOnline() then
		return
	end
	
	if mode == MessageModes.Failure then
		if text:find("PokeInfoReset") then
		modules.game_pokeinffo.setPokeInfo(' - ','-',0,0,1,0,7746,0,0,100)
		modules.game_pokeinffo.removePokeAttr();
		return
		
		elseif text:match("CP:(.-)!M:(.+)") then
		local name,skill = text:match("CP:(.-)!M:(.+)")
		local skills = {}
		local ss = 0
		for m,name,level,cd,id,ex in skill:gmatch("|m(%d+)@(.-)@(%d+)@(%d+)@(%d+)@(%d+)|") do
		ss = ss+1
		skills[tonumber(m)] = {name,level,cd,id,ex}
		end
		modules.game_pokewindow.callWindow({name=name,s=ss,sk=skills})
		
		elseif text:find("PokeInfoAtk") then
			
		elseif text:find("##77PIN,CUT") then
		modules.game_pokeinffo.setPokeAttribute("CUT");
		
		elseif text:find("##77PIN,DIG") then
		modules.game_pokeinffo.setPokeAttribute("DIG");
		
		elseif text:find("##77PIN,TPR") then
		modules.game_pokeinffo.setPokeAttribute("TPR");
		
		elseif text:find("##77PIN,LGT") then
		modules.game_pokeinffo.setPokeAttribute("LGT");
		
		elseif text:find("##77PIN,FLY") then
		modules.game_pokeinffo.setPokeAttribute("FLY");
		
		elseif text:find("##77PIN,RSM") then
		modules.game_pokeinffo.setPokeAttribute("RSM");
		
		elseif text:find("##77PIN,BLK") then
		modules.game_pokeinffo.setPokeAttribute("BLK");
		
		elseif text:find("##77PIN,SRF") then
		modules.game_pokeinffo.setPokeAttribute("SRF");
		
		elseif text:find("##77PIN,RDI") then
		modules.game_pokeinffo.setPokeAttribute("RDI");
		
		elseif text:find("##77PIN:RMATTR") then
		modules.game_pokeinffo.removePokeAttr();
		
		elseif text:find("PokeInfo") then
		local param = text:explode("@")
		modules.game_pokeinffo.setPokeInfo(param[1],param[2],tonumber(param[3]),tonumber(param[4]),tonumber(param[5]),tonumber(param[6]),7746,tonumber(param[8]),tonumber(param[9]),tonumber(param[10]),tonumber(param[12]),tonumber(param[12]))
		


			-- local tt = text:match("##system##LP(.+)")
			-- if tt ~= '?' then
				-- local pokestr = ""
				-- content = {}
				-- for poke,id,hp,hpmax,is,use,boost,uid in tt:gmatch("|(.-):(%d+):(%d+):([%d%.]+):([%d%.]+):([%d%.]+):(%d+):(%d+):(%d+):(%d+)|") do
					-- local maxp = tonumber(hpmax)
					-- pokestr = pokestr..poke..';'
					-- content[#content+1] = {poke,tonumber(id),tonumber(hp),maxep,tonumber(is),tonumber(use),tonumber(boost)}
				-- end
				-- modules.client_entergame.LEPOKES[modules.client_entergame.LESELECTED] = pokestr;
			-- end
			-- modules.game_pokelists.reFresh(content)
					
			return
		end
	end
end