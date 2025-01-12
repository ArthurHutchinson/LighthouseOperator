-- This is the logic of when the player has the AntiLonely (Expected Loneliness) trait.
function antilonelytrait()
    local player = getPlayer();
    if player:HasTrait("AntiLonely") and player:getBodyDamage():getUnhappynessLevel() > 80 then
        player:getBodyDamage():setUnhappynessLevel(61);
    end
end

Events.OnPlayerUpdate.Add(antilonelytrait);