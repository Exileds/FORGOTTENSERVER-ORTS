local config = {
	[9700] = Position(32667, 31681, 6),
	[9701] = Position(32726, 31666, 6),
	[9702] = Position(32674, 31617, 6),
	[9703] = Position(32664, 31679, 6),
	[9704] = Position(32658, 31688, 8),
	[9705] = Position(32655, 31688, 6)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end
