/datum/round_event/ghost_role/operative/proc/announce_op()
	var/datum/comm_message/op_warning = new ("Central Command Readout", "Hello [GLOB.station_name],<br><br>We've recieved a report of a Syndicate ship within EVA distance of your station. We recommend to be on alert for any boarders.")
	SScommunications.send_message(op_warning)
