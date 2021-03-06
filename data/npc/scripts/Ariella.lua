local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25  then
			Npc():say("Have a drink in Meriana's only tavern!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

function PirateSecond(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.OutfitQuest.PirateHatAddon) == -1 then
		if player:getItemCount(6101) > 0 and player:getItemCount(6102) > 0 and player:getItemCount(6100) > 0 and player:getItemCount(6099) > 0 then
			if player:removeItem(6101, 1) and player:removeItem(6102, 1) and player:removeItem(6100, 1) and player:removeItem(6099, 1) then
				npcHandler:say("Ah, right! The pirate hat! Here you go.", cid)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				player:setStorageValue(Storage.OutfitQuest.PirateHatAddon, 1)
				player:addOutfitAddon(155, 2)
				player:addOutfitAddon(151, 2)
			end
		else
			npcHandler:say("You do not have all the required items.", cid)
		end
	else
		npcHandler:say("It seems you already have this addon, don\'t you try to mock me son!", cid)
	end
end

node1 = keywordHandler:addKeyword({'hat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate hat you need give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
node1:addChildKeyword({'yes'}, PirateSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate hat you need give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
node2:addChildKeyword({'yes'}, PirateSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())
