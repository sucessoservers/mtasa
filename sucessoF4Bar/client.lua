local x, y = guiGetScreenSize()
local browser = nil

function create()
   if browser == nil then
      local link = "http://mta/"..getResourceName(getThisResource()).."/web-side/index.html"
      browser = createBrowser(x, y, true, true, false)
      addEventHandler("onClientBrowserCreated", browser, function()
         loadBrowserURL(source, link)
      end)
   else
      destroyElement(browser)
      browser = nil
   end
end
bindKey("f4", "both", create)

addCommandHandler("showbar", create)

setDevelopmentMode(true, true)

function SendNUIMessage(browser, table)
   if isElement(browser) and type(table) == "table" then
      return executeBrowserJavascript(browser, 'window.postMessage('..toJSON(table)..'[0])')
   end
end

function dxNUI()
    if getElementData(getLocalPlayer(  ), "loggedIn") then
      if getElementData(getLocalPlayer(  ), "loggedIn") == true then
         if browser ~= nil then
            dxDrawImage(0, 0, x, y, browser)

            SendNUIMessage(browser, {din = getPlayerMoney(localPlayer), banco = getElementData(localPlayer, ElementData_Banco ) or 0,  vip = getElementData(localPlayer, ElementData_Vip ) or 0, level = getElementData(localPlayer, "CustomJob") or getElementData(localPlayer, ElementData_Emprego) or "Desempregado"  })
         end
      end
   end
end
addEventHandler('onClientRender', getRootElement(), dxNUI) 