local database = dbConnect("sqlite", ":sucessoVIP/database.db")
dbExec(database, "CREATE TABLE IF NOT EXISTS vips (accountId, accountName, vipType, expires)")
dbExec(database, "CREATE TABLE IF NOT EXISTS keys (key, vipType, days, generatedBy)")
local prefix = "#f5da42[ » Sucesso Roleplay VIPs « ] #ffffff"

function isVIP(accountId, vipType)
	local data = dbPoll(dbQuery(database, "SELECT * FROM vips WHERE accountId = ? AND vipType = ?", tonumber(accountId), vipType), -1)
	if data then
		for _, row in ipairs ( data ) do
			return true
		end
	end
	return false
end

function existsKey(key)
	local data = dbPoll(dbQuery(database, "SELECT * FROM keys WHERE key = ?", key), -1)
	if data then
		for _, row in ipairs ( data ) do
			return true
		end
	end
	return false
end

function getVIPInfos(accountId, vipType)
	local data = dbPoll(dbQuery(database, "SELECT * FROM vips WHERE accountId = ? AND vipType = ?", tonumber(accountId), vipType), -1)
	if data then
		return data
	else
		return false
	end
end

function getKeyInfos(key)
	local data = dbPoll(dbQuery(database, "SELECT * FROM keys WHERE key = ?", key), -1)
	if data then
		return data
	else
		return false
	end
end

local validTypes = {
	"Alpha", "Sigma", "Epsylon", "Omega",
}

local money = {
	["Alpha"] = 400000,
	["Sigma"] = 600000,
	["Epsylon"] = 800000,
	["Omega"] = 1000000,
}

local charset = {}

for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end

function string.random(length)
	math.randomseed(os.time())

	if length > 0 then
		return string.random(length - 1) .. charset[math.random(1, #charset)]
  	else
    	return ""
  	end
end

function activateVIP(thePlayer, commandName, key)
	if key then
		if existsKey(key) then
			local keyInfo = getKeyInfos(key)
			local vipType = keyInfo[1]["vipType"]
			local days = keyInfo[1]["days"]
			local expires = os.time()
			dbExec(database, "DELETE FROM keys WHERE key = ?", key)
			outputChatBox(prefix .. "VIP " .. vipType .. " ativado com sucesso.", thePlayer, 255, 255, 255, true)
			local moneyAchieved = money[vipType]
			if tonumber(days) > 0 then
				if isVIP(getAccountID(getPlayerAccount(thePlayer)), vipType) then
					local vipInfo = getVIPInfos(getAccountID(getPlayerAccount(thePlayer)), vipType)
					if not vipInfo[1]["expires"] == "Permanente" then
						expires = tonumber(vipInfo[1]["expires"]) + (tonumber(days) * 24 * 60 * 60)
						dbExec(database, "UPDATE vips SET expires = ? WHERE accountId = ? AND vipType = ?", expires, getAccountID(getPlayerAccount(thePlayer)), vipType)
						outputChatBox(prefix .. "O teu VIP expira dia: " .. os.date("%c", expires), thePlayer, 255, 255, 255, true)
					end
				else
					expires = expires + (tonumber(days) * 24 * 60 * 60)
					dbExec(database, "INSERT INTO vips (accountId, accountName, vipType, expires) VALUES (?, ?, ?, ?)", getAccountID(getPlayerAccount(thePlayer)), getAccountName(getPlayerAccount(thePlayer)), vipType, expires)
					outputChatBox(prefix .. "O teu VIP expira dia: " .. os.date("%c", expires), thePlayer, 255, 255, 255, true)
					aclGroupAddObject(aclGetGroup(vipType), "user." .. getAccountName(getPlayerAccount(thePlayer)))
				end
			else
				moneyAchieved = moneyAchieved * 3
				if isVIP(getAccountID(getPlayerAccount(thePlayer)), vipType) then
					expires = "Permanente"
					dbExec(database, "UPDATE vips SET expires = ? WHERE accountId = ? AND vipType = ?", expires, getAccountID(getPlayerAccount(thePlayer)), vipType)
					if expires ~= "Permanente" then
						outputChatBox(prefix .. "O teu VIP é permanente.", thePlayer, 255, 255, 255, true)
					end
				else
					expires = "Permanente"
					dbExec(database, "INSERT INTO vips (accountId, accountName, vipType, expires) VALUES (?, ?, ?, ?)", getAccountID(getPlayerAccount(thePlayer)), getAccountName(getPlayerAccount(thePlayer)), vipType, expires)
					outputChatBox(prefix .. "O teu VIP é permanente.", thePlayer, 255, 255, 255, true)
					aclGroupAddObject(aclGetGroup(vipType), "user." .. getAccountName(getPlayerAccount(thePlayer)))
				end
			end
			--moneyAchieved = moneyAchieved * 3
			local resultado = "permanente"
			if tonumber(days) ~= 0 then
				resultado = "de " .. days .. " dias"
			end
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
			outputChatBox(" #ff0000» " .. getPlayerName(thePlayer) .. "#ff0000 ativou um VIP " .. vipType .. " " .. resultado.. " e recebeu " .. moneyAchieved .. " €!", thePlayer, 255, 255, 255, true)
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
			setPlayerMoney(thePlayer, getPlayerMoney(thePlayer) + moneyAchieved)
			outputChatBox(prefix .. "Recebeste: " .. moneyAchieved .. " € de premiação.", thePlayer, 255, 255, 255, true)
			--outputChatBox(prefix .. "CÓDIGO DA PROMOÇÃO PÁSCOA: " .. math.floor(math.random() * 100) .. " (tira print deste código e abre ticket para receberes a tua premiação!)", thePlayer, 255, 255, 255, true)
			for k,v in pairs(getElementsByType("player")) do
				triggerClientEvent(v, "activateVIP", v, getPlayerName(thePlayer), vipType, days, moneyAchieved)
			end
		else
			outputChatBox(prefix .. "Não foi encontrada nenhuma key VIP.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox(prefix .. "Use: /ativarkey [key]", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("ativarkey", activateVIP)

function setVIP(thePlayer, commandName, id, vipType, days)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
		if id and vipType and days then
			local expires = os.time()
			if tonumber(days) == 0 then
				if isVIP(id, vipType) then
					expires = "Permanente"
					dbExec(database, "UPDATE vips SET expires = ? WHERE accountId = ? AND vipType = ?", expires, tonumber(id), vipType)
					aclGroupAddObject(aclGetGroup(vipType), "user." .. getAccountName(getAccountByID(tonumber(id))))
				else
					expires = "Permanente"
					dbExec(database, "INSERT INTO vips (accountId, accountName, vipType, expires) VALUES (?, ?, ?, ?)", tonumber(id), getAccountName(getAccountByID(tonumber(id))), vipType, expires)
					aclGroupAddObject(aclGetGroup(vipType), "user." .. getAccountName(getAccountByID(tonumber(id))))
				end
				outputChatBox(prefix .. "O ID " .. id .. " recebeu o VIP " .. vipType .. " permanente.", thePlayer, 255, 255, 255, true)
			else
				if isVIP(id, vipType) then
					local vipInfo = getVIPInfos(id, vipType)
					expires = vipInfo[1]["expires"] + (days * 24 * 60 * 60)
					dbExec(database, "UPDATE vips SET expires = ? WHERE accountId = ? AND vipType = ?", expires, tonumber(id), vipType)
					aclGroupAddObject(aclGetGroup(vipType), "user." .. getAccountName(getAccountByID(tonumber(id))))
				else
					expires = expires + (days * 24 * 60 * 60)
					dbExec(database, "INSERT INTO vips (accountId, accountName, vipType, expires) VALUES (?, ?, ?, ?)", tonumber(id), getAccountName(getAccountByID(tonumber(id))), vipType, expires)
					aclGroupAddObject(aclGetGroup(vipType), "user." .. getAccountName(getAccountByID(tonumber(id))))
				end
				outputChatBox(prefix .. "O ID " .. id .. " recebeu " .. days .. " dias de VIP " .. vipType .. ".", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox(prefix .. "Use: /setarvip [id] [tipo] [dias]", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox(prefix .. "Não estás autorizado a fazer isso.", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("setarvip", setVIP)

function removeVip(thePlayer, commandName, playerId, vipType)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
		if tonumber(playerId) and vipType then
			playerId = tonumber(playerId)
			for k,v in pairs(validTypes) do
				if vipType == v then
					if isVIP(playerId, vipType) then
						dbExec(database, "DELETE FROM vips WHERE accountId = ? AND vipType = ?", playerId, vipType)
						outputChatBox(prefix .. "VIP do ID " .. playerId .. " (" .. vipType .. ") removido.", thePlayer, 255, 255, 255, true)
						aclGroupRemoveObject(aclGetGroup(v), "user." .. getAccountName(getAccountByID(playerId)))
					else
						outputChatBox(prefix .. "Este jogador(a) não possui esse VIP.", thePlayer, 255, 255, 255, true)
					end
				end
			end
		else
			outputChatBox(prefix .. "Use: /removervip [ID] [tipo]", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox(prefix .. "Não estás autorizado a fazer isso.", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("removervip", removeVip)

function tempoVIP(thePlayer, commandName)
	for k,z in pairs(validTypes) do
		if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup(z)) then
			if isVIP(tonumber(getElementData(thePlayer, "ID")), z) then
				local vipInfos = getVIPInfos(tonumber(getElementData(thePlayer, "ID")), z)
				local expires = vipInfos[1]["expires"]
				if expires == "Permanente" then
					outputChatBox(prefix .. "O teu VIP " .. z .. " é permanente.", thePlayer, 255, 255, 255, true)
				else
					outputChatBox(prefix .. "O teu VIP " .. z .. " expira dia: " .. os.date("%c", expires), thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox(prefix .. "O teu VIP não está cadastrado.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("tempovip", tempoVIP)

function checkExpired()
	for i=1,100 do outputChatBox(" ", source) end
	outputChatBox("#ff0000SUCESSO ROLEPLAY #ffffff| Bem-vindo(a) ao servidor.", source, 255, 255, 255, true)
	outputChatBox(" ", source, 255, 255, 255, true)
	outputChatBox("  #ff0000» #ffffffLê as #ff0000regras #ffffffpara evitares seres punido #ff0000(Clica no F9).", source, 255, 255, 255, true)
	outputChatBox("  #ff0000» #ffffffEntra no nosso #ff0000Discord#ffffff: #ff0000discord.gg/sucessorp", source, 255, 255, 255, true)
	outputChatBox(" ", source, 255, 255, 255, true)
	for k,v in pairs(validTypes) do
		if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
			if isVIP(getAccountID(getPlayerAccount(source)), v) then
				local vipInfos = getVIPInfos(getAccountID(getPlayerAccount(source)), v)
				local expires = vipInfos[1]["expires"]
				if expires ~= "Permanente" and tonumber(expires) < os.time() then
					dbExec(database, "DELETE FROM vips WHERE accountId = ? AND vipType = ?", getAccountID(getPlayerAccount(source)), v)
					outputChatBox(prefix .. "O teu VIP " .. v .. " expirou.", source, 255, 255, 255, true)
					aclGroupRemoveObject(aclGetGroup(v), "user." .. getAccountName(getPlayerAccount(source)))
				else
					if expires == "Permanente" then
						outputChatBox(prefix .. "O teu VIP é permanente.", source, 255, 255, 255, true)
					else
						outputChatBox(prefix .. "O teu VIP expira dia: " .. os.date("%c", expires), source, 255, 255, 255, true)
					end
				end
			end
		end
	end
end
addEventHandler("onPlayerLogin", root, checkExpired)

function generateKey(thePlayer, commandName, type, days)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
		if type and days then
			for k,v in pairs(validTypes) do
				if v == type then
					local generatedKey = string.random(7)
					dbExec(database, "INSERT INTO keys (key, vipType, days, generatedBy) VALUES (?, ?, ?, ?)", generatedKey, type, days, getAccountName(getPlayerAccount(thePlayer)))
					outputChatBox(prefix .. "Key gerada: " .. generatedKey, thePlayer, 255, 255, 255, true)
				end
			end
		else
			outputChatBox(prefix .. "Use: /gerarkey [tipo] [dias]", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox(prefix .. "Não estás autorizado a fazer isso.", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("gerarkey", generateKey)