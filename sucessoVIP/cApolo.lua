local screenW, screenH = guiGetScreenSize()
local font = dxCreateFont("fonts/Themify.ttf")

local rendering = false
local playerName = nil
local vipType = nil
local days = nil
local moneyAchieved = nil
local alpha = 0
local fadeInTimer = nil
local fadeOutTimer = nil

function trigger(_playerName, _vipType, _days, _moneyAchieved)
    playerName = _playerName
    vipType = _vipType
    days = tonumber(_days)
    moneyAchieved = _moneyAchieved
    rendering = true
    local fadeInTimer = setTimer(function()
        if alpha == 120 then
            setTimer(function()
                local fadeOutTimer = setTimer(function()
                    if alpha == 0 then
                        rendering = false
                        playerName = nil
                        vipType = nil
                        days = nil
                        moneyAchieved = nil
                        alpha = 0
                        fadeInTimer = nil
                        fadeOutTimer = nil
                    else
                        alpha = alpha - 5
                    end
                end, 50, 24)
            end, 15000, 1)
        else
            alpha = alpha + 5
        end
    end, 25, 120)
    local randomNumber = math.random ( 1, 3 )
	if randomNumber == 1 then
	    playSound ( "music/desconfinamento.mp3" )
	elseif randomNumber == 2 then
	    playSound ( "music/bandidos.mp3" )
	elseif randomNumber == 3 then
	    playSound ( "music/vento.mp3" )
	end
end

addEvent("activateVIP", true)
addEventHandler("activateVIP", root, trigger)

addEventHandler("onClientRender", root,
    function()
        if rendering then
            dxDrawLine((screenW * 0.3250) - 1, (screenH * 0.2956) - 1, (screenW * 0.3250) - 1, screenH * 0.3822, tocolor(0, 0, 0, alpha), 1, false)
            dxDrawLine(screenW * 0.6844, (screenH * 0.2956) - 1, (screenW * 0.3250) - 1, (screenH * 0.2956) - 1, tocolor(0, 0, 0, alpha), 1, false)
            dxDrawLine((screenW * 0.3250) - 1, screenH * 0.3822, screenW * 0.6844, screenH * 0.3822, tocolor(0, 0, 0, alpha), 1, false)
            dxDrawLine(screenW * 0.6844, screenH * 0.3822, screenW * 0.6844, (screenH * 0.2956) - 1, tocolor(0, 0, 0, alpha), 1, false)
            dxDrawRectangle(screenW * 0.3250, screenH * 0.2956, screenW * 0.3594, screenH * 0.0867, tocolor(0, 0, 0, alpha), false)
            if days == 0 then
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " permanente!", (screenW * 0.3294) - 1, (screenH * 0.3022) - 1, (screenW * 0.6781) - 1, (screenH * 0.3267) - 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " permanente!", (screenW * 0.3294) + 1, (screenH * 0.3022) - 1, (screenW * 0.6781) + 1, (screenH * 0.3267) - 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " permanente!", (screenW * 0.3294) - 1, (screenH * 0.3022) + 1, (screenW * 0.6781) - 1, (screenH * 0.3267) + 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " permanente!", (screenW * 0.3294) + 1, (screenH * 0.3022) + 1, (screenW * 0.6781) + 1, (screenH * 0.3267) + 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " permanente!", screenW * 0.3294, screenH * 0.3022, screenW * 0.6781, screenH * 0.3267, tocolor(215, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
            else
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " de " .. days .. " dias!", (screenW * 0.3294) - 1, (screenH * 0.3022) - 1, (screenW * 0.6781) - 1, (screenH * 0.3267) - 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " de " .. days .. " dias!", (screenW * 0.3294) + 1, (screenH * 0.3022) - 1, (screenW * 0.6781) + 1, (screenH * 0.3267) - 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " de " .. days .. " dias!", (screenW * 0.3294) - 1, (screenH * 0.3022) + 1, (screenW * 0.6781) - 1, (screenH * 0.3267) + 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " de " .. days .. " dias!", (screenW * 0.3294) + 1, (screenH * 0.3022) + 1, (screenW * 0.6781) + 1, (screenH * 0.3267) + 1, tocolor(81, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
                dxDrawText(playerName .. " ativou um VIP " .. vipType .. " de " .. days .. " dias!", screenW * 0.3294, screenH * 0.3022, screenW * 0.6781, screenH * 0.3267, tocolor(215, 0, 0, alpha + 135), 1.00, font, "center", "center", false, false, false, false, false)
            end
            dxDrawText("Para mais informações sobre aquisição de VIPs: discord.gg/sucessorp", screenW * 0.3300, screenH * 0.3378, screenW * 0.6781, screenH * 0.3711, tocolor(255, 255, 255, alpha), 1.00, font, "center", "center", false, false, false, false, false)
        end
    end
)