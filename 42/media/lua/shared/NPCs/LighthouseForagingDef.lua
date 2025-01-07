--[[

Foraging
    -20% Weather
    -10% Darkness
    +5% Food
    +5% Berries
    +5% Animal
    +10% Junk
    +10% Trash
    
]]


-- Checks for glasses.
local function doGlassesCheck(_character, _skillDef, _bonusEffect)
	if _bonusEffect == "visionBonus" then
		local visualAids = {
			["Base.Glasses_Normal"]     = true,
			["Base.Glasses_Reading"]    = true,
		};
		local wornItem = _character:getWornItem("Eyes");
		if wornItem and visualAids[wornItem:getFullType()] then
			return false;
		end;
	end;
	return true;
end

forageSkills = {
    lighthouse = {
		name                    = "lighthouse",
		type                    = "occupation",
		visionBonus             = 0.25,
		weatherEffect           = 20,
		darknessEffect          = 10,
		specialisations         = {
			["Animals"]             = 5,
			["Junk"]                = 10,
			["Trash"]               = 10,			
			["JunkFood"]            = 5,
			["ForestRarities"]      = 5,			
			["Insects"]             = 10,					
			["FishBait"]            = 10,			
		},
    },
};