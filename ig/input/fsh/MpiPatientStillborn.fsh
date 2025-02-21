ValueSet: EEMPIPatientIdentityStillborn
Id: ee-patient-identity-stillborn
Title: "Stillborn Patient Identity Systems"
Description: "Identity system acceptable for stillborn patient identification"
* ^experimental = true
* EEBaseIdentitySystem#https://fhir.ee/sid/pid/est/npi
* EEBaseIdentitySystem#https://fhir.ee/sid/pid/est/ni
* include codes from system EEBaseIdentitySystem where concept descendent-of "https://fhir.ee/sid/pid/est/prn"

Profile: EEMPIPatientStillborn
Parent: EEMPIPatient
Id: ee-mpi-patient-stillborn
Title: "EE MPI Patient Stillborn"
Description: "Profiil surnult sündinu andmete kirjeldamiseks"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* active = false (exactly)
//* gender ..1 MS
* name ^short = "Surnult sündinu nimi võib puududa"
* name ..1
* name contains temp 0..1 MS
* name[temp] ^short = "Ajutine nimi"
* name[temp].use = #temp (exactly)
* name[temp].family 1..1 MS
* name[temp].given 0..1 MS
* name[temp].given ^short = "Surnult sündinu eesnimi võib puududa"
/*
* name.use = #nickname (exactly)
* name.family 0..1 MS
* name.given 0..1 MS
*/
* identifier 1..
* identifier.system from EEMPIPatientIdentityStillborn (required)
* identifier ^short = "Surnult sündinu identifikaator"
* telecom ..0
* birthDate 1.. MS
/*
* birthDate ^short = "Patsiendi sünniaeg"
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime] MS
* birthDate.extension[birthTime].value[x] MS
*/
* deceased[x] 1..1 MS 
* deceased[x] only dateTime
* deceased[x] ^short = "Patsiendi surmaaeg"

* address ..0
* maritalStatus ..0
* multipleBirth[x] 1..1 MS 
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Sünnijärjekord"


Instance: PatientStillborn
InstanceOf: EEMPIPatientStillborn
Description: "Example of stillborn patient"
Usage: #example
* id = "pat-stillborn"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/npi"
  * value = "60712121111"
* active = false 
* gender = #female
* birthDate = "2007-12-12"
* birthDate.extension[birthTime].valueDateTime = "2007-12-12T16:00:00.000Z"
* deceasedDateTime = "2007-12-12T16:00:00.000Z"
* multipleBirthInteger = 1

