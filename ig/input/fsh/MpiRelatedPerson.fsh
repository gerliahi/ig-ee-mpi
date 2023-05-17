Alias: v3-RoleCode = http://terminology.hl7.org/CodeSystem/v3-RoleCode 
Alias: v2-0131 = http://terminology.hl7.org/CodeSystem/v2-0131

Profile: MPIRelatedPerson
Parent: EEBaseRelatedPerson
Id: ee-mpi-related-person
Title: "EE MPI Related Person"
Description: "Patsient ja tema kontakt- ja seotud isikud."
//* patient MS
//* patient only Reference(EEBasePatient)
* active 1..1 MS
* relationship 1..* MS
* relationship ^short = "Seosetüübid - kontaktisiku roll ja isiklik seos (sugulane, tuttav, ..). "
* name 0..1 MS
* name ^short = "Kontaktisiku nimi."
//* telecom MS
* telecom ^short = "Kontaktisiku kontaktandmed."
* address MS
* address ^short = "Kontaktisiku aadress."
//* identifier 0..* MS
//* identifier.system from PatientIdentity (required)
//* identifier.system 1..1 MS
//* identifier.value 1..1 MS
//* identifier obeys mpi-id-01
* identifier ^short = "Kontaktisiku identifikaatorid."
* communication	MS 
* period 1..1 MS

Instance: PatientIgorBossenkoSon
InstanceOf: MPIRelatedPerson
Usage: #example
* id = "relpat11"
* patient = Reference(Patient/pat1)
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "39510212711"
* name.text = "Son of Igor"
* relationship = v3-RoleCode#SON
* active = true
* period.start = "1995-10-21"

Instance: PatientIgorBossenkoWife
InstanceOf: MPIRelatedPerson
Usage: #example
* id = "relpat12"
* patient = Reference(Patient/pat1)
* name.text = "Wife of Igor"
* relationship[0] = v3-RoleCode#WIFE "Wife"
* relationship[+] = v2-0131#C "Emergency Contact"
* active = true
* period.start = "1995-06-22"



