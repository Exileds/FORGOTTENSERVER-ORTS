local cfg = {
	{x=32099, y=32205, z=8, stackpos=0},
	{x=32100, y=32205, z=8, stackpos=0},
	{x=32101, y=32205, z=8, stackpos=0}
} -- 60137 and 60138 are lever UIDs! :p
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		for i = 60137, 60138 do
			doTransformItem(i, 1946)
		end
		for i = 1, 3 do
			doRelocate(cfg[i], {x=32102, y=32205, z=8})
			doTransformItem(getThingfromPos(cfg[i]).uid, i == 2 and 4619 or 351)
		end
		doCreateItem(4645, 1, {x=32099, y=32205, z=8})
		doCreateItem(4647, 1, {x=32101, y=32205, z=8})
	elseif item.itemid == 1946 then
		for i = 60137, 60138 do
			doTransformItem(i, 1945)
		end
		doRemoveItem(getTileItemById({x=32099, y=32205, z=8}, 4645).uid)
		doRemoveItem(getTileItemById({x=32101, y=32205, z=8}, 4647).uid)
		for i = 1, 3 do
			doTransformItem(getThingfromPos(cfg[i]).uid, 5770)
		end
	end
	return true
end
