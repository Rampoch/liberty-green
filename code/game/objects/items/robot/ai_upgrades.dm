///AI Upgrades


//Malf Picker
/obj/item/device/malf_upgrade
	name = "combat software upgrade"
	desc = "A highly illegal, highly dangerous upgrade for artificial intelligence units, granting them a variety of powers as well as the ability to hack APCs."
	icon = 'icons/obj/module.dmi'
	icon_state = "datadisk3"


/obj/item/device/malf_upgrade/afterattack(mob/living/silicon/ai/AI, mob/user)
	if(!istype(AI))
		return
	if(AI.malf_picker)
		AI.malf_picker.processing_time += 50
		AI.text2tab("<span class='userdanger'>[user] has attempted to upgrade you with combat software that you already possess. You gain 50 points to spend on Malfunction Modules instead.</span>")
	else
		AI.text2tab("<span class='userdanger'>[user] has upgraded you with combat software!</span>")
		AI.add_malf_picker()
	user.text2tab("<span class='notice'>You upgrade [AI]. [src] is consumed in the process.</span>")
	qdel(src)


//Lipreading
/obj/item/device/surveillance_upgrade
	name = "surveillance software upgrade"
	desc = "A software package that will allow an artificial intelligence to 'hear' from its cameras via lip reading."
	icon = 'icons/obj/module.dmi'
	icon_state = "datadisk3"

/obj/item/device/surveillance_upgrade/afterattack(mob/living/silicon/ai/AI, mob/user)
	if(!istype(AI))
		return
	if(AI.eyeobj)
		AI.eyeobj.relay_speech = TRUE
		AI.text2tab("<span class='userdanger'>[user] has upgraded you with surveillance software!</span>")
		AI.text2tab("Via a combination of hidden microphones and lip reading software, you are able to use your cameras to listen in on conversations.")
	user.text2tab("<span class='notice'>You upgrade [AI]. [src] is consumed in the process.</span>")
	qdel(src)
