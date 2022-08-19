local discordWebhookURL = "X"

function log(message)
    sendOptions = {
        formFields = {
            content="```" .. os.date("%x %X", os.time()) .. " » " ..message.."```"
        },
    }
    fetchRemote ( discordWebhookURL, sendOptions, WebhookCallback )
end

local discordWebhookURLComum = "X"

function logComum(message)
    sendOptions = {
        formFields = {
            content="```" .. os.date("%x %X", os.time()) .. " » " ..message.."```"
        },
    }
    fetchRemote ( discordWebhookURLComum, sendOptions, WebhookCallback )
end

function WebhookCallback(responseData) 
	outputDebugString("(Discord webhook callback): responseData: "..responseData)
end

chatTime = {}
anonimo = true -- I
foraDeRP = true -- U
twitter = true -- Y
localChat = true -- T

function mensagemAnonimo ( source, cmd, ... )
	if getElementData(source, "Inconsciente") and getElementData(source, "Inconsciente") ==  true then return outputChatBox("#800000• SRP • Não podes comunicar inconsciente.", source, 255, 255, 255, true) end
	local contaJogador = getPlayerAccount(source)
	if not isGuestAccount(contaJogador) then
		if chatTime[source] and chatTime[source] + 3000 > getTickCount() then
			return outputChatBox("#800000• SRP • Espera mais um pouco para mandar outra mensagem.", source, 255, 255, 255, true)
		else
			chatTime[source] = getTickCount()
		end
		if isPlayerMuted(source) then
			return
		end
		if anonimo ~= true then
			return outputChatBox ( "#800000• SRP • Chat desativado.", source, 255, 255, 255, true )
		end
		if getElementData ( source, "TempoPreso" ) and getElementData ( source, "TempoPreso" ) > 0 then
			return outputChatBox ( "#800000• SRP • Estás preso, portanto não poderás utilizar o chat.", source, 255, 255, 255, true )
		end

		local MessagemANS = table.concat ( { ... }, " " );
		local MessagemANS2 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
		local MessagemANS3 = string.gsub(MessagemANS2, "#%x%x%x%x%x%x", "")
		local MessagemANS4 = string.gsub(MessagemANS3, "#%x%x%x%x%x%x", "")
		local MessagemANS5 = string.gsub(MessagemANS4, "#%x%x%x%x%x%x", "")
		local MessagemANS6 = string.gsub(MessagemANS5, "#%x%x%x%x%x%x", "")
		local MessagemANS7 = string.gsub(MessagemANS6, "#%x%x%x%x%x%x", "")
		local MessagemANS8 = string.gsub(MessagemANS7, "#%x%x%x%x%x%x", "")
		local MessagemANS9 = string.gsub(MessagemANS8, "#%x%x%x%x%x%x", "")
		local MessagemANS10 = string.gsub(MessagemANS9, "#%x%x%x%x%x%x", "")
		local MessagemANS11 = string.gsub(MessagemANS10, "#%x%x%x%x%x%x", "")
		local MessagemANS12 = string.gsub(MessagemANS11, "#%x%x%x%x%x%x", "")
		local MessagemANS13 = string.gsub(MessagemANS12, "#%x%x%x%x%x%x", "")
		local MessagemANS14 = string.gsub(MessagemANS13, "#%x%x%x%x%x%x", "")
		local MessagemANS15 = string.gsub(MessagemANS14, "#%x%x%x%x%x%x", "")
		local staff = ""
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) then
			if getElementData( source, "ModoStaff" ) == true then
				staff = " [STAFF]"
			else
				staff = " [ROLEPLAY]"
			end
			log(getPlayerName(source) .. "["..getElementData( source, "ID" ).."] " .. staff .. " digitou no chat Anônimo -> " .. MessagemANS15)
		end
		logComum(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Anônimo -> " .. MessagemANS15)
		for _, player in ipairs ( getElementsByType ( "player" ) ) do
			if not isGuestAccount(getPlayerAccount(player)) then 
				if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "Staff" ) ) and getElementData(player, "ModoStaff") then
					outputChatBox ( "• #3a3a3a@Anónimo #ffffff["..getPlayerName(source).." #ffffff(ID: " .. (getElementData( source, "ID" ) or "N/A") .. ")] #3a3a3a- " ..MessagemANS15, player, 255, 255, 255, true )
				else
					outputChatBox ( "• #3a3a3a@Anónimo - " ..MessagemANS15, player, 255, 255, 255, true )
				end
			end
		end
	end
end
addCommandHandler ( "Anónimo", mensagemAnonimo )

function tagPascoa(thePlayer)
	if not isGuestAccount(getPlayerAccount(thePlayer)) then
		if getElementData(thePlayer, "CoelhoTag") then
			setElementData(thePlayer, "CoelhoTag", false)
			outputChatBox("#828282» A TAG #6eeeff[@Coelho] #828282foi desativada, que triste.", thePlayer, 255, 255, 255, true)
		else
			setElementData(thePlayer, "CoelhoTag", true)
			outputChatBox("#828282» A TAG #6eeeff[@Coelho] #828282foi ativada, começa a saltar.", thePlayer, 255, 255, 255, true)
		end
	end
end
addCommandHandler("pascoa", tagPascoa, false, false)


function mensagemForaRP ( source, cmd, ... )
	if getElementData(source, "Inconsciente") and getElementData(source, "Inconsciente") ==  true then return outputChatBox("#800000• SRP • Não podes comunicar inconsciente.", source, 255, 255, 255, true) end
	local contaJogador = getPlayerAccount(source)
	if not isGuestAccount(contaJogador) then
		if chatTime[source] and chatTime[source] + 3000 > getTickCount() then
			return outputChatBox("#800000• SRP • Espera mais um pouco para mandar outra mensagem.", source, 255, 255, 255, true)
		else
			chatTime[source] = getTickCount()
		end
		if isPlayerMuted(source) then
			return
		end
		if foraDeRP ~= true then
			return outputChatBox ( "#800000• SRP • Chat desativado.", source, 255, 255, 255, true )
		end
		if getElementData ( source, "TempoPreso" ) and getElementData ( source, "TempoPreso" ) > 0 then
			return outputChatBox ( "#800000• SRP • Estás preso, portanto não poderás utilizar o chat.", source, 255, 255, 255, true )
		end

		local MessagemANS = table.concat ( { ... }, " " );
		local MessagemANS2 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
		local MessagemANS3 = string.gsub(MessagemANS2, "#%x%x%x%x%x%x", "")
		local MessagemANS4 = string.gsub(MessagemANS3, "#%x%x%x%x%x%x", "")
		local MessagemANS5 = string.gsub(MessagemANS4, "#%x%x%x%x%x%x", "")
		local MessagemANS6 = string.gsub(MessagemANS5, "#%x%x%x%x%x%x", "")
		local MessagemANS7 = string.gsub(MessagemANS6, "#%x%x%x%x%x%x", "")
		local MessagemANS8 = string.gsub(MessagemANS7, "#%x%x%x%x%x%x", "")
		local MessagemANS9 = string.gsub(MessagemANS8, "#%x%x%x%x%x%x", "")
		local MessagemANS10 = string.gsub(MessagemANS9, "#%x%x%x%x%x%x", "")
		local MessagemANS11 = string.gsub(MessagemANS10, "#%x%x%x%x%x%x", "")
		local MessagemANS12 = string.gsub(MessagemANS11, "#%x%x%x%x%x%x", "")
		local MessagemANS13 = string.gsub(MessagemANS12, "#%x%x%x%x%x%x", "")
		local MessagemANS14 = string.gsub(MessagemANS13, "#%x%x%x%x%x%x", "")
		local MessagemANS15 = string.gsub(MessagemANS14, "#%x%x%x%x%x%x", "")
		local ID = getElementData ( source, "ID" ) or "N/A"
		if getElementData(source, "fakeID") then
			ID = getElementData(source, "fakeID")
		end
		local staff = ""
		local tag = ""
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Jornalista" ) ) then
			tag = tag .. "#7a12e0「 Jornalista 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Streamer" ) ) then
			tag = tag .. "#4eeebe「 Streamer 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Diretor" ) ) then
			tag = tag .. "#4aa3ff「 Direção 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "SubDiretor" ) ) then
			tag = tag .. "#0ff0e9「 Sub Direção 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "HeadAdmin" ) ) then
			tag = tag .. "#d808d0「 Head Admin 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Administrador" ) ) then
			tag = tag .. "#ec0f0f「 Administração 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "HeadMod" ) ) then
			tag = tag .. "#15df24「 Head Mod 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Moderador" ) ) then
			tag = tag .. "#04751e「 Moderação 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Helper" ) ) then
			tag = tag .. "#72f793「 Helper 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "StaffEmTeste" ) ) then
			tag = tag .. "#359c88「 Staff Trial 」#ffffff "
		end
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) then
			if getElementData( source, "ModoStaff" ) == true then
				staff = " [STAFF]"
			else
				staff = " [ROLEPLAY]"
			end
			log(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Fora de Roleplay -> " .. MessagemANS15)
		end
		logComum(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Fora de Roleplay -> " .. MessagemANS15)
		for _, player in ipairs ( getElementsByType ( "player" ) ) do
			if not isGuestAccount(getPlayerAccount(player)) then 
				if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) and getElementData( source, "ModoStaff" ) == true then
					outputChatBox("#ffffff• #288ff8[Fora de Roleplay] #ffffff• #ff0000[STAFF] #ffffff" .. tag .. " ".. getPlayerName(source) .. " #ffffff["..ID.."] #288ff8» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
				else
					if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Omega" ) ) then
						outputChatBox("#ffffff• #288ff8[Fora de Roleplay] #ffffff• #ff9100「 Omega 」 #ffffff" .. tag .. getPlayerName(source) .. " #ffffff["..ID.."] #288ff8» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
					elseif isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Sigma" ) ) then
						outputChatBox("#ffffff• #288ff8[Fora de Roleplay] #ffffff• #abffae「 Sigma 」 #ffffff" .. tag .. getPlayerName(source) .. " #ffffff["..ID.."] #288ff8» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
					elseif isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Epsylon" ) ) then
						outputChatBox("#ffffff• #288ff8[Fora de Roleplay] #ffffff• #abfeff「 Epsylon 」 #ffffff" .. tag .. getPlayerName(source) .. " #ffffff["..ID.."] #288ff8» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
					elseif isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Alpha" ) ) then
						outputChatBox("#ffffff• #288ff8[Fora de Roleplay] #ffffff• #ff9999「 Alpha 」 #ffffff" .. tag .. getPlayerName(source) .. " #ffffff["..ID.."] #288ff8» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
					else
						outputChatBox("#ffffff• #288ff8[Fora de Roleplay] #ffffff• " .. tag .. getPlayerName(source) .. " #ffffff["..ID.."] #288ff8» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
					end
				end
			end
		end
	end
end
addCommandHandler ( "ForaRP", mensagemForaRP )

function mensagemTwitter ( source, cmd, ... )
	if getElementData(source, "Inconsciente") and getElementData(source, "Inconsciente") ==  true then return outputChatBox("#800000• SRP • Não podes comunicar inconsciente.", source, 255, 255, 255, true) end
	local contaJogador = getPlayerAccount(source)
	if not isGuestAccount(contaJogador) then
		if chatTime[source] and chatTime[source] + 3000 > getTickCount() then
			return outputChatBox("#800000• SRP • Espera mais um pouco para mandar outra mensagem.", source, 255, 255, 255, true)
		else
			chatTime[source] = getTickCount()
		end
		if isPlayerMuted(source) then
			return
		end
		if foraDeRP ~= true then
			return outputChatBox ( "#800000• SRP • Chat desativado.", source, 255, 255, 255, true )
		end
		if getElementData ( source, "TempoPreso" ) and getElementData ( source, "TempoPreso" ) > 0 then
			return outputChatBox ( "#800000• SRP • Estás preso, portanto não poderás utilizar o chat.", source, 255, 255, 255, true )
		end

		local MessagemANS = table.concat ( { ... }, " " );
		local MessagemANS2 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
		local MessagemANS3 = string.gsub(MessagemANS2, "#%x%x%x%x%x%x", "")
		local MessagemANS4 = string.gsub(MessagemANS3, "#%x%x%x%x%x%x", "")
		local MessagemANS5 = string.gsub(MessagemANS4, "#%x%x%x%x%x%x", "")
		local MessagemANS6 = string.gsub(MessagemANS5, "#%x%x%x%x%x%x", "")
		local MessagemANS7 = string.gsub(MessagemANS6, "#%x%x%x%x%x%x", "")
		local MessagemANS8 = string.gsub(MessagemANS7, "#%x%x%x%x%x%x", "")
		local MessagemANS9 = string.gsub(MessagemANS8, "#%x%x%x%x%x%x", "")
		local MessagemANS10 = string.gsub(MessagemANS9, "#%x%x%x%x%x%x", "")
		local MessagemANS11 = string.gsub(MessagemANS10, "#%x%x%x%x%x%x", "")
		local MessagemANS12 = string.gsub(MessagemANS11, "#%x%x%x%x%x%x", "")
		local MessagemANS13 = string.gsub(MessagemANS12, "#%x%x%x%x%x%x", "")
		local MessagemANS14 = string.gsub(MessagemANS13, "#%x%x%x%x%x%x", "")
		local MessagemANS15 = string.gsub(MessagemANS14, "#%x%x%x%x%x%x", "")
		local ID = getElementData ( source, "ID" ) or "N/A"
		if getElementData(source, "fakeID") then
			ID = getElementData(source, "fakeID")
		end
		local staff = ""
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) then
			if getElementData( source, "ModoStaff" ) == true then
				staff = " [STAFF]"
			else
				staff = " [ROLEPLAY]"
			end
			log(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Twitter -> " .. MessagemANS15)
		end
		logComum(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Twitter -> " .. MessagemANS15)
		for _, player in ipairs ( getElementsByType ( "player" ) ) do
			if not isGuestAccount(getPlayerAccount(player)) then 
				outputChatBox("#ffffff• #00dbff[Twitter] #ffffff• " .. getPlayerName(source) .. " #ffffff["..ID.."] #00dbff» #ffffff"..MessagemANS15, player, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler ( "Twitter", mensagemTwitter )

function mensagemCopom ( source, cmd, ... )
	if getElementData(source, "Inconsciente") and getElementData(source, "Inconsciente") ==  true then return outputChatBox("#800000• SRP • Não podes comunicar inconsciente.", source, 255, 255, 255, true) end
	local contaJogador = getPlayerAccount(source)
	if not isGuestAccount(contaJogador) then
		if chatTime[source] and chatTime[source] + 3000 > getTickCount() then
			return outputChatBox("#800000• SRP • Espera mais um pouco para mandar outra mensagem.", source, 255, 255, 255, true)
		else
			chatTime[source] = getTickCount()
		end
		if isPlayerMuted(source) then
			return
		end
		if foraDeRP ~= true then
			return outputChatBox ( "#800000• SRP • Chat desativado.", source, 255, 255, 255, true )
		end
		if getElementData ( source, "TempoPreso" ) and getElementData ( source, "TempoPreso" ) > 0 then
			return outputChatBox ( "#800000• SRP • Estás preso, portanto não poderás utilizar o chat.", source, 255, 255, 255, true )
		end

		local MessagemANS = table.concat ( { ... }, " " );
		local MessagemANS2 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
		local MessagemANS3 = string.gsub(MessagemANS2, "#%x%x%x%x%x%x", "")
		local MessagemANS4 = string.gsub(MessagemANS3, "#%x%x%x%x%x%x", "")
		local MessagemANS5 = string.gsub(MessagemANS4, "#%x%x%x%x%x%x", "")
		local MessagemANS6 = string.gsub(MessagemANS5, "#%x%x%x%x%x%x", "")
		local MessagemANS7 = string.gsub(MessagemANS6, "#%x%x%x%x%x%x", "")
		local MessagemANS8 = string.gsub(MessagemANS7, "#%x%x%x%x%x%x", "")
		local MessagemANS9 = string.gsub(MessagemANS8, "#%x%x%x%x%x%x", "")
		local MessagemANS10 = string.gsub(MessagemANS9, "#%x%x%x%x%x%x", "")
		local MessagemANS11 = string.gsub(MessagemANS10, "#%x%x%x%x%x%x", "")
		local MessagemANS12 = string.gsub(MessagemANS11, "#%x%x%x%x%x%x", "")
		local MessagemANS13 = string.gsub(MessagemANS12, "#%x%x%x%x%x%x", "")
		local MessagemANS14 = string.gsub(MessagemANS13, "#%x%x%x%x%x%x", "")
		local MessagemANS15 = string.gsub(MessagemANS14, "#%x%x%x%x%x%x", "")
		local ID = getElementData ( source, "ID" ) or "N/A"
		if getElementData(source, "fakeID") then
			ID = getElementData(source, "fakeID")
		end
		local staff = ""
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) then
			if getElementData( source, "ModoStaff" ) == true then
				staff = " [STAFF]"
			else
				staff = " [ROLEPLAY]"
			end
			log(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Copom -> " .. MessagemANS15)
		end
		logComum(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Copom -> " .. MessagemANS15)
		for _, player in ipairs ( getElementsByType ( "player" ) ) do
			if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "PSP" ) ) or isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "Exercito" ) ) or isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "GNR" ) ) then
				outputChatBox("#ffffff• #ff0000[COPOM] #ffffff• " .. getPlayerName(source) .. " #ffffff["..ID.."] #ff0000» #fe7c49"..MessagemANS15, player, 255, 255, 255, true)
			end
		end
		triggerClientEvent("onChatIncome", source, "** Copom ** " .. MessagemANS15, 0)
	end
end
addCommandHandler ( "Copom", mensagemCopom )

function mensagemStaff ( source, cmd, ... )
	local contaJogador = getPlayerAccount(source)
	if not isGuestAccount(contaJogador) and isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Staff")) then
		if chatTime[source] and chatTime[source] + 3000 > getTickCount() then
			return outputChatBox("#800000• SRP • Espera mais um pouco para mandar outra mensagem.", source, 255, 255, 255, true)
		else
			chatTime[source] = getTickCount()
		end
		if isPlayerMuted(source) then
			return
		end

		local MessagemANS = table.concat ( { ... }, " " );
		local MessagemANS2 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
		local MessagemANS3 = string.gsub(MessagemANS2, "#%x%x%x%x%x%x", "")
		local MessagemANS4 = string.gsub(MessagemANS3, "#%x%x%x%x%x%x", "")
		local MessagemANS5 = string.gsub(MessagemANS4, "#%x%x%x%x%x%x", "")
		local MessagemANS6 = string.gsub(MessagemANS5, "#%x%x%x%x%x%x", "")
		local MessagemANS7 = string.gsub(MessagemANS6, "#%x%x%x%x%x%x", "")
		local MessagemANS8 = string.gsub(MessagemANS7, "#%x%x%x%x%x%x", "")
		local MessagemANS9 = string.gsub(MessagemANS8, "#%x%x%x%x%x%x", "")
		local MessagemANS10 = string.gsub(MessagemANS9, "#%x%x%x%x%x%x", "")
		local MessagemANS11 = string.gsub(MessagemANS10, "#%x%x%x%x%x%x", "")
		local MessagemANS12 = string.gsub(MessagemANS11, "#%x%x%x%x%x%x", "")
		local MessagemANS13 = string.gsub(MessagemANS12, "#%x%x%x%x%x%x", "")
		local MessagemANS14 = string.gsub(MessagemANS13, "#%x%x%x%x%x%x", "")
		local MessagemANS15 = string.gsub(MessagemANS14, "#%x%x%x%x%x%x", "")
		local ID = getElementData ( source, "ID" ) or "N/A"
		if getElementData(source, "fakeID") then
			ID = "Fake ID: " .. getElementData(source, "fakeID") .. " (" .. getElementData ( source, "ID" )  .. ")"
		end
		local staff = ""
		if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) then
			if getElementData( source, "ModoStaff" ) == true then
				staff = " [STAFF]"
			else
				staff = " [ROLEPLAY]"
			end
			log(getPlayerName(source) .. "["..ID.."]" .. staff .. " digitou no chat Staff -> " .. MessagemANS15)
		end
		for _, player in ipairs ( getElementsByType ( "player" ) ) do
			if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "Staff" ) ) then
				outputChatBox("#ffffff• #ff0000[ » STAFF SRP « ] #ffffff• " .. getPlayerName(source) .. " #ffffff["..ID.."] #ff0000» #fe7c49"..MessagemANS15, player, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler ( "sc", mensagemStaff )

addEventHandler ( "onPlayerQuit", getRootElement ( ),  
	function ( ) 
		if chatTime[source] then
			chatTime[source] = nil
		end
	end
)

addEventHandler ( "onPlayerLogin", getRootElement ( ),  
	function ( ) 
	    bindKey ( source, "i", "down", "chatbox", "Anónimo" )
	    bindKey ( source, "u", "down", "chatbox", "ForaRP" )
	    bindKey ( source, "y", "down", "chatbox", "Twitter" )
	    if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "PSP" ) ) or isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Exercito" ) ) or isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "GNR" ) ) then
	    	bindKey ( source, "o", "down", "chatbox", "Copom" )
	    end
	    setElementData( source, "ModoStaff", false )
	end
)

addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource ( ) ),
	function ( ) 
	    for index, player in pairs ( getElementsByType ( "player" ) ) do 
			local contaJogador = getPlayerAccount(player)
			if not isGuestAccount(contaJogador) then
				bindKey ( player, "i", "down", "chatbox", "Anónimo" )
				bindKey ( player, "u", "down", "chatbox", "ForaRP" )
				bindKey ( player, "y", "down", "chatbox", "Twitter" )
				if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "PSP" ) ) or isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "Exercito" ) ) or isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( player ) ), aclGetGroup( "GNR" ) ) then
			    	bindKey ( player, "o", "down", "chatbox", "Copom" )
			    end
				setElementData( player, "ModoStaff", false )
			end
		end
	end
)

DistanciaDoChatLocal = 30

addEventHandler("onPlayerChat", root, function(tresc, msgtype)
	cancelEvent ( )
    if msgtype == 0 then
		if getElementData(source, "Inconsciente") and getElementData(source, "Inconsciente") ==  true then return outputChatBox("#800000• SRP • Não podes comunicar inconsciente.", source, 255, 255, 255, true) end
		local contaJogador = getPlayerAccount(source)
		if not isGuestAccount(contaJogador) then
			if chatTime[source] and chatTime[source] + 3000 > getTickCount() then
				return outputChatBox("#800000• SRP • Espera mais um pouco para mandar outra mensagem.", source, 255, 255, 255, true)
			else
				chatTime[source] = getTickCount()
			end
			if isPlayerMuted(source) then
				return
			end
			local x,y,z = getElementPosition(source)
			local ID = getElementData ( source, "ID" ) or "N/A"
			if getElementData(source, "fakeID") then
				ID = getElementData(source, "fakeID")
			end
			local staff = ""
			if isObjectInACLGroup( "user." .. getAccountName( getPlayerAccount( source ) ), aclGetGroup( "Staff" ) ) then
				if getElementData( source, "ModoStaff" ) == true then
					staff = " [STAFF]"
				else
					staff = " [ROLEPLAY]"
				end
				log(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Local -> " .. tresc)
			end
			logComum(getPlayerName(source) .. "["..getElementData( source, "ID" ).."]" .. staff .. " digitou no chat Local -> " .. tresc)
			for key, gracze in ipairs(getElementsByType("player")) do
				if not isGuestAccount(getPlayerAccount(gracze)) then 
					local x2,y2,z2 = getElementPosition(gracze)
					if getDistanceBetweenPoints3D ( x, y, z, x2, y2, z2 ) < DistanciaDoChatLocal then
						local int = getElementInterior   ( source )
						local dim = getElementDimension  ( source )
						local int2 = getElementInterior  ( gracze )
						local dim2 = getElementDimension ( gracze )
						if int == int2 and dim == dim2 then
							conta = getAccountName ( getPlayerAccount ( source ) )
							
							if isObjectInACLGroup ("user."..conta, aclGetGroup ( "Staff" ) ) and getElementData( source, "ModoStaff" ) == true then
								outputChatBox("#ffffff• #FFEE00[Chat Local] #ffffff• #ff0000[STAFF] #ffffff" .. getPlayerName(source) .. " #ffffff["..ID.."] #FFEE00» #ffffff"..tresc, gracze, 255, 255, 255, true)
							elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "Everyone" ) ) then
								outputChatBox("#ffffff• #FFEE00[Chat Local] #ffffff• " .. getPlayerName(source) .. " #ffffff["..ID.."] #FFEE00» #ffffff"..tresc, gracze, 255, 255, 255, true)
							end
						end
					end
				end
			end
			triggerClientEvent("onChatIncome", source, tresc, 0)
		end
	end
end)

addCommandHandler( "modostaff", function ( player )
	if isObjectInACLGroup ("user."..getAccountName( getPlayerAccount( player ) ), aclGetGroup ( "Staff" ) ) then
		ID = getElementData ( player, "ID" ) or "N/A"
		if getElementData( player, "ModoStaff" ) == true then
			setElementData( player, "ModoStaff", false )
			for k,v in pairs(getElementsByType("player")) do
				if not isGuestAccount(getPlayerAccount(v)) then
					if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(v)), aclGetGroup("Staff")) then
						outputChatBox( "#ff0000[STAFF] #ffffff" .. getPlayerName(player) .. " #ffffff["..ID.."] #fe7c49agora está em modo Roleplay.", v, 255, 255, 255, true )
					end
 				end
			end
			log(getPlayerName(player) .. "["..ID.."] entrou em modo Roleplay.")
			outputChatBox( "#ff0000[STAFF] #ffffffAgora podes usar #ff0000/fakeid [ID] #ffffffpara fazeres o teu Roleplay sem seres taxado de Staff.", player, 255, 255, 255, true )
		else
			setElementData( player, "ModoStaff", true )
			for k,v in pairs(getElementsByType("player")) do
				if not isGuestAccount(getPlayerAccount(v)) then
					if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(v)), aclGetGroup("Staff")) then
						outputChatBox( "#ff0000[STAFF] #ffffff" .. getPlayerName(player) .. " #ffffff["..ID.."] #fe7c49agora está em modo Staff.", v, 255, 255, 255, true )
					end
 				end
			end
			log(getPlayerName(player) .. "["..ID.."] entrou em modo Staff.")
			if getElementData(thePlayer, "fakeID") then
				removeElementData(thePlayer, "fakeID")
			end
		end
	end
end )