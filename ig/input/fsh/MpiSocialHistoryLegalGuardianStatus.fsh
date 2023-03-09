CodeSystem: GuardianStatus
Id:         guardian-status
Title:     "Guardian Status"
Description: "Eeskostja liik"
* #A
    "A"
    ""
* #B
    "B"
    ""
* #C
    "C"
    ""

ValueSet: GuardianStatus
Id:         guardian-status
Title:     "Guardian Status"
Description: "Eeskostja liik"
* include codes from system GuardianStatus


Profile:        MpiSocialHistoryLegalGuardianStatus
Parent:         Observation
Id:             EEMPI-SocialHistory-LegalGuardianStatus
Title:          "EE MPI SocialHistory Legal Guardian Status"
Description:    "Seadusliku eeskostja staatus"
* status = #final (exactly)
* category = OBSCAT#social-history "Social history" (exactly)
* code = SCT#1193838006 "Legal guardian status" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(Patient)
* performer 1.. MS
* performer only Reference(Organization or PractitionerRole or RelatedPerson)
* performer ^short = "Asutus ja/või isikud kellel on eeskoste õigus."
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from GuardianStatus
* value[x] ^short = "Eeskoste liik."
* note ..1 MS
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0

Instance: LegalGuardianStatus
InstanceOf: MpiSocialHistoryLegalGuardianStatus
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer[0] = Reference(Organization/Org1)
* performer[+] = Reference(PatientIgorBossenkoWife)
* valueCodeableConcept = GuardianStatus#A "A"
