function onStepIn(cid, item, position, fromPosition)

	local player = Player(cid)
	
	if not player or player:isInGhostMode() then
		return false
	end
	
	if item.actionid == 5092 then
		if player:getLevel() < 3 then
			player:teleportTo(fromPosition)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tile seems to be protected against unwanted intruders.")
		end
	end
	
	return true
end
