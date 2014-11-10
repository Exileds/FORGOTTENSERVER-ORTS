local savingEvent = 0

function onSay(cid, words, param)
	if Player(cid):getGroup():getAccess() then
		if isNumber(param) == TRUE then
			stopEvent(savingEvent)
			save(tonumber(param) * 60 * 1000)
		else
			saveServer()
		end
	end
end

function save(delay)
	saveServer()
	if delay > 0 then
		savingEvent = addEvent(save, delay, delay)
	end
end
