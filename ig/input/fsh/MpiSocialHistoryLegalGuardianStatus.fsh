CodeSystem: GuardianStatus
Id:         guardian-status
Title:     "Guardian Status"
Description: "Eeskostja liik"
* #58626002 "Legal guardian"
* #365569001 "Finding of wardship"

ValueSet: GuardianStatus
Id:         guardian-status
Title:     "Guardian Status"
Description: "Eeskostja liik"
* include codes from system GuardianStatus


Profile:        MpiSocialHistoryLegalGuardianStatus
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-guardian-status
Title:          "EE MPI SocialHistory Legal Guardian Status"
Description:    "Seadusliku eeskostja staatus"
* status = #final (exactly)
* category[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#1193838006 "Legal guardian status" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1.. MS
* performer only Reference(EEBaseOrganization or EEBasePractitionerRole or EEBaseRelatedPerson)
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
* valueCodeableConcept = GuardianStatus#58626002 "Legal guardian"
