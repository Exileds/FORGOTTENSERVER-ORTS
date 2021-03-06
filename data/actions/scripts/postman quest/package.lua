function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if item.uid == 3116  then
		if player:getStorageValue(Storage.postman.Mission09) == 1 then
			if player:getFreeCapacity() >= 500 then
				player:setStorageValue(Storage.postman.Mission09, 2)
				player:addItem(2330, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a letterbag.")
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enought capacity. The letterbag weights 500 oz.")
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.itemid == 2330 then
		if itemEx.actionid == 101 and itemEx.itemid == 2334 then
			if player:getStorageValue(Storage.postman.Mission09) == 2 then
				player:setStorageValue(Storage.postman.Mission09, 3)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				Item(item.uid):transform(1993)
			end
		end
	end
	return true
end
