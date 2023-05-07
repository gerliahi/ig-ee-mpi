ValueSet:    EducationLevel
Id:          education-level
Title:       "Education Level"
Description: "Haridustasemed"
* include codes from system SCT where concept descendent-of #365460000 "Finding of education received in the past"


Profile:        MpiSocialHistoryEducationLevel
Parent:         EEBaseObservation
Id:             EEMPI-SocialHistory-EducationLevel
Title:          "EE MPI SocialHistory Education Level"
Description:    "Haridusetase"
* status = #final (exactly)
* category 1..1 MS
* category = OBSCAT#social-history "Social history" (exactly)
* code = LN#82589-3 "Highest level of education" (exactly)
* effective[x] 0..1 MS
* effective[x] only Period
* effective[x] ^short = "Period mille jooksul haridustegevus jätkus või millal vastav haridustase kätte saadud"
* issued 1.. MS
* issued ^short = "Ajahetk millal antud haridustase fikseeritud"
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0..0 MS
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from EducationLevel
* valueCodeableConcept ^short = "Haridustase."
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0

Instance: EducationLevel
InstanceOf: MpiSocialHistoryEducationLevel
Usage: #example
* subject = Reference(Patient/pat1)
* issued = "1995-06-21T00:00:00+02:00"
* valueCodeableConcept = SCT#224300008 "Received university education"
