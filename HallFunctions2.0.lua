---Hall of Malevolence - HallFunctions 2.0 - MΔXFORD 2023 - ♦Version 2.0♦ - 03/6/23 - 8/20/2023
local key = require "lib.vkeys"
local sampev = require 'lib.samp.events'
local im = require 'lib.imgui'
local plname = ''
local infotext = ''
local resp = false
local ele = 0
local element = 0
local endofpage = false
local found = false
local id1 = nil
local grpname = ''
local lastmember = ''
local button = 0
local running = false
local rolelist = false
local role = false
local mfind = false
local mfinder = false
local findfor = 'asd98456'
local gstats = false
local gstats2 = false
local grankmenu = false
local ranklist = false
local confirm = false
local results = {}
local resultstring = ''
local mtext = ''
local plname2 = ''
local kickmode = false
local inactivemode = false
local thandays = 0
local tosort = {}
local sorted = {}
local inmembers = {}
local definedlist = {}
local scorestring = ''
local linedays = 0
local btdays = 0
local activ = false
local mcheck = false
local mchecklist = ''
local leftlist = ''
local statsgrabber = false
local statsgrabber2 = false
local statsend = false
local statsw = false
local laststats = ''
local thefilename = ''
local AccID = 0
local AccName = ''
local ACount = 0
local CCount = 0
local statend = false
local files = {}
local firstfile = nil
local nextfile = nil
local wac = false
local getservertime = false
local activemembers = ''
local warlist = ''
local ptplist = ''
local cnrlist = ''
local frlist = ''
local ltick = 0
local ctick = 0
local retf = false
local second = 0
local grpid = ''
local acv = false
local therank = ''
local playerid = 0
local setrole = false
local rcount = 0
local menuloop = false
local argx = nil
local inputx = nil
local vipfind = false
local viplist = '{00FF00}PlayerName: \t {FFFF00}Subscription Type:{FFFFFF}\n'
local vipstat = false
local viptext = ''
local vc = 0
local cv = 0

function sampev.onShowDialog(dialogId, style, title, button1, button2, text) -->>>>                                                            																																		 --==
	if ranklist == true then                                                                                                             
		 if string.find(title, 'Group Rank') or  string.find(title, 'Group Role') then                                                   
			local function textlines( str )                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
				pos = p2 + 1                                                                                                             
			else                                                                                                                       
				line = str:sub( pos )                                                                                                    
				pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			
			if setrole == true then 
				sampSendDialogResponse(dialogId, 1, button, '')
				setrole = false
				if pcall(cancel) then
					--sampAddChatMessage("{00FF00}>> Succefully Changed Member Role", -1)
				else
					
				end					
			else
				text = string.lower(text)
				if string.find(text, therank) then
					local lc = 0 
					for line in textlines( text ) do                                                                                          
						lc = lc + 1
						if string.find(line, therank) then
							sampSendDialogResponse(dialogId, 1, lc-1, '')
							if pcall(cancel) then
								--sampAddChatMessage("{00FF00}>> Succefully Changed Member Rank to {00FFFF}"..string.upper(line), -1)
							else
							
							end						
							
							break
						end
					end	
				else
					if pcall(cancel) then
						sampAddChatMessage("{FF0000}>> Invalid HM Rank", -1)
					else
						
					end	
					sampSendDialogResponse(dialogId, 0, 0, '')
				end	
			end
			
			setrole = false
			ranklist = false                                                                                                               
			running = false                                                                                                                
			role = false
			--sampSendDialogResponse(dialogId, 1, button, '')
			return false                                                                                                                   
		 else                                                                                                                            
		  sampAddChatMessage("{00FFFF}>>> Error: Incorrect Dialog"..title, -1)                                                                  
		  ranklist = false                                                                                                               
		  running = false                                                                                                                
		  role = false                                                                                                                   
		 end                                                                                                                             
	end                                                                                                                                  
	
	if vipstat == true then
		if button1 == 'OK' then
		if string.find(text, 'Silver VIP') or  string.find(text, 'Bronze VIP') then
			local function forline( str ) -- Function For Line                                                                           --==
			local pos = 1;                                                                                                               --==
			return function()                                                                                                            --==
			if not pos then return nil end                                                                                               --==
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                             --==
			local line                                                                                                                   --==
			if p1 then                                                                                                                   --==
			line = str:sub( pos, p1 - 1 )                                                                                                --==
			pos = p2 + 1                                                                                                                 --==
			else                                                                                                                         --==
			line = str:sub( pos )                                                                                                        --==
			pos = nil                                                                                                                    --==
			end                                                                                                                          --==
			return line                                                                                                                  --==
			end                                                                                                                          --==
			end -- Function Memberlines                                                                                                     -				
			
			for line in forline( text ) do
				if line:match('%{.+%}(.+)%(%d+%)') then
					local playername = line:match('%{.+%}(.+%(%d+%))')
					viplist = viplist..playername..' \t '
				end
				if line:match('- VIP:			(.+)') then
					local vsub = line:match('- VIP:			(.+)')
					viplist = viplist..vsub..'{FFFFFF}\n'
				end
			end			
		end

						
		end
		--sampAddChatMessage("{FFFFFF}>>>B1 "..button1, -1) 
		--sampAddChatMessage("{00FFFF}>>>B2 "..button2, -1) 
		vipstat = false
		return false
	end
	
	if vipfind == true then
		if string.find(title, 'VIP') then	
			viptext = text
			vipfind = false
			for i in viptext:gmatch(" %- ") do
				vc = vc + 1
			end 			
			
			if pcall(vst) then 
			
			else
			
			end
			
			return false
		else
			
		end
		vipfind = false
	end
	
	if statsgrabber2 == true then
		if string.find(text, 'Account') then
			local function forline( str ) -- Function For Line                                                                           --==
			local pos = 1;                                                                                                               --==
			return function()                                                                                                            --==
			if not pos then return nil end                                                                                               --==
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                             --==
			local line                                                                                                                   --==
			if p1 then                                                                                                                   --==
			line = str:sub( pos, p1 - 1 )                                                                                                --==
			pos = p2 + 1                                                                                                                 --==
			else                                                                                                                         --==
			line = str:sub( pos )                                                                                                        --==
			pos = nil                                                                                                                    --==
			end                                                                                                                          --==
			return line                                                                                                                  --==
			end                                                                                                                          --==
			end -- Function Memberlines                                                                                                     -				
				
			
			laststats = text

			
			for line in forline( text ) do
				if line:match('{00FF00%}Account ID:		(%d+){FFFFFF}') then
					AccID = line:match('{00FF00%}Account ID:		(%d+){FFFFFF}')
					--print(AccID)
					sampAddChatMessage('{FF0000}>>{00FFFF}StatsGrabber {00FF00}'..AccID, -1)
				end
				
				if line:match('- Name:			(.+)') then
					AccName = line:match('- Name:			(.+)')
					--print(AccName)
					sampAddChatMessage('{FF0000}>>{00FFFF}StatsGrabber {00FF00}'..AccName, -1)
					if string.find(mchecklist, AccName, nil, true) then
						
					else
						leftlist = leftlist..'{FFFFFF}'..AccName..'	-	{FFFF00}'..AccID
					end
				end
			end
			statsgrabber = false
			return false
		else
			statsgrabber = false
			statsgrabber2 = false
			statend = true
		end
		return false
	end
	
	if mfinder == true then
		dID = dialogId
		dstyle = style 
		dtitle = title
		dbutton1 = button1 
		dbutton2 = button2 
		dtext = text
		retf = false
		if pcall(mfinderf) then 
			if retf == true then
				return false
			end
		else
			sampAddChatMessage(' >> {FF0000}Error', -1)
			return false
		end
	end                                                                                                                                  
	
	if grankmenu == true then                                                                                                            
		dID = dialogId
		dstyle = style 
		dtitle = title
		dbutton1 = button1 
		dbutton2 = button2 
		dtext = text
		retf = false
		if pcall(grankmenuf) then 
			if retf == true then
				return false
			end
		else
			sampAddChatMessage(' >> {FF0000}Error', -1)
			return false
		end
	end                                                                

	if gstats == true then                              
		dID = dialogId
		dstyle = style 
		dtitle = title
		dbutton1 = button1 
		dbutton2 = button2 
		dtext = text
		retf = false
		if pcall(gstatsf) then 
			if retf == true then
				return false
			end
		else
			sampAddChatMessage(' >> {FF0000}Error', -1)
			return false
		end
	end                              
end

function main() -->>>>
	dID = 0
	dstyle = 0 
	dtitle = ''
	dbutton1 = 0 
	dbutton2 = 0 
	dtext = ''

	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("grank", rank)
	sampRegisterChatCommand("grole", grole)
	sampRegisterChatCommand("mfind", mfindx)
	sampRegisterChatCommand("status", status)
	--sampRegisterChatCommand("res", res)
	sampRegisterChatCommand("act", acv)
	sampRegisterChatCommand("inact", inact)
	--sampRegisterChatCommand("awp", awp)
	sampRegisterChatCommand("statsgrabber", statsgrab)
	sampRegisterChatCommand("vipfind", vipfind)
	if 1 == 1 then
	sampAddChatMessage("", 0)	
	sampAddChatMessage("{505050}Hall{333333} of {b3245f}Ma{bf306c}le{d1417d}volence {FFFFFF}| {FFFF00}HallFunctions {00FF00}Successfully loaded.", -1)
	sampAddChatMessage("{FF0000}MAXFORD 2023", -1)
	sampAddChatMessage("", 0)
	

	if doesDirectoryExist(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence") then		
	else
		local dcreate = createDirectory(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence")
		sampAddChatMessage("{00FF00}>> GTA San Andreas User Files\\SAMP\\Hall Of Malevolence folder created", -1)	
	end


	if doesDirectoryExist(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\StatsGrabber") then
	else
		local dcreate = createDirectory(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\StatsGrabber")
		sampAddChatMessage("{00FF00}>> GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\StatsGrabber folder created", -1)
	end


	
	lua_thread.create(function()-----------------------------
		while true do wait(0)
			if sampIsDialogActive() then
				if pcall(keyp) then
					
				else
					
				end
				--keys
			else
				wait(500)
			end
		end
	end)
	
	lua_thread.create(function()-----------------------------
		while true do wait(500)
			if wac == true then
				second = os.date("%S")
				
				
				if tonumber(second) == 15 then
					--sampAddChatMessage("{00FF00}>>>>>>>>>>>>>>>>>>> 15 Second", -1)
					if pcall(warcount) then
						
					else
						
					end
					wait(1000)
				end
				if tonumber(second) == 30 then
					--sampAddChatMessage("{00FF00}>>>>>>>>>>>>>>>>>>> 15 Second", -1)
					if pcall(warcount) then
						
					else
						
					end				
					
					wait(1000)
				end
				if tonumber(second) == 45 then
					--sampAddChatMessage("{00FF00}>>>>>>>>>>>>>>>>>>> 15 Second", -1)
					if pcall(warcount) then
						
					else
						
					end				
					
					wait(1000)
				end
				if tonumber(second) == 00 then
					--sampAddChatMessage("{00FF00}>>>>>>>>>>>>>>>>>>> 15 Second", -1)
					if pcall(warcount) then
						
					else
						
					end				
					
					
					wait(1000)
				end
			end
		end
	end)	
	end

	wait(-1)
end

function sampev.onServerMessage(color, text)
	if getservertime == true then
		if string.find(text, 'Server Time') then
			thestime = text:match('>> Server Time: (%d+/%d+/%d+ %d+:%d+:%d+)')
			--local filx = io.open(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\StatsGrabber\\ServerTime.txt", "a+")
			--filx:write(text..'\n')
			--filx:close()
			
			local thegamemodes = [[
{FF0000} {FF9898}GZ / GWAR / GDERBY
{FFFFFF}Zwarlist
{00FF00} {FFFF9A}Protect the President
{FFFFFF}Zptplist
{00FFFF} {A9AFFF}Cops n Robbers
{FFFFFF}Zcnrlist
{FFFFFF} {93FFC8}Freeroam / Other	
{FFFFFF}Zfrlist
]]


			
			thegamemodes = string.gsub(thegamemodes, "Zwarlist", warlist)
			thegamemodes = string.gsub(thegamemodes, "Zptplist", ptplist)
			thegamemodes = string.gsub(thegamemodes, "Zcnrlist", cnrlist)
			thegamemodes = string.gsub(thegamemodes, "Zfrlist", frlist)
			local timezonestring = ''..os.date('%Z') --%Z
			sampShowDialog(11, "{FF3A27}Ongoing {FFFFFF}Members Activity", grpname..'\n{00FF00}Server Time: 	 	{00d43d}'..thestime..'\n	 	 	{9FFEA1}Paris, France\n{FFFF00}Local Time:		{FFFFFF}'..os.date('{00FFFF}%A{FFFFFF} %d %b %I:%M %p')..'\n{FFFF9A} 	 	 	'..timezonestring..'\n{FFFFFF}\n'..thegamemodes, 'OK', '', 0)
			running = false
			activ = false
			getservertime = false
			return false
		end
	end
end



--Pcalls
function vst ()
	lua_thread.create(function()-----------------------------
		wait(0)
		local function forlinex( str ) -- Function For Line                                                                           --==
		local pos = 1;                                                                                                               --==
		return function()                                                                                                            --==
		if not pos then return nil end                                                                                               --==
		local  p1, p2 = string.find( str, "\r?\n", pos )                                                                             --==
		local line                                                                                                                   --==
		if p1 then                                                                                                                   --==
		line = str:sub( pos, p1 - 1 )                                                                                                --==
		pos = p2 + 1                                                                                                                 --==
		else                                                                                                                         --==
		line = str:sub( pos )                                                                                                        --==
		pos = nil                                                                                                                    --==
		end                                                                                                                          --==
		return line                                                                                                                  --==
		end                                                                                                                          --==
		end -- Function Memberlines                                                                                                     -				
		
		for line in forlinex( viptext ) do
			cv = cv + 1
			if running == false then
				break
			end
			if line:match('%d+. .+%((%d+)%) %- (.+) %- .+') then
				local playerid, viptype = line:match('%d+. .+%((%d+)%) %- (.+) %- .+')
				--print(playerid..' '..viptype)
				if sampIsPlayerConnected(tonumber(playerid)) then
					sampSendChat("/stats "..playerid)
					vipstat = true
					while true do wait(0)
						if vipstat == false then
							--sampAddChatMessage("{00FFFF}>>> "..playerid, -1) 
							wait (2000)
							break
						end
					end						
				end
			elseif line:match('%d+. .+%((%d+)%) %- (.+)') then
				local playerid, viptype = line:match('%d+. .+%((%d+)%) %- (.+)')
				--print(playerid..' '..viptype)
				if sampIsPlayerConnected(tonumber(playerid)) then
					sampSendChat("/stats "..playerid)
					vipstat = true
					while true do wait(0)
						if vipstat == false then
							--sampAddChatMessage("{00FFFF}>>> "..playerid, -1) 
							wait (2000)
							break
						end
					end						
				end        
			else
				
			end
		end		
		running = false
		sampShowDialog(11, "{FFFF00} VIP Finder", viplist, 'OK', '', 5)
	end)	
end

function statsg () --- statsgrabber dialog
		argx = thefilename
		ACount = 0
		CCount = 0
		lua_thread.create(function()
			wait(0)
			sampShowDialog(10, "{707070}Hall of {b3245f}Ma{bf306c}le{d1417d}volence{FFFFFF} | StatsGrabber 2.0 by MAXFORD", '{FFFFFF}1: Collect the {FFFF00}AccountIDs{FFFFFF} from the current month {00FF00}Performance List{FFFFFF} with the number/rank you are asigned to\n2: Press {00FFFF}CTRL + V{FFFFFF} to paste it here and click run\n3: {FF0000}Note: Due to the limitations of SAMP GUI input keep the AccountIDs count below 10', "Run", "Cancel", 1)

			while true do wait(0)
				local thedialog, button, list, input = sampHasDialogRespond(10)
				--				
				if thedialog == true then
					if button == 0 then
						sampAddChatMessage('{FF0000} Exited', -1)               
						running = false                                                
						break                                                          
					end
					if button == 1 then
						inputx = input
						
						for i in input:gmatch("\n") do
							ACount = ACount + 1
						end 						
												
						
						if pcall(startstatsg) then
							
						else
														
						end						
						
						---------------------					
						break -- Last
					end-- Button 1
				--else
					--sampAddChatMessage('{FF0000} Exited', -1)
					--running = false
				end
			end-- Loop
		end)-- END THREAD
end

function startstatsg () --- statsgrabber main
	lua_thread.create(function()
		wait(0)
		filstat = io.open(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\StatsGrabber\\"..argx..os.date("_%d-%b-%Y")..".txt", "a+")
		filstat:write("╔══════════════════════╤══════════════════════╗\n║███████▓▓▒░░          │                      ║\n║             H∆LL OF M∆LEVOLENCE             ║\n║                      │          ░░▒▓████████║\n╚══════════════════════╧══════════════════════╜\n       HM_St∆tsGr∆bber 2.0  M∆XFORD 2023\n═══════════════════════════════════════════════\n")
		local thename = 'Stats of '..argx -- the text to center
		local ndiv = string.len(thename)  ---Lenght of the center text
		local ndiv = ndiv / 2 --Centervalue of the String
		local thestring = '                       '
		local stringlen = 23 --Lenght of side string
		local thestring = string.sub(thestring,1,stringlen-ndiv)
		--print(thestring..thename)  -- Write
		filstat:write(thestring..thename..'\n')
		
		local bool, myplayerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		local pfmanager = sampGetPlayerNickname(myplayerid)
		
		local thename = '♦ '..pfmanager..' ♦' -- the text to center
		local ndiv = string.len(thename)  ---Lenght of the center text
		local ndiv = ndiv / 2 --Centervalue of the String
		local thestring = '                       '
		local stringlen = 25 --Lenght of side string
		local thestring = string.sub(thestring,1,stringlen-ndiv)
		filstat:write("                    Members\n                       │\n              Performance Manager\n"..thestring..thename.."\n                       │\n═══════════════════════╧═══════════════════════\n\n▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄\n")		  
		filstat:write("                   "..os.date("%x").."\n")		  
		--wait(50)	   
		--filstat:close()
	
		running = true
		if pcall(waitingsts) then
			
		else
			
		end
	
		local function inputlines( str ) -- Function For Line
		local pos = 1;
		return function()
		if not pos then return nil end
		local  p1, p2 = string.find( str, "\r?\n", pos )
		local line
		if p1 then
		line = str:sub( pos, p1 - 1 )
		pos = p2 + 1
		else
		line = str:sub( pos )
		pos = nil
		end
		return line
		end
		end						
	
		for line in inputlines( inputx ) do wait(0)
			--sampAddChatMessage('{00FF00} >> '..line, -1)
			sampSendChat("/astats "..line)
			
			while true do wait(0)
				if running == false then
					break
				end
				if sampIsDialogActive() then
					laststats = sampGetDialogText()
					 sampCloseCurrentDialogWithButton(0)
					CCount = CCount + 1
					
					--sampAddChatMessage('{FF0000}>>{00FFFF}StatsGrabber {00FF00}COLLECTED', -1)
					filstat:write("▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀█▀\n"..laststats.."\n▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄\n                  "..os.date(" %x").."            \n")
					break
				end
			end
			
			if running == false then
				sampAddChatMessage('{FF0000}>>{00FFFF}StatsGrabber >>{FF0000}Cancelled', -1)
				statsgrabber2 = false
				statsend = false
				menuloop = false
				break
			end
			
			
			wait(2000)
		end----------------- for Inputline
		
		running = false -- last
		sampAddChatMessage('{FF0000}>>{00FFFF}StatsGrabber {00FF00}Task Completed', -1)
	    local start = 'start "" "'
        local l5 = getFolderPath(5)
        local en = '"'  		
        os.execute(start..l5.."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\StatsGrabber"..en)	 
		
		
		statsgrabber = false
		statsgrabber2 = false
		statsend = false
		menuloop = false	
		
		if leftlist == '' then
			
		else
			sampShowDialog(11, "{FF3A27}Left list", '{FFFFFF}These following members had left the group, you can remove their rows in the PF list\n'..leftlist, 'OK', '', 0)
		end
		
		filstat:close()
	end)
end

function waitingsts ()
		 lua_thread.create(function()-----------------------------
			while true do wait(0)
				if wasKeyPressed(key.VK_BACK) then
					statsgrabber = false
					statsgrabber2 = false
					inactivemode = false
					plname = ''
					infotext = ''
					resp = false
					resp2 = false
					ele = 0
					element = 0
					endofpage = false
					found = false
					id1 = nil
					grpname = ''
					lastmember = ''
					button = 0
					running = false
					rolelist = false
					role = false
					mfind = false
					mfinder = false
					findfor = 'asd98456'
					gstats = false
					gstats2 = false
					grankmenu = false
					ranklist = false
					confirm = false
					results = {}
					resultstring = ''
					mtext = ''
					sampAddChatMessage("{FF0000}>>> Halted>>>>", -1)
					confirm = false
					kickmode = false
					activ = false
					getservertime = false
					mcheck = false
					statsend = true
					statsw = false
					break
				end
				if running == false then
					printStyledString('', 1000, 6)
					--sampAddChatMessage("{FF0000}>>> Breaked>>>>", -1)					
					break 
				end
				printStyledString("~R~Stats ~W~"..CCount.." ~W~out ~W~of ~W~"..ACount.." ~W~Collected", 1000, 6)
				wait(50)                                                    
				printStyledString("~W~Stats ~R~"..CCount.." ~W~out ~W~of ~W~"..ACount.." ~W~Collected", 1000, 6)
				wait(50)                                                   
				printStyledString("~W~Stats ~W~"..CCount.." ~R~out ~W~of ~W~"..ACount.." ~W~Collected", 1000, 6)
				wait(50)                                                    
				printStyledString("~W~Stats ~W~"..CCount.." ~W~out ~R~of ~W~"..ACount.." ~W~Collected", 1000, 6)
				wait(50)                                                   
				printStyledString("~W~Stats ~W~"..CCount.." ~W~out ~w~of ~R~"..ACount.." ~W~Collected", 1000, 6)
				wait(50)                                                  
				printStyledString("~W~Stats ~W~"..CCount.." ~W~out ~w~of ~W~"..ACount.." ~R~Collected", 1000, 6)
				wait(50)
			end
		 end)
end

function thefilelist ()
	lua_thread.create(function()-----------------------------
		local points = 0
		local players = {}
		local thestring = ''
		if pcall(theawp) then
			for _, filename in ipairs(files) do
				local points = 0
				local pName = string.sub(filename, 0, -5)

				if string.find(mchecklist, pName, nil, true) then
					if doesFileExist(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\HallFunctions\\WarData\\"..os.date("%b%Y\\")..pName..'.txt') then
						file = io.open(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\HallFunctions\\WarData\\"..os.date("%b%Y\\")..pName..'.txt')lines = file:lines()print("Contents of file:");
						--sampAddChatMessage("{{FF00FF}File Exist "..pName, -1)
						points = 0
						for line in lines do wait(0)
							points = points + 1
						end
						    points = 15 * points
							points = points / 60

						
						
						
						players[pName] = points
						
						file:close()
					else
						--sampAddChatMessage("{{FF00FF}File Doesnt Exist", -1)
					end
				end
			end
			
			keys = {}
			for key, _ in pairs(players) do
				table.insert(keys, key)
			end
     
			table.sort(keys, function(keyLhs, keyRhs) return players[keyLhs] > players[keyRhs] end)
			for _, key in ipairs(keys) do
				local thepoints = tostring(players[key])
				thestring = thestring..'{FFFFFF}'..key..'\t\t\t\t{00FF00}'..thepoints..'\n'
				--scorestring = scorestring..definedlist[key]..' = '..sampGetPlayerNickname(key)..'\n'
			end
			sampShowDialog(14, "{FFFFFF}Active War Participants of {FFFF00}"..os.date("%B %Y"), '{00FF00}Playername\t\t\t\t{00FF00}Minutes\n'..thestring, 'OK', '', 5)
			mchecklist = ''
		else
			
			
		end
	end)
end

function theawp ()
	files = {}
	local firstfile, stringname = findFirstFile(getFolderPath(5).."/GTA San Andreas User Files/SAMP/Hall Of Malevolence/HallFunctions/WarData/"..os.date("%b%Y/").."*.txt")
	if firstfile == nil then
		--sampAddChatMessage("{{FF00FF}NO FILES", -1)		
	else
		--sampAddChatMessage("{{FF00FF}"..stringname, -1)
		table.insert(files, stringname)
		for i = 0, 100 do
			nextfile = findNextFile(firstfile)
			if nextfile == nil then
				--sampAddChatMessage("{{00FF00}END", -1)	
			else
				--sampAddChatMessage("{{FF0000}"..nextfile, -1)
				table.insert(files, nextfile)
			end
		end
	end--First File nil
end

function warcount ()
	if doesCharExist(PLAYER_PED) then
		local bool, myplayerid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		local mycolor = sampGetPlayerColor(myplayerid)
		--sampAddChatMessage("{00FFFF}>>>>>>>>>>>>>>>>>>> MY ID: "..myplayerid, -1)
		if isCharInAnyCar(PLAYER_PED) then
		else
			--sampAddChatMessage("{00FF00}>>>>>>>>>>>>>>>>>>> ON FOOT", -1)
			if mycolor == 4294901760 or mycolor == 4282137854 then
				for i = 0, 550 do
					if sampIsPlayerConnected(i) then
						local thatplcolor = sampGetPlayerColor(i)
						if mycolor == thatplcolor then
							local bool, thatplayer = sampGetCharHandleBySampPlayerId(i)
							if doesCharExist(thatplayer) then
								local thatplayername = sampGetPlayerNickname(i)
								filxaz = io.open(getFolderPath(5).."\\GTA San Andreas User Files\\SAMP\\Hall Of Malevolence\\HallFunctions\\WarData\\"..os.date("%b%Y\\")..thatplayername..".txt", "a+")
								filxaz:write("1\n")
								wait(100)
								filxaz:close()
								--sampAddChatMessage("{FFFF00}>>>>>>>> "..thatplayername, -1)
							end
						end
					end
				end
			end
		end
	end
end

function grankmenuf(arg)
	local dialogId = dID
	local style = dstyle
	local title = dtitle
	local button1 = dbutton1
	local button2 = dbutton2
	local text = dtext
	retf = false
	mtext = text                                                                                                                     
	if confirm == true then                                                                                                          
		plname = plname2                                                                                                             
	end                                                                                                                              
	 --sampAddChatMessage("{00FFFF}>>> Dialog "..title, -1)		                                                                     
	if string.find(text, plname, nil, true) and string.find(grpname, title) then                                                 
	 grankmenu = false                                                                                                           
	 --sampAddChatMessage("{FF0000}>>> "..text, -1)                                                                              
	 --------------------------------------------///////////	                                                                 
	 local function memberlines( str ) -- Function For Line                                                                      
	  local pos = 1;                                                                                                             
	  return function()                                                                                                          
	  if not pos then return nil end                                                                                             
	  local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
	  local line                                                                                                                 
	  if p1 then                                                                                                                 
		line = str:sub( pos, p1 - 1 )                                                                                            
           pos = p2 + 1                                                                                                             
	  else                                                                                                                       
           line = str:sub( pos )                                                                                                    
           pos = nil                                                                                                                
	  end                                                                                                                        
	  return line                                                                                                                
	  end                                                                                                                        
	 end -- Function Memberlines                                                                                                 
																				                                                 
	 for line in memberlines( text ) do                                                                                          
		if string.find(line, '{00FF00}Role') then                                                                                
			-------Do Nothing---------                                                                                           
		else                                                                                                                     
			local id1 = line:match "[^\n]+"                                                                                      
			if id1 == nil then                                                                                                   
			 -------Do Nothing---------                                                                                          
			else                                                                                                                 
			 if string.find(id1, '  '..plname, nil, true) then                                                                   
			  element = ele                                                                                                      
			  found = true                                                                                                       
			  break                                                                                                              
			 else                                                                                                                
			  found = false                                                                                                      
			 end                                                                                                                 
			 ele = ele + 1                                                                                                       
			end                                                                                                                  
		end                                                                                                                      
	 end	 		                                                                                                             
	 lua_thread.create(function()-----------------------------                                                                   
		while true do wait(0)                                                                                                    
			if found == false then break end                                                                                     
			if running == false then                                                                                             
				break                                                                                                            
			end                                                                                                                  
			if sampIsDialogActive() then                                                                                         
			 sampSetCurrentDialogListItem(element)                                                                               
			 --sampAddChatMessage("{00FFFF}>>> "..tostring(element), -1)                                                         
			 sampCloseCurrentDialogWithButton(1)                                                                                 
			 element = 0                                                                                                         
			 ele = 0                                                                                                             
			 if confirm == false then                                                                                            
				ranklist = true				 				                                                                     
			 else                                                                                                                
				ranklist = false                                                                                                 
				confirm = false                                                                                                  
				running = false                                                                                                  
			 end                                                                                                                 
			 grankmenu = false                                                                                                   
			 break                                                                                                               
			end                                                                                                                  
		end                                                                                                                      
	 end)                                                                                                                        
	----------------------------------------------------------                                                                   
	else                                                                                                                         
		element = 0                                                                                                                 
		ele = 0                                                                                                                     
		--sampAddChatMessage("{FF0000}>>> "..text, -1)                                                                              
		if string.find(grpname, title) then                                                                                         
			sampSendDialogResponse(dialogId, 0, 45, '')                                                                                 
			--return false                                                                                                                
			retf = true
		end                                                                                                                         
	end                                                                                                           
end

function gstatsf(arg)
	local dialogId = dID
	local style = dstyle
	local title = dtitle
	local button1 = dbutton1
	local button2 = dbutton2
	local text = dtext
	local text2 = dtext
	retf = false
	mtext = text2                                                                                                                  		
	if pcall(rolecolors) then text2 = mtext else end
	
	if string.find(title, 'Group Stats') then                                                                                    
	 --sampAddChatMessage("{00FFFF}>>> Dialog "..title, -1)                                                                      
																								                                 
	 if string.find(text, 'Please enter the group slot') then
		if acv == true then
			acv = false
			sampSendDialogResponse(dialogId, 1, 1, grpid)
		else
			sampSendDialogResponse(dialogId, 1, 1, '') 
		end                                                                      
		--return false
		retf = true
	 else                                                                                                                        
																								                                 
		local i, j = string.find(text, plname, nil, true)                                                                            
		if string.find(text, plname, nil, true) then            --plname, nil, true) then                                        
			--sampAddChatMessage("{00FF00}>>> HM Member", -1)                                                                
			sampSendDialogResponse(dialogId, 1, 0, ' ')                                                                      
			grpname = text:match "[^\n]+"			
			local function thelines( str ) -- Function For Line
			local pos = 1;
			return function()
			if not pos then return nil end
			local  p1, p2 = string.find( str, "\r?\n", pos )
			local line
			if p1 then
			line = str:sub( pos, p1 - 1 )
			pos = p2 + 1
			else
			line = str:sub( pos )
			pos = nil
			end
			return line
			end
			end
			grpname = text:match "[^\n]+"					                                                                 
			lastmember = nil	
				
			for line in thelines( text ) do
				if line:match('- Members:		(%d+)') then
					lastmember = line:match('- Members:		(%d+)')
				end 
			end
			
			if lastmember == nil then
				sampAddChatMessage("{FF0000}>>> Error", -1) 
			else
				if mfind == true then                                                                                            
					--sampAddChatMessage("{00FF00}>>> M-Find", -1)                                                               
					gstats = false                                                                                               
					mfind = false                                                                                                
					sampSendChat("/gmembers")                                                                                       
					mfinder = true                                                                                               
				else                                                                                                             
					if role == true then                                                                                         
						gstats = false                                                                                           
						grankmenu = true                                                                                         
						sampSendChat("/grole")                                                                                   
						role = false                                                                                             
					else                                                                                                         
						if kickmode == true then                                                                                 
							gstats = false                                                                                       
							grankmenu = true
							sampSendChat("/gkick")                                                                               
							kickmode = false                                                                                     
						else
							if activ == true then
								local function thelines( str ) -- Function For Line
								local pos = 1;
								return function()
								if not pos then return nil end
								local  p1, p2 = string.find( str, "\r?\n", pos )
								local line
								if p1 then
								line = str:sub( pos, p1 - 1 )
									pos = p2 + 1
								else
									line = str:sub( pos )
									pos = nil
								end
								return line
								end
								end
								
								for line in thelines( text2 ) do
									if line:match('%d+ - .+%((%d+)%) - .+') then
										local zplayername = line:match('%d+ %- (.+)%(%d+%) - .+')
										local zPlayerID = line:match('%d+ - .+%((%d+)%) - .+')
										local thatrank = line:match('%d+ %- .+%(%d+%) %- (.+)')
										--print(playername..'{FFFFFF}('..PlayerID..')')
										local zName = zplayername..'{FFFFFF} ('..zPlayerID..')'..' - '..thatrank
										--print(Name)
										local color = sampGetPlayerColor(tonumber(zPlayerID))
										
	
										if color == 4294901760 then -- War Red
											warlist = warlist..' {FFFFFF}-  '.."{FF0000}"..zName..'\n'
										elseif color == 4282137854 then -- War Blue
											warlist = warlist..' {FFFFFF}-  '.."{0000FF}"..zName..'\n'
										elseif color == 4294967295 then -- PTP President
											ptplist = ptplist..' {FFFFFF}-  '.."{FFFFFF}"..zName..'\n'
										elseif color == 536936192 then -- PTP FBI
											ptplist = ptplist..' {FFFFFF}-  '.."{00FF00}"..zName..'\n'
										elseif color == 540818687 then -- PTP police
											ptplist = ptplist..' {FFFFFF}-  '.."{0000FF}"..zName..'\n'
										elseif color == 553593900 then -- PTP Terror
											ptplist = ptplist..' {FFFFFF}-  '.."{FF0000}"..zName..'\n'
										elseif color == 4282137854 then
											cnrlist = cnrlist..' {FFFFFF}-  '.."{0000FF}"..zName..'\n'
										elseif color == 4294913068 then
											cnrlist = cnrlist..' {FFFFFF}-  '.."{FF0000}"..zName..'\n'
										elseif color == 4294932224 then
											cnrlist = cnrlist..' {FFFFFF}-  '.."{FF8200}"..zName..'\n'
										elseif color == 4294967040 then
											cnrlist = cnrlist..' {FFFFFF}-  '.."{FFFF00}"..zName..'\n'
										elseif color == 4294967295 then
											cnrlist = cnrlist..' {FFFFFF}-  '.."{FFFFFF}"..zName..'\n'
										else
											frlist = frlist..' {FFFFFF}-  '.."{FFFFFF}"..zName..'\n'
										end									
									end
								end
								activ = false
								getservertime = true
								gstats = false
								sampSendChat("/stime")
							else
								gstats = false                                                                                       
								grankmenu = true                                                                                     
								sampSendChat("/grank")											                                 
							end
						end                                                                                                      
					end					                                                                                         
				end                                                                                                                                                                                                                               
			end
			--sampAddChatMessage("{FFFF00}>>> "..lastmember..' Members', -1)                                                 
			--------------------------------------------------------------                                                   
		else                                                                                                                     
			infotext = "~R~Not HM Member"                                                                                        
			sampAddChatMessage("{FF0000}>>> Not HM Member", -1)                                                                  
			sampSendDialogResponse(dialogId, 1, 0, ' ')                                                                          
			running = false                                                                                                      
		end                                                                                                                      
		gstats = false                                                                                                           
		--return false
		retf = true		
	 end                                                                                                                         
	else
		if pcall(cancel) then
			sampAddChatMessage("{FF0000}>> Error Incorrect Dialog", -1)
		else
			
		end
	end                                                                                                                          		
end

function mfinderf(arg)
	local dialogId = dID
	local style = dstyle
	local title = dtitle
	local button1 = dbutton1
	local button2 = dbutton2
	local text = dtext
	retf = false
	mtext = text                                                                                                                     --==
	if pcall(rolecolors) then text = mtext else end                                                                                  --==
	text = string.gsub(text, "{00FF00}Member	{00FF00}Rank	{00FF00}Role	{00FF00}Last Active", "")                            --==

	
	local function memberlines( str ) -- Function For Line                                                                           --==
		local pos = 1;                                                                                                               --==
		return function()                                                                                                            --==
		if not pos then return nil end                                                                                               --==
		local  p1, p2 = string.find( str, "\r?\n", pos )                                                                             --==
		local line                                                                                                                   --==
		if p1 then                                                                                                                   --==
		line = str:sub( pos, p1 - 1 )                                                                                                --==
		pos = p2 + 1                                                                                                                 --==
		else                                                                                                                         --==
		line = str:sub( pos )                                                                                                        --==
		pos = nil                                                                                                                    --==
		end                                                                                                                          --==
		return line                                                                                                                  --==
		end                                                                                                                          --==
	 end -- Function Memberlines                                                                                                     --==
																																	 --==
	for line in memberlines( text ) do
		--==
		local caps = string.lower(line)                                                                                              --==
		if findfor == '' then				                                                                                         --==
			mfinder = false                                                                                                          --==
			running = false                                                                                                          --==
			break                                                                                                                    --==
		end                                                                                                                          --==
		if mcheck == true then
			mchecklist = mchecklist..text
		end																																	 --==
		if string.find(caps, findfor, nil, true) then

			if inactivemode == true then
			
				if line:match('.+  .+	.+	.+	(%d+) days') then
					linedays = line:match('.+  .+	.+	.+	(%d+) days')
					if tonumber(linedays) <= tonumber(btdays) then
						if tonumber(linedays) >= tonumber(thandays) or tonumber(linedays) == tonumber(thandays) then
							--table.insert(results, line)
							--text = '37  fSc_destiezk	Menace	Member	7 days'
							local rowID = line:match('(.+)  .+	.+	.+	.+ days')
							table.insert(definedlist,tonumber(rowID), tonumber(linedays))
							table.insert(inmembers, line)							
						end													
					else
					
					end
				else
				end
			else
				table.insert(results, line)
			end
		end                                                                                                                          --==			--==
		if string.find(caps, lastmember..'  ') then                                                                                  --==																																		 --==
			mfinder = false                                                                                                          --==
			running = false                                                                                                          --==
			
			--sorting--
			if inactivemode == true then
				local keys = {}

				for key, _ in pairs(definedlist) do
					table.insert(keys, key)
				end
				
				table.sort(keys, function(keyLhs, keyRhs) return definedlist[keyLhs] < definedlist[keyRhs] end)
				
				for _, key in ipairs(keys) do --key row id
					--print(definedlist[key], key)
					--print(key)
					table.insert(sorted,key)
					--scorestring = scorestring..definedlist[key]..'\t'..key..'\n'
				end
				
				for i in pairs(sorted) do
					--print(sorted[i])
					for j in pairs(inmembers) do
						if string.find(inmembers[j], tostring(sorted[i])..'  ', nil, true) then
							table.insert(results, inmembers[j])
						end
					end
				end
			else
				
			end
			-----------
			if pcall(joinstrings) then                                                                                               --==
				if inactivemode == true then
					inactivemode = false
					if btdays == 5001 then
						sampShowDialog(9, "{FFFF00}Inactive members more than {FFFFFF}"..thandays.." days", resultstring, "Actions", "Close", 4)
					else
						sampShowDialog(9, "{FFFF00}Inactive members between {FFFFFF}"..thandays..' - '..btdays.." {FFFF00}days", resultstring, "Actions", "Close", 4)		 						
					end
				else
					if mcheck == true then
						if statsgrabber == true then
							mcheck = false
							statsgrabber = false
							statsgrabber2 = false
							running = false
							--------------------
							if pcall(statsg) then
									
							else
								sampAddChatMessage("{00FFFF}>>>Error: STATSG FAILED"..line, -1)
							end
						else
						--[[
							if pcall(theawp) then
								if pcall(thefilelist) then
									
								else
									
								end
							else
								
							end]]
							
							mcheck = false
						end
					else
						sampShowDialog(9, " {FFFF00}Search Results For {FFFFFF} '"..findfor.."'", resultstring, "Actions", "Close", 4)		 --==
					end
				end
				--
				if pcall(themenu) then                                                                                               --==
																																	 --==
				else                                                                                                                 --==
					sampAddChatMessage("{00FFFF}>>>Error: MENU FAILED"..line, -1)	                                                 --==
				end                                                                                                                  --==
			else                                                                                                                     --==
				sampAddChatMessage(tostring(i)..' >>{00FFFF}Error: Menu Failed', -1)  					                             --==
			end                                                                                                                      --==
			break                                                                                                                    --==
		end			                                                                                                                 --==
	end                                                                                                                              --==
	sampSendDialogResponse(dialogId, 0, 45, '')                                                                                      --==
	--return false                                                                                                                     --==
	retf = true
end

function res(arg)

for i = 0, 200 do
	if results[i] == nil then
  else
	--sampAddChatMessage(tostring(i)..' >>{00FFFF}'..results[i], -1)  
	
  end
	if pcall(joinstrings) then
	
		if resultstring == '' then
			sampShowDialog(9, "{FFFF00}Search Results For ={FFFFFF} "..findfor, '{FF0000}>> {FFFF00}No matching results...', "", "OK", 4)			
		else
			sampShowDialog(9, "{FFFF00}Search Results For ={FFFFFF} "..findfor, resultstring, "Actions", "Close", 4)	
		end
	else
		sampAddChatMessage(tostring(i)..' >>{00FFFF}Menu Failed', -1)  					
	end
end
	
	
	
	
end

function actionmenu ()
	local stringg = '{00FF00}>>{FFFFFF}Change Rank \n{FFFF00}>>{FFFFFF}Change Role \n{FF0000}>>Kick {FFFF00}'..plname2..'\n{00FFFF}>>{FFFFFF}View Account Statics'
	sampShowDialog(10, '{FFFF00}'..plname2, stringg, "Select", "Close", 4)
	lua_thread.create(function()-----------------------------
	while true do wait(0)
		local result, button, list, input = sampHasDialogRespond(10)
		if result == true then	
			if button == 1 and list == 0 then
				--sampAddChatMessage('CHANGE RANK', -1)
				sampSendChat("/gstats")
				confirm = true
				gstats = true
				running = true
				if pcall(waiting) then
					
				else
					
				end			
				break
			end

			if button == 1 and list == 1 then
				--sampAddChatMessage('CHANGE ROLE', -1)
				sampSendChat("/gstats")
				confirm = true
				gstats = true			
				role = true
				running = true
				if pcall(waiting) then
					
				else
					
				end			
				break
			end
			
			if button == 1 and list == 2 then
				--sampAddChatMessage('KICK', -1)
				sampSendChat("/gstats")
				kickmode = true
				confirm = true
				gstats = true
				running = true
				if pcall(waiting) then
					
				else
					
				end
				break
			end

			if button == 1 and list == 3 then
				--sampAddChatMessage('VIEW ASTATS', -1)
				sampSendChat("/astats "..plname2)
				break
			end
			
			if button == 0 then
				--sampAddChatMessage('CLOSED', -1)
				break
			end

			
		end
	end
	end)
end

function themenu ()
	lua_thread.create(function()-----------------------------
		local exitt = false
		menuloop = true
		while true do wait(0)
			if menuloop == false then
				break
			end
			local result, button, list, input = sampHasDialogRespond(9)
			for i = 0, rcount+1 do wait(0)
				if result == true then
				if button == 1 and list == i then
					if i == rcount+1 then
						i = 0
					end
					i = i + 1
					if results[i] == nil then
						
					else
						--sampAddChatMessage("{00FFFF} MENU {00FF00}RESPONSE"..results[i], -1)
						plname2 = results[i]:match "[^\t]+"
						plname2 = plname2:match('.+  (.+)')
						--sampAddChatMessage(plname2, -1)
						exitt = true
						if pcall(actionmenu) then
						menuloop = false
						else
						sampAddChatMessage('ERROR ACTION MENU', -1)
						end
					end					
					break
					end
				if button == 0 then
					--sampAddChatMessage("Closed", -1)
					exitt = true
					menuloop = false
					break					
					end
				end
			end
			
			if exitt == true then
			--sampAddChatMessage("Exited Loop", -1)
			break
			end
			
		end
	end)	
end

function rolecolors ()
mtext = string.gsub(mtext, "Archangelo", "{e74c3c}Archangelo{FFFFFF}")
mtext = string.gsub(mtext, "Hall Lady", "{FA96FA}Hall Lady{FFFFFF}")
mtext = string.gsub(mtext, "H.N.I.C", "{523463}H.N.I.C{FFFFFF}")
mtext = string.gsub(mtext, "Emeritus", "{360001}Emeritus{FFFFFF}")
mtext = string.gsub(mtext, "Exalted", "{1abc9c}Exalted{FFFFFF}")
mtext = string.gsub(mtext, "Eminent", "{f1c40f}Eminent{FFFFFF}")
mtext = string.gsub(mtext, "Revered", "{e67d22}Revered{FFFFFF}")
mtext = string.gsub(mtext, "Lady Regnant", "{00ddff}Lady Regnant{FFFFFF}") -- Exultant
mtext = string.gsub(mtext, "Viceroy", "{992d22}Viceroy{FFFFFF}")
mtext = string.gsub(mtext, "Menace", "{796d63}Menace{FFFFFF}")
mtext = string.gsub(mtext, "Sentinel", "{0900ff}Sentinel{FFFFFF}")
mtext = string.gsub(mtext, "Dignitary", "{3498db}Dignitary{FFFFFF}")
mtext = string.gsub(mtext, "Vexillarius", "{e91e63}Vexillarius{FFFFFF}")
mtext = string.gsub(mtext, "Vexilifer", "{4a0f64}Vexilifer{FFFFFF}") -- Chevalier
mtext = string.gsub(mtext, "Esquier", "{02ffd5}Esquier{FFFFFF}")
mtext = string.gsub(mtext, "Legion", "{9b59b6}Legion{FFFFFF}")
mtext = string.gsub(mtext, "Venator", "{71368a}Venator{FFFFFF}")
mtext = string.gsub(mtext, "Dead And Rotting In Hell", "{FF8200}Dead {FF4A00}And {FF1F00}Rotting {FF0000}In Hell{FFFFFF}")
mtext = string.gsub(mtext, "Associate (NG)", "{ff0000}Associate (NM){FFFFFF}")
mtext = string.gsub(mtext, "Associate (SG)", "{00ffff}Associate (SG){FFFFFF}")
mtext = string.gsub(mtext, "Associate", "{00d43d}Associate{FFFFFF}")
end

function waiting ()
		 lua_thread.create(function()-----------------------------
			while true do wait(0)
				if wasKeyPressed(key.VK_BACK) then
					grpid = ''
					acv = false
					statsgrabber = false
					statsgrabber2 = false
					inactivemode = false
					plname = ''
					infotext = ''
					resp = false
					resp2 = false
					ele = 0
					element = 0
					endofpage = false
					found = false
					id1 = nil
					grpname = ''
					lastmember = ''
					button = 0
					running = false
					rolelist = false
					role = false
					mfind = false
					mfinder = false
					findfor = 'asd98456'
					gstats = false
					gstats2 = false
					grankmenu = false
					ranklist = false
					confirm = false
					results = {}
					resultstring = ''
					mtext = ''
					sampAddChatMessage("{FF0000}>>> Halted>>>>", -1)
					confirm = false
					kickmode = false
					activ = false
					getservertime = false
					mcheck = false
					menuloop = false
					setrole = false
					acv = false
					vipfind = true
					viplist = '{00FF00}PlayerName: \t {FFFF00}Subscription Type:{FFFFFF}\n'
					vipstat = false
					viptext = ''
					break
				end
				if running == false then
					printStyledString(infotext, 1000, 6)
					--sampAddChatMessage("{FF0000}>>> Breaked>>>>", -1)					
					break 
				end
				printStyledString("~R~waiting ~W~for ~W~uif ~W~response", 1000, 6)
				wait(50)
				printStyledString("~W~waiting ~R~for ~W~uif ~W~response", 1000, 6)
				wait(50)
				printStyledString("~W~waiting ~W~for ~R~uif ~W~response", 1000, 6)
				wait(50)
				printStyledString("~W~waiting ~W~for ~W~uif ~R~response", 1000, 6)
				wait(50)

			end
		 end)
		 
end

function waitingv ()
		 lua_thread.create(function()-----------------------------
			while true do wait(0)
				if wasKeyPressed(key.VK_BACK) then
					grpid = ''
					acv = false
					statsgrabber = false
					statsgrabber2 = false
					inactivemode = false
					plname = ''
					infotext = ''
					resp = false
					resp2 = false
					ele = 0
					element = 0
					endofpage = false
					found = false
					id1 = nil
					grpname = ''
					lastmember = ''
					button = 0
					running = false
					rolelist = false
					role = false
					mfind = false
					mfinder = false
					findfor = 'asd98456'
					gstats = false
					gstats2 = false
					grankmenu = false
					ranklist = false
					confirm = false
					results = {}
					resultstring = ''
					mtext = ''
					sampAddChatMessage("{FF0000}>>> Halted>>>>", -1)
					confirm = false
					kickmode = false
					activ = false
					getservertime = false
					mcheck = false
					menuloop = false
					setrole = false
					acv = false
					vipfind = true
					viplist = '{00FF00}PlayerName: \t {FFFF00}Subscription Type:{FFFFFF}\n'
					vipstat = false
					viptext = ''
					break
				end
				if running == false then
					printStyledString(infotext, 1000, 6)
					--sampAddChatMessage("{FF0000}>>> Breaked>>>>", -1)					
					break 
				end
				printStyledString("~R~Pro~W~cessing ~n~~W~"..cv..'/'..vc, 1000, 6)
				wait(50)
				printStyledString("~W~Pro~R~ces~W~sing ~n~~W~"..cv..'/'..vc, 1000, 6)
				wait(50)
				printStyledString("~W~Proces~R~sing ~n~~W~"..cv..'/'..vc, 1000, 6)
				wait(50)
				printStyledString("~W~Processing ~n~~W~"..cv..'/'..vc, 1000, 6)
				wait(50)
			end
		 end)
		 
end

function joinstrings ()
local first = false
local elc = 0

for i = 0, 205 do
	if results[i] == nil then
	else
	
	
	
	
	if first == false then
		resultstring = results[i] .. '\n'
		first = true
		elc = elc + 1
		rcount = elc
	else
		resultstring = resultstring .. results[i] .. '\n'
		elc = elc + 1
		rcount = elc
	end
  end
end
	
	
end

function cancel ()
 plname = ''
 infotext = ''
 resp = false
 resp2 = false
 ele = 0
 element = 0
 endofpage = false
 found = false
 id1 = nil
 grpname = ''
 lastmember = ''
 button = 0
 running = false
 rolelist = false
 role = false
 mfind = false
 mfinder = false
 findfor = 'asd98456'
 gstats = false
 gstats2 = false
 grankmenu = false
 ranklist = false
 confirm = false
 results = {}
 resultstring = ''
 mtext = ''
 plname2 = ''
 kickmode = false
 inactivemode = false
 thandays = 0
 tosort = {}
 sorted = {}
 inmembers = {}
 definedlist = {}
 scorestring = ''
 linedays = 0
 btdays = 0
 activ = false
 mcheck = false
 mchecklist = ''
 leftlist = ''
 getservertime = false
 activemembers = ''
 warlist = ''
 ptplist = ''
 cnrlist = ''
 frlist = ''
 ltick = 0
 ctick = 0
 acv = false
 therank = ''
 playerid = 0
 setrole = false
end

function keyp ()
	if wasKeyPressed(key.VK_A) then
		local capt = sampGetDialogCaption()
		if string.find(capt, "Group Stat") then
			local text = sampGetDialogText()
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 

			for line in textlines( text ) do   
				if line:match('- Group Slot:		(%d+)') then
					local groupID = line:match('- Group Slot:		(%d+)')
					--sampAddChatMessage("{00FF00}>>: "..groupID, -1)
						
					acv = true
					
					sampCloseCurrentDialogWithButton(0)
					sampSendChat("/gstats "..groupID)
					
					running = true
					activ = true
					gstats = true
					
					activemembers = ''
					warlist = ''
					ptplist = ''
					cnrlist = ''
					frlist = ''
					
					
					if pcall(waiting) then
						
					else
						
					end	
				end
			end	
		end

		if string.find(capt, "Player Stat") then
			local text = sampGetDialogText()
			
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			
			for line in textlines( text ) do   
				if line:match('- Account ID:		(%d+)') then
					local AccID =  line:match('- Account ID:		(%d+)')
					sampAddChatMessage("{FF0000}>> {00FF00}Copied {FFFFFF}AccountID {00FF00}to clipboard: {FFFF00}"..AccID, -1)
					im.SetClipboardText(AccID)
				end
			end						
		end
		
		if string.find(capt, "Account Stat") then
			local text = sampGetDialogText()

			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			
			for line in textlines( text ) do   
				if line:match('%{.+%}Account ID:		(%d+)%{.+%}') then
					local AccID = line:match('%{.+%}Account ID:		(%d+)%{.+%}')
					sampAddChatMessage("{FF0000}>> {00FF00}Copied {FFFFFF}AccountID {00FF00}to clipboard: {FFFF00}"..AccID, -1)
					im.SetClipboardText(AccID)
				end
			end
		end	
	end
	
	if wasKeyPressed(key.VK_C) then
	local capt = sampGetDialogCaption()

		if string.find(capt, "Player Stat") then
			local text = sampGetDialogText()
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			
			local PlayerName  = ''
			local AccID = ''
			for line in textlines( text ) do
				if line:match('%{.+%}(.+)%(%d+%)') then
					PlayerName = line:match('%{.+%}(.+)%(%d+%)')
					--sampAddChatMessage("{00FF00}>>: "..PlayerName, -1)
				end
			
				if line:match('- Account ID:		(%d+)') then
					AccID =  line:match('- Account ID:		(%d+)')
					sampAddChatMessage("{FF0000}>> {00FF00}Copied {FFFFFF}AccountID {00FF00}and {FFFFFF}PlayerName {00FF00}to Clipboard", -1)
					im.SetClipboardText(PlayerName..' - '..AccID)
				end
			end
		end
		
		if string.find(capt, "Account Stat") then
			local text = sampGetDialogText()
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			local AccID = ''
			local PlayerName = ''
			
			for line in textlines( text ) do
				if line:match('%{.+%}Account ID:		(%d+)%{.+%}') then
					AccID = line:match('%{.+%}Account ID:		(%d+)%{.+%}')
				end
				
				if line:match('- Name:			(.+)') then
					PlayerName = line:match('- Name:			(.+)')
					sampAddChatMessage("{FF0000}>> {00FF00}Copied {FFFFFF}AccountID {00FF00}and {FFFFFF}PlayerName {00FF00}to Clipboard", -1)
					im.SetClipboardText(PlayerName..' - '..AccID)
				end
			end
			
		end	



	
	end


	if wasKeyPressed(key.VK_N) then
		local capt = sampGetDialogCaption()
		if string.find(capt, "Player Stat") then
			local text = sampGetDialogText()
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			

			for line in textlines( text ) do
				if line:match('%{.+%}(.+)%(%d+%)') then
					local PlayerName = line:match('%{.+%}(.+)%(%d+%)')
					sampAddChatMessage("{FF0000}>> {00FF00}Copied {FFFFFF}Playername {00FF00}to Clipboard", -1)
					im.SetClipboardText(PlayerName)
				end
			end
		end
		
		if string.find(capt, "Account Stat") then
			local text = sampGetDialogText()
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
									
			for line in textlines( text ) do   
				if line:match('- Name:			(.+)') then
					local PlayerName = line:match('- Name:			(.+)')
					sampAddChatMessage("{FF0000}>> {00FF00}Copied {FFFFFF}Playername {00FF00}to Clipboard", -1)
					im.SetClipboardText(PlayerName)
				end
			end
			--sampAddChatMessage("{00FF00}>>: "..capt, -1)
		end	
	end

	if wasKeyPressed(key.VK_3) then
		local capt = sampGetDialogCaption()
		if string.find(capt, "Group Stat") then
			local text = sampGetDialogText()					
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			
			
	
			for line in textlines( text ) do   
				if line:match('- Group Slot:		(%d+)') then
					local groupID = line:match('- Group Slot:		(%d+)')
					sampSendChat("/gderby "..groupID)
				end
			end
	
			--sampSendChat("/gderby "..groupID)
		end
	end
	
	if wasKeyPressed(key.VK_2) then
		local capt = sampGetDialogCaption()
		if string.find(capt, "Group Stat") then
		
			local text = sampGetDialogText()
			local function textlines( str ) -- Function For Line                                                                      
			local pos = 1;                                                                                                             
			return function()                                                                                                          
			if not pos then return nil end                                                                                             
			local  p1, p2 = string.find( str, "\r?\n", pos )                                                                           
			local line                                                                                                                 
			if p1 then                                                                                                                 
				line = str:sub( pos, p1 - 1 )                                                                                            
					pos = p2 + 1                                                                                                             
			else                                                                                                                       
					line = str:sub( pos )                                                                                                    
					pos = nil                                                                                                                
			end                                                                                                                        
			return line                                                                                                                
			end                                                                                                                        
			end -- Function Memberlines                                                                                                 
			

			for line in textlines( text ) do   
				if line:match('- Group Slot:		(%d+)') then
					local groupID = line:match('- Group Slot:		(%d+)')
					sampSendChat("/gwar "..groupID)
				end
			end
		end
	end
end

--Commands
function statsgrab(arg)
	if #arg == 0 then
		sampAddChatMessage("", 0)
		sampAddChatMessage("{FA68FF}>>> {FF0073}Syntax: {FFA6A6}/statsgrabber <FileName>", -1)
		sampAddChatMessage("", 0)
	else
		if running == false then
			thefilename = arg
			resultstring = {}
			results = {}
			if pcall(statsg) then
			
			else
			
			end
		else
			
		end
	end
end

function awp(arg)
		resultstring = {}
		results = {}
		mfind = true
		gstats = true
		findfor = 'ASdfgxz789'
		mcheck = true
		running = true
		mchecklist = ''
		sampSendChat("/gstats")
		sampAddChatMessage("{{00FF00}>>> {00FFFF}Collecting Members data Please wait... {FF0000}(Hold BACKSPACE to Cancel)", -1)
		plname = ''
		if pcall(waiting) then
			
		else
			
		end	
end

function acv(arg)
	if string.match(arg, '%d+') then
		grpid = arg:match('%d+')
		acv = true
		--grpid = ''
		sampSendChat("/gstats")
		running = true
		activ = true
		gstats = true
	
		activemembers = ''
		warlist = ''
		ptplist = ''
		cnrlist = ''
		frlist = ''
		if pcall(waiting) then
				
		else
			
		end			
		
		
	else
		grpid = ''
		sampSendChat("/gstats")
		running = true
		activ = true
		gstats = true
	
		activemembers = ''
		warlist = ''
		ptplist = ''
		cnrlist = ''
		frlist = ''
		if pcall(waiting) then
				
		else
			
		end			
	end
end

function status(arg)
	local text = [[
	{FFFFFF}
	running = azx1
	mfind = azx2
	mfinder = azx3
	kickmode = azx4
	confirm = azx5
	ranklist = azx6
	grankmenu = azx7
	gstats2 = azx8
	gstats = azx9
	rolelist = az11
	role = az12
	acv = az13
	setrole = az14
	kickmode = az15
	inactivemode = az16
	activ = az17
	mcheck = az18	
	statsgrabber = az19
	statsgrabber2 = az20
	statsend = az21
	statsw = az22
	menuloop = az23
	]]
	
	text = string.gsub(text, "azx1", tostring(running))
	text = string.gsub(text, "azx2", tostring(mfind))
	text = string.gsub(text, "azx3", tostring(mfinder))
	text = string.gsub(text, "azx4", tostring(kickmode))
	text = string.gsub(text, "azx5", tostring(confirm))
	text = string.gsub(text, "azx6", tostring(ranklist))
	text = string.gsub(text, "azx7", tostring(grankmenu))
	text = string.gsub(text, "azx8", tostring(gstats2))
	text = string.gsub(text, "azx9", tostring(gstats))
	text = string.gsub(text, "az11", tostring(rolelist))
	text = string.gsub(text, "az12", tostring(role))
	text = string.gsub(text, "az13", tostring(acv))
	text = string.gsub(text, "az14", tostring(setrole))
	text = string.gsub(text, "az15", tostring(kickmode))
	text = string.gsub(text, "az16", tostring(inactivemode))
	text = string.gsub(text, "az17", tostring(activ))
	text = string.gsub(text, "az18", tostring(mcheck))
	text = string.gsub(text, "az19", tostring(statsgrabber))
	text = string.gsub(text, "az20", tostring(statsgrabber2))
	text = string.gsub(text, "az21", tostring(statsend))
	text = string.gsub(text, "az22", tostring(statsw))
	text = string.gsub(text, "az23", tostring(menuloop))
	text = string.gsub(text, "false", '{FF0000}False{FFFFFF}')
	text = string.gsub(text, "true", '{00FF00}True{FFFFFF}')

	sampShowDialog(11, "{FF3A27}Variable Status", text, 'OK', '', 0)
end

function mfindx(arg)
	if #arg == 0 then
		sampAddChatMessage(" ", 0)	
		sampAddChatMessage("{FA68FF}>>> {FF0073}Syntax: {FFA6A6}/mfind <name>", -1)	
		sampAddChatMessage(" ", 0)
	elseif string.find(arg, 'All') then
		resultstring = {}
		results = {}
		mfind = true
		gstats = true
		findfor = " "
		sampSendChat("/gstats")
		
		running = true
		sampAddChatMessage("{{00FF00}>>> {00FFFF}Collecting Members data Please wait... {FF0000}(Hold BACKSPACE to Cancel)", -1)
		plname = ''
		if pcall(waiting) then
				
		else
			
		end				
	else
		resultstring = {}
		results = {}
		mfind = true
		gstats = true
		findfor = string.lower(arg)
		sampSendChat("/gstats")
		
		running = true
		sampAddChatMessage("{{00FF00}>>> {00FFFF}Collecting Members data Please wait... {FF0000}(Hold BACKSPACE to Cancel)", -1)
		plname = ''
		if pcall(waiting) then
				
		else
			
		end		
	end
end

function inact(arg)
	if arg:match('(%d+) %d+') then
		btdays = arg:match('%d+ (%d+)')
		resultstring = {}
		results = {}
		thandays = 0		
		tosort = {}
		sorted = {}
		inmembers = {}		
		definedlist = {}		
		scorestring = ''		
		mfind = true
		gstats = true
		inactivemode = true
		findfor = 'days'
		sampSendChat("/gstats")
		thandays = arg:match('(%d+) %d+')
		running = true
		sampAddChatMessage("{{00FF00}>>> {00FFFF}Collecting Members data Please wait... {FF0000}(Hold BACKSPACE to Cancel)", -1)
		plname = ''
		if pcall(waiting) then
			
		else
			
		end		
	elseif arg:match('(%d+)') then
		btdays = 5001
		resultstring = {}
		results = {}
		thandays = 0		
		tosort = {}
		sorted = {}
		inmembers = {}		
		definedlist = {}		
		scorestring = ''		
		mfind = true
		gstats = true
		inactivemode = true
		findfor = 'days'
		sampSendChat("/gstats")
		thandays = arg:match('(%d+)')
		running = true
		sampAddChatMessage("{{00FF00}>>> {00FFFF}Collecting Members data Please wait... {FF0000}(Hold BACKSPACE to Cancel)", -1)
		plname = ''
		if pcall(waiting) then
			
		else
			
		end	
	else
		sampAddChatMessage("{FA68FF}>>> {FF0073}Syntax: {FFA6A6}/inact <Startdays> <Betweendays>", -1)	
	end
end

function grole(arg)
	if #arg == 0 then
		sampSendChat("/grole")		
	else
		if running == true then
			sampAddChatMessage("{{FF0000}Already Running", -1)		   
		else
			if arg:match('(%d+) .+') and arg:match('.+ (.+)') then
				playerid = arg:match('(.+) .+')
				specrole = arg:match('.+ (.+)')
				playerid = tonumber(playerid)
				if string.find('member', specrole) then
					print('Member')
					rankdet = true
					button = 0
					setrole = true
				elseif string.find('leader', specrole) then
					print('Leader')
					rankdet = true
					button = 2
					setrole = true
				elseif string.find('coleader', specrole) then
					print('Co-leader')
					rankdet = true
					button = 1
					setrole = true
				else
					   
				end
				
				if rankdet == true then
					if sampIsPlayerConnected(playerid) then
						plname = sampGetPlayerNickname(playerid)
						sampSendChat("/gstats")		  
						gstats = true			
						role = true
						running = true
						sampAddChatMessage("{{FF0000}>>> {FFFF00}Waiting for UIF Response {FF0000}Hold BACKSPACE to Cancel", -1)
						if pcall(waiting) then
				
						else
			
						end
					else
						
					end
				else
				end
			else
				sampAddChatMessage(" ", 0)	
				sampAddChatMessage("{FA68FF}>>> {FF0073}Syntax: {FFA6A6}/grole <PlayerID> <role>", -1)	
				sampAddChatMessage(" ", 0)
			end	
		end
	end
end

function rank(arg)
	if #arg == 0 then
		sampSendChat("/grank")		
	else
		arg = string.lower(arg)
		if running == true then
			sampAddChatMessage("{{FF0000}Already Running", -1)		   
		else
			if arg:match('(%d+) .+') then
				therank =  arg:match('%d+ (.+)')
				playerid = arg:match('(%d+) .+')
				if sampIsPlayerConnected(playerid) then
					plname = sampGetPlayerNickname(playerid)
					--sampAddChatMessage("{{FF0000}>>> {FFFFFF}Setting {FFFF00}"..plname.." {FFFFFF}Rank to "..rankx, -1)	
					sampAddChatMessage("{{FF0000}>>> {FFFF00}Waiting for UIF Response {FF0000}Hold BACKSPACE to Cancel", -1)
					sampSendChat("/gstats")
					running = true
					gstats = true
					if pcall(waiting) then
				
					else
			
					end
				else
					sampAddChatMessage("{{FF0000}>>> Player not connected", -1)
				end
			else
				sampAddChatMessage(" ", 0)	
				sampAddChatMessage("{FA68FF}>>> {FF0073}Syntax: {FFA6A6}/grank <PlayerID> <rankname>", -1)	
				sampAddChatMessage(" ", 0)
			end
		end -- running end
	end -- Command End
end

function vipfind(arg)
	lua_thread.create(function()-----------------------------
		if viplist == '{00FF00}PlayerName: \t {FFFF00}Subscription Type:{FFFFFF}\n' then
			vipfind = true
			viplist = '{00FF00}PlayerName: \t {FFFF00}Subscription Type:{FFFFFF}\n'
			vipstat = false
			viptext = ''
			sampSendChat("/vips")
			running = true
			vc = 0
			cv = 0
			
			if pcall(waitingv) then
						
			else
					
			end
		else
			sampShowDialog(6, "{FFFF00} VIP Finder", '{FFFFFF}Do you want to view last find results or Run search again?', 'find again', 'Last Res', 0)
			while true do wait(0)
				if sampIsDialogActive() then
					break
				end
			end
			
			while true do wait(0)
				local result, button, list, input = sampHasDialogRespond(6)
				
				if result == true then
					if button == 1 then
						vipfind = true
						viplist = '{00FF00}PlayerName: \t {FFFF00}Subscription Type:{FFFFFF}\n'
						vipstat = false
						viptext = ''
						sampSendChat("/vips")
						running = true
						vc = 0
						cv = 0
						if pcall(waitingv) then
									
						else
								
						end							
						break
					end
					if button == 0 then
						sampShowDialog(11, "{FFFF00} VIP Finder", viplist, 'OK', '', 5)					
						break
					end						
				end
			end
		end
	end)		
end



