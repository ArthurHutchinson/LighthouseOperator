--[[

Save this as LightHouseMain.lua

This is for a game called Project Zomboid and to learn more about LUA coding.
This is an axample mostly for Lockdown RP.

Lighthouse Operator

+2 Maintenance
+2 Electrical
+1 Fishing

Foraging
    -20% Weather
    -10% Darkness
    +5% Food
    +5% Berries
    +5% Animal
    +10% Junk
    +10% Trash

Trait: Anticipated Lonliness
    This trait will make sure Unhappiness to never go over a certain threshold.
Trait: Night Eye
    See in the dark, because lighthouse.
    
You will need to go into this folder to learn more about the professions/trait system.:
../ProjectZomboid/media/lua/shared/NPCs/
This folder will contain player character information.

Recommend taking a gander in MainCreationMethods to assist.

Use the Steam Community page regarding "How to make a Profession/Trait" to help you.

]]

-- New Definition of Code
PisqueCustomProfessions = {}

-- ==============
-- =   TRAITS   =
-- ==============

PisqueCustomProfessions.DoTraits = function()
    
    local antilonely = TraitFactory.addTrait("AntiLonely", getText("UI_trait_antilonely"), 0, getText("UI_trait_antilonelydesc"), true);
    
    TraitFactory.addTrait("PisqueNightVision", getText("UI_trait_NightVision"), 0, getText("UI_trait_NightVisionDesc"), true);
    TraitFactory.setMutualExclusive("NightVision", "PisqueNightVision");

    TraitFactory.sortList();
    local traitList = TraitFactory.getTraits();
    for i = 1, traitList:size() do
        local trait = traitList:get(i-1);
        BaseGameCharacterDetails.SetTraitDescription(trait);
    end

end

-- ===================
-- =   PROFESSIONS   =
-- ===================

PisqueCustomProfessions.DoProfessions = function()

    local lighthouse = ProfessionFactory.addProfession("lighthouse",getText("UI_prof_lighthouse"), "icon_lighthouse", 2, getText("UI_profdesc_lighthouse"));
    lighthouse:addXPBoost(Perks.Maintenance, 2);
    lighthouse:addXPBoost(Perks.Electricity, 2);
    lighthouse:addXPBoost(Perks.Fishing, 1);
    lighthouse:addFreeTrait("PisqueNightVision");
    lighthouse:addFreeTrait("AntiLonely");
    
    local profList = ProfessionFactory.getProfessions();
    for i = 1, profList:size() do
        local profession = profList:get(i-1);
        BaseGameCharacterDetails.SetProfessionDescription(profession);
    end
    
end

-- PisqueCustomProfessions.DoNewCharacterInitializations = function(playernum, character)

--     if player:HasTrait("PisqueNightVision") then
-- 		player:getTraits():remove("PisqueNightVision");
-- 		player:getTraits():add("NightVision");
-- 	end

-- end

-- ===============================
-- =   Add Traits & Profession   =
-- ===============================

Events.OnGameBoot.Add(PisqueCustomProfessions.DoTraits);
Events.OnGameBoot.Add(PisqueCustomProfessions.DoProfessions);
-- Events.OnCreatePlayer.Add(PisqueCustomProfessions.DoNewCharacterInitializations);
-- Events.OnCreateLivingCharacter.Add(PisqueCustomProfessions.DoProfessions);
