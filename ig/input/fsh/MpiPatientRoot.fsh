//Alias: $address-identifier = http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID
Alias: $patient-birthTime = http://hl7.org/fhir/StructureDefinition/patient-birthTime

/* Terminology */

CodeSystem: PatientIdentityCS
Id:         patient-identity
Title:     "Patient identity code system"
Description: "Patient identity code system"
* ^url =  http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity
* #urn:pin:hl7.ee:pid:ni
    "Patient national identifier"
    "Patsiendi riiklik identifikaator"
  * #urn:pin:hl7.ee:pid:ni:est
      "Estonian patient national identifier"
      "Eesti isikukood"
  * #urn:pin:hl7.ee:pid:ni:uzb
      "Uzbekistan patient national identifier"
      "Izbekistani PINFL"
* #urn:pin:hl7.ee:pid:ppn
    "Patient passport number"
    "Patsiendi passinumber"
  * #urn:pin:hl7.ee:pid:ppn:est
      "Estonian patient passport"
      "Eesti passinumber"
* #urn:pin:hl7.ee:pid:cz
    "Patient ID-card"
    "Patsiendi ID kaart"
  * #urn:pin:hl7.ee:pid:cz:est
      "Estonian patient ID-card"
      "Eesti ID-kaart"
* #https://mpi.tehik.ee
    "Identifier provided by MPI (Estonian patient register)"
    "Patsiendiregistri poolt väljaantud identifikaator"
* #urn:pin:hl7.ee:pid:bct
    "Patient birth certificate"
    "Patsiendi sünnitunnistus"
  * #urn:pin:hl7.ee:pid:bct:est
      "Estonian patient birth certificate"
      "Eesti sünnitunnistus"
* #urn:pin:hl7.ee:pid:prn
    "Patient identifier issued by healthcare facility"
    "Organisatsiooni poolt väljaantud"
  * #urn:pin:hl7.ee:pid:prn:90006399
      "PERH patient identifier"
      "PERHi poolt väljastatud patsiendi identifikaator"
* #urn:pin:hl7.ee:pid:mrt
    "Temporary Medical Record Number"
    "Ajutine isiku numbri, mida kasutatakse ainult kuni ametliku numbri määramiseni (Päästeameti case?)"
* #urn:pin:hl7.ee:pid:dr
    "Donor identifier"
    "Doonori kood"    
* #urn:pin:hl7.ee:pid:hc
    "EHIC Card number"
    "Euroopa kindlustatuse kaart"
* #urn:pin:hl7.ee:pid:u
    "Other unspecified patient identifier"
    "Muu täpsustamata patsiendi identifikaator"

ValueSet: PatientIdentityVS
Id: patient-identity
Title: "Patient Identity Value Set"
Description: "Patient identity value set"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity

ValueSet: PatientIdentityUnknown
Id: patient-identity-unknown
Title: "List of supported system for unknow patients"
Description: "List of supported system for unknow patients"
* PatientIdentityCS#https://mpi.tehik.ee 
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:prn 

ValueSet: PatientIdentityNI
Id: patient-identity-ni
Title: "List of supported national identifiers"
Description: "List of supported national identifiers"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:ni 

ValueSet: PatientIdentityPPN
Id: patient-identity-ppn
Title: "List of supported passport types"
Description: "List of supported passport types"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:ppn 

ValueSet: PatientIdentityBCT
Id: patient-identity-bct
Title: "List of supported birth certificates"
Description: "List of supported birth certificates"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:bct

ValueSet: PatientIdentityCZ
Id: patient-identity-cz
Title: "List of supported ID-cards"
Description: "List of supported ID-cards"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:cz

ValueSet: PatientIdentityPRN
Id: patient-identity-prn
Title: "List of healthcare facilities' supported identifiers"
Description: "List of identifiers supported by healthcare facilities"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:prn

ValueSet: PatientIdentityNewborn
Id: patient-identity-newborn
Title: "List of supported identification systems for newborn"
Description: "List of supported identification systems for newborn"
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:ni
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:bct
* include codes from system http://tis.tehik.ee/terminology/fhir/CodeSystem/patient-identity where concept descendent-of #urn:pin:hl7.ee:pid:prn

ValueSet: PatientIdentityStillborn
Id: patient-identity-stillborn
Title: "List of supported identification systems for stillborn"
Description: "List of supported identification systems for stillborn"
* include codes from system PatientIdentityCS where concept descendent-of #urn:pin:hl7.ee:pid:prn
* PatientIdentityCS#https://mpi.tehik.ee

/* Invariants */
Invariant:  mpi-id-01
Description: "Only final elements (leafs) of patient-identity code system may be used."
Expression: "system != 'urn:pin:hl7.ee:pid:ni' and system != 'urn:pin:hl7.ee:pid:ppn' and system != 'urn:pin:hl7.ee:pid:cz' and system != 'urn:pin:hl7.ee:pid:bct' and system != 'urn:pin:hl7.ee:pid:prn'"
Severity:   #error

/* Extensions */
Extension: ExtensionEEMPIPatientAge
Id: Extension-EEMPI-PatientAge
Title: "Extension EEMPI PatientAge"
Description: "Patient age measure and unit"
* ^version = "1.0.0"
* ^context.expression = "Patient.birthDate"
* ^context.type = #element
* ^status = #draft
* ^publisher = "TEHIK"
* ^meta.lastUpdated = "2022-10-07T09:27:34.0440931+00:00"
* value[x] only Age
* value[x].value 1..
* value[x].value ^minValueDecimal = 0
* value[x].value ^maxValueDecimal = 999
* value[x].unit 1..
* value[x].code 1..

Profile: EEMpiEstonianAddress
Parent: Address
Id: address-ee
Title: "Estonian Address"
Description: "This profile defines an address structure that localises core concepts, including identifiers and terminology, for use in an Estonian context."
* ^jurisdiction = urn:iso:std:iso:3166#EE
* . ^short = "Eesti aadress"
* country 1..1 MS 
* country ^short = "Should use a 2 digit ISO 3166 code"
* country = #EE (exactly)
* use 1..1 MS
* text 1..1 MS
* text ^short = "Täisaadressi visuaalne esitlus"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    ExtensionEEBaseADS named ads 0..1 MS
* extension[ads] ^short = "ADR-ID"
* extension[ads] ^isModifier = false



Profile: EEMpiForeignerAddress
Parent: Address
Id: address-other
Title: "Foreigner Address"
Description: "This profile defines an address structure for non Estonian patients."
* ^jurisdiction = urn:iso:std:iso:3166#EE
* . ^short = "Välismaalase aadress"
* text 1..1 MS 
* text ^short = "Täisaadressi visuaalne esitlus"
* country 1..1 MS 
* country from CountryVS
* country ^short = "Should use non 'EE' a 2 digit ISO 3166 code"
* obeys inv-add-0


Invariant: inv-add-0
Description: "Non Estonian aadress"
Severity: #error
Expression: "country != 'EE'"

Invariant: inv-add-3
Description: "Postal code shall be 5 digits"
Severity: #error
Expression: "matches('^[0-9]{5}$')"

/*

Profile: EstonianContactPioint
Parent: ContactPoint
Id: contactpoint-ee
Title: "Estonian Contact Point"
Description: "Profiil kirjeldab kontaktandmete kasutamise reeglid."
* ^jurisdiction = urn:iso:std:iso:3166#EE
* . ^short = "Eesti kontaktandmed"
* . ^slicing.discriminator.type = #pattern
* . ^slicing.discriminator.path = "$this"
* . ^slicing.rules = #open
* . contains mobilePhone 0..* MS
* ^[mobilePhone].system = #phone


* telecom[mobilePhone].use = #mobile
* telecom[mobilePhone].system 1..1 MS
* telecom[mobilePhone].use 1..1 MS
* telecom[mobilePhone] ^short = "Mobiiltelefon"
*/
