///Checks for language names to ensure no blank ones exist
/datum/unit_test/language_names

/datum/unit_test/language_names/Run()
	for(var/datum/language/language as anything in subtypesof(/datum/language))
		if(length(language.name))
			continue
		Fail("Language [language] lacks a name.")
