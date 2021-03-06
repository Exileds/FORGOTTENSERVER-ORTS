function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local orig = player:getPosition()
	local monster = Game.createMonster(param, orig)
	if monster then
		monster:setMaster(player)
		orig:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendCancelMessage("There is not enough room.")
		orig:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
