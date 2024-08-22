-- Author: IAmFrenk

include("Lekmod_utilities.lua")
include("PlotIterators")

local this_civ = GameInfoTypes["CIVILIZATION_LIECHTENSTIJN"]
local is_active = LekmodUtilities:is_civilization_active(this_civ)

function DummyPolicy(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_LIECHTENSTIJN"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_LIECHTENSTIJN"]) then

				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_LIECHTENSTIJN"], true)	
			end
		end
	end 
end

if is_active then
   Events.SequenceGameInitComplete.Add(DummyPolicy)
end
