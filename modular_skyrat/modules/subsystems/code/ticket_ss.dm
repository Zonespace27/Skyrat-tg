/// Pings admins every 3 minutes for all open tickets/OPFOR applications
SUBSYSTEM_DEF(ticket_ping)
	name = "Ticket Ping"
	flags = SS_BACKGROUND | SS_NO_INIT
	runlevels = RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 3 MINUTES

/datum/controller/subsystem/ambience/fire(resumed)
	var/valid_ahelps
	var/valid_opfors
	for(var/datum/admin_help/ahelp in GLOB.ahelp_tickets.active_tickets)
		if(ahelp.handler)
			continue
		valid_ahelps++

	for(var/datum/opposing_force/opfor in SSopposing_force.submitted_applications)
		if(opfor.handling_admin)
			continue
		valid_opfors++

	if(!valid_ahelps && !valid_opfors)
		return

	message_admins(span_adminnotice("There are currently [valid_ahelps ? "[valid_ahelps] unhandled staff tickets open" : ""][(valid_ahelps && valid_opfors) ? " and " ""][valid_opfors ? "[valid_opfors] unhandled Opposing Force applications open" : ""]."))
