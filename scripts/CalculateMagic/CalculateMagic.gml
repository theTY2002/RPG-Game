///@desc CalculateMagic(spell)
///@arg spell
function CalculateMagic(argument0) {
	damage = irandom_range(global.spells[argument0, SPELL_STATS.MINVALUE], global.spells[argument0, SPELL_STATS.MAXVALUE]);

	return damage;


}
