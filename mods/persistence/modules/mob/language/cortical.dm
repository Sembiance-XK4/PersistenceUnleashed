/decl/language/cortical
	name = "Cortical Chat"
	desc = "An algamation of recorded electrochemical signals and subvocalizations that can be transmitted via PLEXUS to all of those with cortical stacks."
	key = "h"
	colour = "interface"
	flags = LANG_FLAG_RESTRICTED | LANG_FLAG_NO_STUTTER | LANG_FLAG_NONVERBAL | LANG_FLAG_HIVEMIND | LANG_FLAG_NO_TALK_MSG | LANG_FLAG_NO_STUTTER
	shorthand = "CC"

/decl/language/cortical/broadcast(var/mob/living/carbon/human/speaker, var/message, var/speaker_mask)
	to_chat(speaker, "Cortical chat has been disabled for now.")
	return
	if(!istype(speaker))
		return ..()
	var/obj/item/organ/internal/stack/stack = (locate() in speaker.internal_organs)
	if(stack && stack.cortical_alias)
		return ..(speaker, message, stack.cortical_alias)
	. = ..()

/decl/language/cortical/check_special_condition(var/mob/living/carbon/other)
	if(istype(other) && (locate(/obj/item/organ/internal/stack) in other.internal_organs))
		return TRUE
	return FALSE

/decl/language/noise/get_talkinto_msg_range(message)
	return -1 // Nothing to hear in the immediate area, even if it wouldn't be understood.
