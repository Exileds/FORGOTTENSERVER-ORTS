function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		doRemoveItem(getTileItemById({x = 32145, y = 32101, z = 11}, 1304).uid)
		doSendMagicEffect({x = 32145, y = 32101, z = 11}, CONST_ME_EXPLOSIONAREA)
		doTransformItem(item.uid, 1946)
	elseif item.itemid == 1946 then
		doCreateItem(1304, 1, {x = 32145, y = 32101, z = 11})
		doSendMagicEffect({x = 32145, y = 32101, z = 11}, CONST_ME_TELEPORT)
		doTransformItem(item.uid, 1945)
	end
	return true
end
