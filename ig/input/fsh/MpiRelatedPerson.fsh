Alias: v3-RoleClass = http://terminology.hl7.org/CodeSystem/v3-RoleClass 
//Alias: v2-0131 = http://terminology.hl7.org/CodeSystem/v2-0131

ValueSet: EEMPIPersonRelationship
Id: ee-mpi-person-relationship
Title: "Person Relationship"
Description: "Person relationship"
* ^experimental = false
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* SCT#72705000 "Mother"
* SCT#66839005 "Father"
* SCT#67822003 "Child"
* SCT#127848009 "Spouse"
* SCT#444210007 "Cohabitee in relationship with subject"

ValueSet: EEMPIPersonRelationshipClass
Id: ee-mpi-person-relationship-class
Title: "Person Relationship Class"
Description: "Person relationship class"
* ^experimental = false
* v3-RoleClass#ECON "Emergency contact"
* v3-RoleClass#GUARD "Guardian"
* v3-RoleClass#DEPEN "Dependent"
* v3-RoleClass#NOK "Next of kin"


Profile: MPIRelatedPerson
Parent: EEBaseRelatedPerson
Id: ee-mpi-related-person
Title: "EE MPI Related Person"
Description: "Patsient ja tema kontakt- ja seotud isikud."
* active 1..1 MS
* relationship 1..* MS
* relationship ^short = "Seosetüübid - kontaktisiku roll ja isiklik seos (sugulane, tuttav, ..)."
* name 0..1 MS
* name ^short = "Kontaktisiku nimi."
* telecom ^short = "Kontaktisiku kontaktandmed."
* address MS
* address ^short = "Kontaktisiku aadress."
* identifier ^short = "Kontaktisiku identifikaatorid."
* communication	MS 
* period 1..1 MS
* relationship[person] MS
* relationship[person] from EEMPIPersonRelationship (extensible)
* relationship[class] MS
* relationship[class] from EEMPIPersonRelationshipClass (extensible)


Instance: PatientIgorBossenkoSon
InstanceOf: MPIRelatedPerson
Description: "Example of patient son"
Usage: #example
* id = "relpat11"
* patient = Reference(Patient/pat1)
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "39510212711"
* name.text = "Son of Igor"
* relationship = SCT#67822003 "Child"
* active = true
* period.start = "1995-10-21"

Instance: PatientIgorBossenkoWife
InstanceOf: MPIRelatedPerson
Description: "Example of patient wife and emergency contact"
Usage: #example
* id = "relpat12"
* patient = Reference(Patient/pat1)
* name.text = "Wife of Igor"
* relationship[0] = SCT#127848009 "Spouse"
* relationship[+] = v3-RoleClass#ECON "Emergency Contact"
* active = true
* period.start = "1995-06-22"



