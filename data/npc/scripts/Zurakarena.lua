
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif isInArray({"trip", "passage", "back"}, msg) then
		if Player(cid):getStorageValue(Storage.TheNewFrontier.Questline) >= 24 then
			npcHandler:say("You want to go back?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("It'zz your doom you travel to.", cid)
			local player = Player(cid)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 33158, y = 31228, z = 7})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Zzoftzzkinzz zzo full of fear.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'hurry') or msgcontains(msg, 'job')  then
		npcHandler:say('Me zzimple ferryman. I arrange {trip} to Zao.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
