function onStepIn(cid, item, position, fromPosition)

	local player = Player(cid)
	
	if not player or player:isInGhostMode() then
		return false
	end
	
	if item.actionid == 8800 or item.actionid == 8801 then
		if player:getPremiumDays() < 1 then
			player:teleportTo(fromPosition)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tile seems to be protected against unwanted intruders.")
		end
	end
return true
end
