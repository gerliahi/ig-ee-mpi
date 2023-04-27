
CodeSystem: DisabilityLevelCS
Id:         disability-level
Title:     "Disability level"
Description: "Puude raskusaste"
* #161043008
    "Kerge puue"
    "Slight"
* #161044002
    "Keskpuue"
    "Moderate"
* #161045001
    "Raske puue"
    "Severe"

ValueSet: DisabilityLevel
Id: disability-level
Title:     "Disability level"
Description: "Puude raskusaste"
* include codes from system DisabilityLevelCS
* include codes from system SCT where concept descendent-of #21134002 "Disability (finding)"

Profile:        MpiSocialHistoryDisability
Parent:         Observation
Id:             EEMPI-SocialHistory-Disability
Title:          "EE MPI SocialHistory Disability"
Description:    "Puue määr"
* status = #final (exactly)
* category = OBSCAT#social-history "Social history" (exactly)
* code = LN#95377-8 "Disability type" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(Patient)
* performer 0..1 MS
* performer only Reference(Organization or PractitionerRole)
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
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer = Reference(Organization/Org1)
* valueCodeableConcept = DisabilityLevelCS#161044002 "Keskpuue"
