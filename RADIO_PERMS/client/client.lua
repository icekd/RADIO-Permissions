local ESX = nil
local playerData = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_clockin:clockduty')
AddEventHandler('esx_clockin:clockduty', function(text,job)
	TriggerEvent('chat:addMessage', {
			color = { 255, 0, 0},
			multiline = true,
			args = {"Me", text}
		})
	--exports["rp-radio"]:GivePlayerAccessToFrequency(1)

	   if job == "police" then
			exports["rp-radio"]:GivePlayerAccessToFrequencies(1,2,3,4,5,6,7,25)
	   elseif job == "ambulance" or job == "mechanic" or job == "doc" then
	   		exports["rp-radio"]:GivePlayerAccessToFrequencies(1,4,5,6,25)
	   elseif job == "fbi" then
			exports["rp-radio"]:GivePlayerAccessToFrequencies(1,2,3,4,5,6,7,25,100)
		
	   end
end)

RegisterNetEvent('esx_clockin:clockduty2')
AddEventHandler('esx_clockin:clockduty2', function(text,job)
	TriggerEvent('chat:addMessage', {
			color = { 255, 0, 0},
			multiline = true,
			args = {"Me", text}
		})
	--exports["rp-radio"]:RemovePlayerAccessToFrequency(1)

		exports["rp-radio"]:RemovePlayerAccessToFrequencies(1,2,3,4,5,6,7,25,100)
end)
