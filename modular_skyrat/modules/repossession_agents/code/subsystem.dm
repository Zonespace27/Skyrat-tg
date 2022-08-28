SUBSYSTEM_DEF(repossession_agent)
	name = "Repossession Agent"
	flags = SS_KEEP_TIMING
	wait = 10 SECONDS
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	/// Assoc list of claim types to the amount that'll appear in one bounty rotation
	var/list/claim_types = list(
		"organ" = 3,
		"machine" = 2,
		"rare_item" = 3, // make defines later
	)
	/// List of current claim datums up for grabs
	var/static/list/current_claims = list()


/datum/controller/subsystem/repossession_agent/fire(resumed)
	regenerate_claim_list()

/datum/controller/subsystem/repossession_agent/proc/regenerate_claim_list()
	current_claims.Cut()




