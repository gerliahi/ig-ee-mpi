CodeSystem: DisabilityLevel
Id: disability-level
Title:     "Disability level"
Description: "Puude raskusaste"
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #KESKMINE_PUUE "Keskmine puue"
* #RASKE_PUUE "Raske puue"
* #SYGAV_PUUE "sügav puue"


ValueSet: DisabilityLevel
Id: disability-level
Title:     "Disability level"
Description: "Puude raskusaste"
* ^experimental = false
* include codes from system DisabilityLevel
/*
* ^compose.include.system = SCT

* ^compose.include.concept[+].code = #161043008
* ^compose.include.concept[=].display = "Slight"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Kerge puue"

* ^compose.include.concept[+].code = #161044002
* ^compose.include.concept[=].display = "Moderate"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Keskpuue"

* ^compose.include.concept[+].code = #161045001
* ^compose.include.concept[=].display = "Severe"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Raske puue"

* ^compose.include.system = LN

* ^compose.include.concept[+].code = #LL5052-7 
* ^compose.include.concept[=].display = "Crisis"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Sügav puue"
*/

Profile:        MpiSocialHistoryDisability
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-disability
Title:          "EE MPI SocialHistory Disability"
Description:    "Puue määr"
* status = #final (exactly)
* category[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = LN#95377-8 "Disability type" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0..1 MS
* performer only Reference(EEBaseOrganization or EEBasePractitionerRole)
* performer ^short = "Asutus ja/või isik kes määras puue."
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from DisabilityLevel
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0

Instance: Disability
InstanceOf: MpiSocialHistoryDisability
Description: "Example of patient disability"
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer = Reference(Organization/Org1)
* valueCodeableConcept = DisabilityLevel#KESKMINE_PUUE "Keskmine puue"
