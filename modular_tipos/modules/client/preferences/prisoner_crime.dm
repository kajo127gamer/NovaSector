/// Which crime is the prisoner permabrigged for. For fluff!
/datum/preference/choiced/prisoner_crime
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "prisoner_crime"

/datum/preference/choiced/prisoner_crime/init_possible_values()
	return assoc_to_keys(GLOB.prisoner_crimes) + "Random"

/datum/preference/choiced/prisoner_crime/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/prisoner_crime/create_default_value()
	return "Random"

/datum/preference/choiced/prisoner_crime/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return istype(preferences.get_highest_priority_job(), /datum/job/prisoner)

/// Types of Crimes Prisoners will have on their record roundstart.
/// (They also can choose Random, which picks from these options... randomly!)

/datum/prisoner_crime

/datum/prisoner_crime/New()
	. = ..()
	if(tattoos == -1)
		tattoos = 1
		stack_trace("\"[src]\" prisoner_crime does not have a set amount of tattoos!")

/datum/prisoner_crime/negligence
	name = "Abhorrent Criminal Negligence"
	desc = "Incompetently risked numerous lives."
	tattoos = 0

/datum/prisoner_crime/cloning
	name = "Witchcraft"
	desc = "Bring bad omen"
	tattoos = 0

/datum/prisoner_crime/attempted_murder
	name = "Attempted Murder"
	desc = "Attempted to maliciously kill someone."
	tattoos = 2

/datum/prisoner_crime/bio_terrorism
	name = "Pestilence"
	desc = "Bring the plague, bring evil!!!."
	tattoos = 3

/datum/prisoner_crime/classified
	name = "Bought"
	desc = "You were sold as a slave."
	tattoos = 0

/datum/prisoner_crime/espionage
	name = "Espionage"
	desc = "Conducted espionage against Royalty for commercial purposes."
	tattoos = 1

/datum/prisoner_crime/counterfeiting
	name = "Counterfeiting"
	desc = "Engaged in widespread fraud."
	tattoos = 1

/datum/prisoner_crime/enemy_of_the_corp
	name = "Enemy of the Royalty"
	desc = "Acted as, or knowingly aided, an enemy of Royalty."
	tattoos = 1

/datum/prisoner_crime/grand_sabo
	name = "Grand Sabotage"
	desc = "Engaged in malicious destructive actions, seriously threatening Royalty employees and or infrastructure."
	tattoos = 2

/datum/prisoner_crime/grand_theft
	name = "Grand Theft"
	desc = "Stole items of high value or sensitive nature."
	tattoos = 1

/datum/prisoner_crime/identity_theft
	name = "Identity Theft of High-Ranking Figure"
	desc = "Impersonated a high-ranking figure."
	tattoos = 0 //well, obviously can't impersonate people with tats. if they want to go back to doing that
	
/datum/prisoner_crime/jaywalker
	name = "Jaywalker"
	desc = "Jaywalked across non-green tram crossings, shuttle docking zones, and/or through space."
	tattoos = 0 // Or should it be 6?

/datum/prisoner_crime/kidnapping
	name = "Kidnapping"
	desc = "Planned and executed a kidnapping."
	tattoos = 1

/datum/prisoner_crime/mass_murder
	name = "Mass Murder"
	desc = "Maliciously planned and executed the slaughter of many people."
	tattoos = 6

/datum/prisoner_crime/malpractice
	name = "Medical Malpractice"
	desc = "Engaged in organ harvesting, limb theft, or other malicious medical procedures."
	tattoos = 2

/datum/prisoner_crime/murder
	name = "Murder"
	desc = "Maliciously killed someone."
	tattoos = 3

/datum/prisoner_crime/mutiny
	name = "Mutiny"
	desc = "Attempted to overthrow/subvert Chain of Command."
	tattoos = 5 //+rep for trying

/datum/prisoner_crime/other
	name = "Other"
	desc = "Consult your skin tone."
	tattoos = 1

/datum/prisoner_crime/ai_tampering
	name = "Tampering of Artificial Intelligence"
	desc = "Uploaded malicious, negligent, or otherwise blacklisted directives to an Artificial Intelligence."
	tattoos = 3

/datum/prisoner_crime/tax_evasion
	name = "Tax Evasion"
	desc = "Outstanding amount of tax evasion."
	tattoos = 1

/datum/prisoner_crime/cultist
	name = "Worship of Blacklisted Deities"
	desc = "Practiced worship of blacklisted deities."
	tattoos = 1
