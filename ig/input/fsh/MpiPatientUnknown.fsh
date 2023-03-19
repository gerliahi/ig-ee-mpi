Profile: EEMPIPatientUnknown
Parent: Patient
//Id: EEMPI-Patient-Unknown
Title: "EE MPI Patient Unknown"
Description: "For use in ED, ambulance, for anonymous patients and environmental tests"
* ^status = #draft
* ^publisher = "TEHIK"
* active = false (exactly)
* name ..1
* name.use 1..
* name.use = #nickname (exactly)
* name.text 1..
* name.text ^short = "Tundmatu patsiendi hüüdnimi"
* name.family ..0
* name.given ..0
* name.prefix ..0
* name.suffix ..0
* identifier.system from PatientIdentityUnknown (required)
* identifier ^short = "Tundmatu identifikaator"
* telecom ..0
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension ^min = 0
* birthDate.extension contains ExtensionEEMPIPatientAge named age 0..1 MS and DateAccuracyIndicator named accuracyIndicator 0..1 MS
* birthDate.extension[age] ^isModifier = false
* birthDate.extension[age] ^short = "Patsiendi liigikaudne vanus"
* address ^short = "Leiukoht"
* address only EEMpiEstonianAddress
* address.use = #temp (exactly)
* address.use ^definition = "Place of finding | Leiukoht"
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
  * system = "urn:pin:hl7.ee:pid:ni:est"
  * value = "3456346"
* active = false
* name[0]
  * use = #nickname
  * text = "Malle Maasikas"
* gender = #male
* birthDate = "1973-02-10"
  * extension[accuracyIndicator].valueCoding = DateAccuracyIndicator#AAA "Day, month and year are accurate"
* address
  * use = #temp
  * country = "EE"
  * text = "Valukoja 10, Tallinn"
  * extension[ads].valueCoding.code = #2280361

