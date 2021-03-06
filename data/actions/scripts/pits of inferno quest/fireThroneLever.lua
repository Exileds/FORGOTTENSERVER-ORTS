local lava = {
	Position(32912, 32209, 15),
	Position(32913, 32209, 15),
	Position(32912, 32210, 15),
	Position(32913, 32210, 15)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local lavaTile
	for i = 1, #lava do
		lavaTile = Tile(lava[i]):getGround()
		if lavaTile and isInArray({407, 598}, lavaTile:getId()) then
			lavaTile:transform(lavaTile:getId() == 598 and 407 or 598)
			lava[i]:sendMagicEffect(CONST_ME_SMOKE)
		end
	end

	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
