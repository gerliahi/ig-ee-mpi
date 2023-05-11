ValueSet: EEMPIPatientIdentityUnknown
Id: ee-patient-identity-unknown
Title: "Unknown Patient Identity Systems"
Description: "Identity system acceptable for unknown patient identification"
* ^experimental = false
//* ^compose.include.system = EEBaseIdentitySystem
//* ^compose.include.concept[+].code = #https://fhir.ee/sid/pid/est/mr
* EEBaseIdentitySystem#https://fhir.ee/sid/pid/est/mr
* include codes from system EEBaseIdentitySystem where concept descendent-of "https://fhir.ee/sid/pid/est/prn"

Profile: EEMPIPatientUnknown
Parent: EEBasePatient
Id: ee-mpi-patient-unknown
Title: "EE MPI Patient Unknown"
Description: "For use in ED, ambulance, for anonymous patients and environmental tests"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* active = false (exactly)
* name ..1
* name[nickname] 1..1
* name[nickname].use ^short = "Tundmatu patsiendi tunnus"
* name[nickname].text ^short = "Tundmatu patsiendi hüüdnimi"
* name[official] 0..0
* identifier ..1
* identifier.system from EEMPIPatientIdentityUnknown (required)
* identifier ^short = "Tundmatu identifikaator"
* gender 1..
* telecom ..0
/*
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension ^min = 0
* birthDate.extension contains ExtensionEEMPIPatientAge named age 0..1 MS and DateAccuracyIndicator named accuracyIndicator 0..1 MS
* birthDate.extension[age] ^isModifier = false
* birthDate.extension[age] ^short = "Patsiendi liigikaudne vanus"
*/
/*
* address ^short = "Leiukoht"
* address only EEMpiEstonianAddress
* address.use = #temp (exactly)
* address.use ^definition = "Place of finding | Leiukoht"
*/
* maritalStatus ..0
* multipleBirth[x] ..0
* photo ..0
* generalPractitioner ..0
* managingOrganization ..0
* link ..0



Instance: PatientUnknown
InstanceOf: EEMPIPatientUnknown
Usage: #example
* id = "pat-unk"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/mr"
  * value = "3456346"
* active = false
* name[nickname]
  * use = #nickname
  * text = "Malle Maasikas"
* gender = #male
* birthDate = "1973-02-10"
  * extension[accuracyIndicator].valueCoding = DateAccuracyIndicator#AAA "DMY"
* address
  * use = #temp
  * country = "EE"
  * text = "Valukoja 10, Tallinn"
  * extension[ads].valueCoding.code = #2280361

