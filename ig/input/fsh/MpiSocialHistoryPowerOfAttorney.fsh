CodeSystem:  PowerOfAttorney
Id:          power-of-attorney
Title:       "PowerOfAttorney Status"
Description: "Hooldusõiguse liik"
* #A
    "A"
    ""
* #B
    "B"
    ""
* #C
    "C"
    ""

ValueSet:    PowerOfAttorney
Id:          power-of-attorney
Title:       "PowerOfAttorney Status"
Description: "Hooldusõiguse liik"
* include codes from system PowerOfAttorney


Profile:        MpiSocialHistoryPowerOfAttorney
Parent:         EEBaseObservation
Id:             EEMPI-SocialHistory-PowerOfAttorney
Title:          "EE MPI SocialHistory Power Of Attorney"
Description:    "Hooldusõigus"
* status = #final (exactly)
* category = OBSCAT#social-history "Social history" (exactly)
* code = SCT#186063005 "Power of attorney observable" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1.. MS 
* performer only Reference(EEBaseRelatedPerson)
* performer ^short = "Isik(ud) kellel on hooldusõigus."
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from PowerOfAttorney
* value[x] ^short = "Hooldusõiguse liik."
* note ..1 MS
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0

Instance: PowerOfAttorney
InstanceOf: MpiSocialHistoryPowerOfAttorney
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer[0] = Reference(PatientIgorBossenkoWife)
* valueCodeableConcept = PowerOfAttorney#A "A"
