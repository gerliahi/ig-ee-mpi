Profile: EEMPIPatientStillborn
Parent: Patient
//Id: EEMPI-Patient-Stillborn
Title: "EE MPI Patient Stillborn"
Description: "Profiil surnultsündinu andmete kirjeldamiseks"
* ^status = #draft
* ^publisher = "TEHIK"
* active = false (exactly)
* gender ..1 MS
* name ..1
* name ^short = "Surnultsündinu nimi võib puududa"
* name.use 1..
* name.use = #nickname (exactly)
* name.family 0..1 MS
* name.given 0..1 MS
* identifier.system from PatientIdentityStillborn (required)
* identifier ^short = "Surnultsündinu identifikaator"
* telecom ..0

* birthDate 1.. MS
* birthDate ^short = "Patsiendi sünniaeg"
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime] MS
* birthDate.extension[birthTime].value[x] MS

* deceased[x] 1..1 MS 
* deceased[x] only dateTime
* deceased[x] ^short = "Patsiendi surnuaeg"

* address ..0
* maritalStatus ..0
* multipleBirth[x] 1..1 MS 
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Sünnijärjekord"
* photo ..0
* generalPractitioner ..0
* managingOrganization ..0
* link ..0



Instance: PatientStillborn
InstanceOf: EEMPIPatientStillborn
Usage: #example
* id = "pat-stillborn"
* identifier[0]
  * system = "urn:pin:hl7.ee:pid:prn:90006399"
  * value = "msvgh378544y"
* active = false 
* gender = #male
* name
  * use = #nickname
  * family = "Maasikas"
* gender = #female
* birthDate = "2023-02-14"
* birthDate.extension[birthTime].valueDateTime = "2023-02-14T16:00:00.000Z"
* deceasedDateTime = "2023-02-14T16:00:00.000Z"
* multipleBirthInteger = 1


