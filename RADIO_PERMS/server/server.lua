ESX = nil

link = 'https://discord.com/api/webhooks/FILLINHERE'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function clockIn(jobname,playername)
	local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player has Clocked in",
            ["description"] =  jobname .. ": `" .. playername .. "` has went on duty 10-41",
        }
    }
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = "Clock In Log", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end

function clockOut(jobname,playername)
	local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player has Clocked Out",
            ["description"] =  jobname .. ": `" .. playername .. "` has went off duty 10-42",
        }
    }
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = "Clock In Log", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('clock', function(source, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'mechanic' or xPlayer.job.name == 'doc' then
		local text = 'You have Clocked In, you can now access Emergency Channels'
		TriggerClientEvent('esx_clockin:clockduty', source, text,xPlayer.job.name)
		local jobN = xPlayer.job.name
		if xPlayer.job.name == 'ambulance' then
			jobN = '🚑' .. '**EMS**' .. '🚒'
		elseif xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' then
			jobN = '🚔' .. '**Police**' .. '🚔'
		elseif xPlayer.job.name == 'mechanic' then
			jobN = '🛠️' .. '**Mechanic**' .. '🛠️'
		else
			jobN = '🎥 ' .. '**DOC**' .. '✋'
		end
		clockIn(jobN, xPlayer.getName())
	end
end)

RegisterCommand('clockout', function(source, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'mechanic' or xPlayer.job.name == 'doc'  then
		local text = 'You have Clocked Out, Clock In to Access Emergency Channels'
		TriggerClientEvent('esx_clockin:clockduty2', source, text,xPlayer.job.name)
		local jobN = xPlayer.job.name
		if xPlayer.job.name == 'ambulance' then
			jobN = '🚑' .. '**EMS**' .. '🚒'
		elseif xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' then
			jobN = '🚔' .. '**Police**' .. '🚔'
		elseif xPlayer.job.name == 'mechanic' then
			jobN = '🛠️' .. '**Mechanic**' .. '🛠️'
		else
			jobN = '🎥 ' .. '**DOC**' .. '✋'
		end
		clockOut(jobN, xPlayer.getName())
	end
end)




