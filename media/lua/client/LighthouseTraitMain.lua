--[[

function SOAddUnhappyness(player, chance,  unhappyness)
	local HundredChance = ZombRand(100);
	if HundredChance <= chance then
		local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
		player:getBodyDamage():setUnhappynessLevel(currentUnhappyness + unhappyness);
		if player:getBodyDamage():getUnhappynessLevel() > 99 then
			player:getBodyDamage():setUnhappynessLevel(99);
		end
	end
end


function SODecUnhappyness(player, chance,  unhappyness)
	local HundredChance = ZombRand(100);
	if HundredChance <= chance then
		local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
		player:getBodyDamage():setUnhappynessLevel(currentUnhappyness - unhappyness);
		if player:getBodyDamage():getUnhappynessLevel() < 0 then
			player:getBodyDamage():setUnhappynessLevel(0);
		end
	end
end


function depressivemoodtrait ()
	local player = getPlayer();
	if player:HasTrait("Depressive") and not player:isAsleep() then
		SOAddUnhappyness(player, 5, (ZombRand(5)+1));	
		if ZombRand(1036) == 0 then
			SOAddUnhappyness(player, 100, (ZombRand(31)+70));
		end
	end
end		


-- EVENTS --
-- ON HIT TREE
Events.OnWeaponHitTree.Add(choptreesexp);
-- ON HIT
Events.OnWeaponHitCharacter.Add(brawlerweapontrait);
-- ON SWING
--OnWeaponSwing
Events.OnWeaponSwingHitPoint.Add(relentlesstrait);
Events.OnWeaponSwingHitPoint.Add(sorellegsstomppain);
Events.OnWeaponSwingHitPoint.Add(highsweatyattack);
Events.OnWeaponSwingHitPoint.Add(smokerattack);
Events.OnWeaponSwingHitPoint.Add(caloriestraitsswing);
-- ON PLAYER UPDATE
Events.OnPlayerUpdate.Add(liquidbloodtrait);
Events.OnPlayerUpdate.Add(thickbloodtrait);
Events.OnPlayerUpdate.Add(optimisttrait);
Events.OnPlayerUpdate.Add(fearofthedarktrait);
-- EVERY ONE MINUTE
Events.EveryOneMinute.Add(breathingtechtrait);
Events.EveryOneMinute.Add(ninjawaytrait);
Events.EveryOneMinute.Add(marathonrunnertrait);
Events.EveryOneMinute.Add(runningfitnessxp);
Events.EveryOneMinute.Add(sorelegstrait);
Events.EveryOneMinute.Add(panicattackstrait);
Events.EveryOneMinute.Add(allergictrait);
Events.EveryOneMinute.Add(commdrivertrait);
Events.EveryOneMinute.Add(optimistraitbored);
Events.EveryOneMinute.Add(smokertraitmain);
Events.EveryOneMinute.Add(hikertrait);
Events.EveryOneMinute.Add(lesssweatytrait);
Events.EveryOneMinute.Add(highsweatytrait);
Events.EveryOneMinute.Add(fearofthedarkstress);
Events.EveryOneMinute.Add(enjoytheridetrait);
Events.EveryOneMinute.Add(weakbackpain);
Events.EveryOneMinute.Add(sensitivedigestiontrait);
Events.EveryOneMinute.Add(snorertrait);
Events.EveryOneMinute.Add(pronetoillnesscold);
Events.EveryOneMinute.Add(fragilehealthheavyload);
Events.EveryOneMinute.Add(caloriestraits);
Events.EveryOneMinute.Add(alcoholbottlesdrinked);
Events.EveryOneMinute.Add(SOalcoholictrait);
Events.EveryOneMinute.Add(lifelongerlearnertrait);
Events.EveryOneMinute.Add(gravemanjob);
-- EVERY TEN MINUTES
Events.EveryTenMinutes.Add(weathersensitivetrait);
Events.EveryTenMinutes.Add(larkpersontrait);
Events.EveryTenMinutes.Add(owlpersontrait);
Events.EveryTenMinutes.Add(depressivemoodtrait);
Events.EveryTenMinutes.Add(smokeroftenandhunger);
Events.EveryTenMinutes.Add(SOalcoholictrait2);
Events.EveryTenMinutes.Add(SOalcoholicAnimshaking);
-- EVERY HOUR
Events.EveryHours.Add(hoursindepression);
Events.EveryHours.Add(SOcheckWeight);
-- ADD EXP
--Events.AddXP.Add(accmetabolismtrait);
Events.AddXP.Add(crueltytrait);
Events.AddXP.Add(bladetoolstrait);
Events.AddXP.Add(depressivexp);
Events.AddXP.Add(bodytypetraitsxp);
--
--
-- CHANGING ITEM STATS
-- EQUIP PRIMARY
Events.OnEquipPrimary.Add(stronggtiptrait);
Events.OnEquipPrimary.Add(woodaxemybelovedtrait);
Events.OnEquipPrimary.Add(minersednurancetrait);
-- EVERY TEN MINUTES
Events.EveryTenMinutes.Add(stronggtiptrait);
Events.EveryTenMinutes.Add(woodaxemybelovedtrait);
Events.EveryTenMinutes.Add(minersednurancetrait);
-- ON GAME START
Events.OnGameStart.Add(SOcheckWeight);
Events.OnGameStart.Add(stronggtiptrait);
Events.OnGameStart.Add(woodaxemybelovedtrait);
Events.OnGameStart.Add(minersednurancetrait);
-- ON CREATE PLAYER
Events.OnCreatePlayer.Add(SOcheckWeight);
Events.OnCreatePlayer.Add(stronggtiptrait);
Events.OnCreatePlayer.Add(woodaxemybelovedtrait);
Events.OnCreatePlayer.Add(minersednurancetrait);
--



local player = getPlayer();
if player has trait and player:getUnhappynessLevel() > 75 then player:setUnhappynessLevel to 70


]]

-- This is the logic of when the player has the AntiLonely (Expected Loneliness) trait.
function antilonelytrait()
    local player = getPlayer();
    if player:HasTrait("AntiLonely") and player:getBodyDamage():getUnhappynessLevel() > 80 then
        player:getBodyDamage():setUnhappynessLevel(61);
    end
end

Events.OnPlayerUpdate.Add(antilonelytrait);