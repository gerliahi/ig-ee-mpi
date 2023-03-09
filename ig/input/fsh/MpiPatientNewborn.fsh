Profile: EEMPIPatientNewborn
Parent: Patient
//Id: EEMPI-Patient-Newborn
Title: "EE MPI Patient Newborn"
Description: "Profiil vastsündinu andmete kirjeldamiseks"
* ^status = #draft
* ^publisher = "TEHIK"
* active = true (exactly)
* gender ..1 MS
* name ..1
* name.use 1..
* name.use = #official (exactly)
* name.family 1..1 MS
* name.given MS
* name.given ^short = "Vastsündinu eesnimi võib puududa"
* identifier.system from PatientIdentityNewborn (required)
* identifier ^short = "Vastsündinu identifikaator"
* telecom ..0

* birthDate 1.. MS
* birthDate ^short = "Patsiendi sünniaeg"
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime] MS
* birthDate.extension[birthTime].value[x] MS


* address ..0
* maritalStatus ..0
* multipleBirth[x] 1..1 MS 
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Sünnijärjekord"
* photo ..0
* generalPractitioner ..0
* managingOrganization ..0
* link ..0



Instance: PatientNewborn
InstanceOf: EEMPIPatientNewborn
Usage: #example
* id = "pat-newborn"
* identifier[0]
  * system = #urn:pin:hl7.ee:pid:ni:est
  * value = "msvgh378544y"
* active = true 
* gender = #male
* name[0]
  * use = #official
  * family = "Maasikas"
* gender = #male
* birthDate = "1973-02-10"
* multipleBirthInteger = 1
/*
* address
  * use = #temp
  * country = "EE"
  * line = "Valukoja 10, Tallinn"
    * extension[adsid].valueString = "2280361"
*/

