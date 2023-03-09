Profile: EEMPIPatientVerified
Parent: Patient
Title: "EE MPI Patient Verified"
Description: "MPI Patient verified during reception."
* ^status = #draft
* ^publisher = "TEHIK"
* active = true (exactly)
* name 1..* MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.rules = #open
* name ^short = "Patsiendi nimed. Ametlik nimi on kohustuslik"
* name contains official 1..1 MS 
* name[official] ^short = "Ametlik nimi"
* name[official].use = #official (exactly)
* name[official].family 1..1 MS 
* name[official].family ^short = "Perekonnanimi"
* name[official].given 1..1 MS
* name[official].given ^short = "Eesnimi"
* name[official].prefix 0..1 MS
* name[official].period MS

* address MS
* address ^slicing.discriminator.type = #value
* address ^slicing.discriminator.path = "country"
* address ^slicing.rules = #open
* address ^short = "Patsiendi aadressid. Eristatakse riigikoodi alusel. Riigikoodiks tuleb kasutada 2 kohalist ISO 3166 koodi"
* address contains ee 0..* MS and other 0..* MS
* address[ee] only EEMpiEstonianAddress
* address[other] only EEMpiForeignerAddress

* telecom MS
* telecom.value 1..1 MS 
* telecom.period MS 
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "$this"
* telecom ^slicing.rules = #open
* telecom ^short = "Patsiendi kontaktandmed."
* telecom contains mobilePhone 0..* MS and homePhone 0..* MS and workPhone 0..* MS and personalEmail 0..* MS and workEmail 0..* MS and other 0..*
* telecom[mobilePhone].system = #phone
* telecom[mobilePhone].use = #mobile
* telecom[mobilePhone].system 1..1 MS
* telecom[mobilePhone].use 1..1 MS
* telecom[mobilePhone] ^short = "Mobiiltelefon"
* telecom[homePhone].system = #phone
* telecom[homePhone].use = #home
* telecom[homePhone].system 1..1 MS
* telecom[homePhone].use 1..1 MS
* telecom[homePhone] ^short = "Kodune telefon"
* telecom[workPhone].system = #phone
* telecom[workPhone].use = #work
* telecom[workPhone].system 1..1 MS
* telecom[workPhone].use 1..1 MS
* telecom[workPhone] ^short = "Töötelefon"
* telecom[personalEmail].system = #email
* telecom[personalEmail].use = #home
* telecom[personalEmail].system 1..1 MS
* telecom[personalEmail].use 1..1 MS
* telecom[personalEmail] ^short = "Isiklik e-post"
* telecom[workEmail].system = #email
* telecom[workEmail].use = #work
* telecom[workEmail].system 1..1 MS
* telecom[workEmail].use 1..1 MS
* telecom[workEmail] ^short = "Töö e-post"
* telecom[other].system = #other
* telecom[other].system 1..1 MS
* telecom[other] ^short = "Muu kontakt"

* birthDate MS 
* gender MS 
* deceased[x] MS
* communication MS 

* maritalStatus ..0
* multipleBirth[x] ..0
* photo ..0
* generalPractitioner ..0
* managingOrganization ..0
* link ..0
* contact ..0

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^short = "Patsiendi identifikaatorid. Patsiendisüsteemi namespace-iks on , kus urn:pin spetsifitseeritud RFC-s https://www.rfc-editor.org/rfc/rfc3043.html. Ning 'hl7.ee:pid' on patsiendi namespace. Viies element vastab http://terminology.hl7.org/CodeSystem/v2-0203 koodisüsteemi väärtusele. Kuues element tüüpiliselt vastab riigi koodile koodisüsteemist http://hl7.org/fhir/ValueSet/iso3166-1-3 või asutuse registrikoodile."

* identifier contains ni 0..* MS
* identifier[ni] ^short = "Riiklik identifikaator"
* identifier[ni].system from PatientIdentityNI (extensible)
//* identifier[ni].system = PIDNI
* identifier[ni].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:ni:' ja lõppema 3-kohalise riigikoodiga."
* identifier[ni].value 1..1 MS
* identifier[ni].value ^short = "Isikukood või väisriigi riiklik identifikaator"

* identifier contains passport 0..* MS
* identifier[passport] ^short = "Pass"
* identifier[passport].system 1..1 MS
* identifier[passport].system from PatientIdentityPPN (extensible)
//* identifier[passport].system = PIDPPN
* identifier[passport].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:ppn:' ja lõppema selle riigi 3-kohalise koodiga, kus dokument väljastati."
* identifier[passport].value 1..1 MS
* identifier[passport].value ^short = "Passinumber"
* identifier[passport].period MS
* identifier[passport].assigner MS 
* identifier[passport].assigner ^short = "Dokumendi väljastanud organisatsioon. Saab kasutada nii organisatsiooni lingina kui ka tekstina."

* identifier contains idcard 0..* MS
* identifier[idcard] ^short = "ID-card"
* identifier[idcard].system 1..1 MS
* identifier[idcard].system from PatientIdentityCZ (extensible)
//* identifier[idcard].system = PIDCZ
* identifier[idcard].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:cz:' ja lõppema selle riigi 3-kohalise koodiga, kus dokument väljastati."
* identifier[idcard].value 1..1 MS
* identifier[idcard].value ^short = "ID-kaardi number"
* identifier[idcard].period MS
* identifier[idcard].assigner MS 
* identifier[idcard].assigner ^short = "Dokumendi väljastanud organisatsioon. Saab kasutada nii organisatsiooni lingina kui ka tekstina."

* identifier contains mr 0..1 MS
* identifier[mr] ^short = "MPI poolt väljaantud 'Medical Record' number"
* identifier[mr].system 1..1 MS
* identifier[mr].system = "https://mpi.tehik.ee" (exactly)
* identifier[mr].system ^short = "MPI $generate-identifier operatsiooni abil genereeritud identifikaator."
* identifier[mr].value 1..1 MS

* identifier contains bct 0..1 MS
* identifier[bct] ^short = "Sünnitunnistus"
* identifier[bct].system 1..1 MS
* identifier[bct].system from PatientIdentityBCT (extensible)
//* identifier[bct].system = PIDBCT
* identifier[bct].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:bct:' ja lõppema selle riigi 3-kohalise koodiga, kus dokument väljastati."
* identifier[bct].value 1..1 MS
* identifier[bct].value ^short = "Sünnitunnistuse number."

* identifier contains internal 0..* MS
* identifier[internal] ^short = "Asutuse sisene patsiendi identifikaator"
* identifier[internal].system 1..1 MS
* identifier[internal].system from PatientIdentityPRN (extensible)
//* identifier[internal].system = PIDORGINT 
* identifier[internal].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:prn:' ja lõppema koodi väljastava organisatsiooni registrikoodiga."
* identifier[internal].value 1..1 MS
* identifier[internal].value ^short = "Sisemine identifikaator peab olema unikaalne asutuse sees. Identifikaator ei pea kandma mingit semantilist tähendust."

/*
* identifier contains other 0..1 MS
* identifier[other] ^short = "Muu isikutunnistusena mitte aktsepteeritav dokument. Kasutada ainult erandolukordades!!!!  Iga kasutamist valideeritakse TEHIKu poolt. Või saame piirduda sel juhul MRN-iga????"
* identifier[other].system 1..1 MS
* identifier[other].system from PatientIdentityVS (extensible)
* identifier[other].system = "urn:pin:hl7.ee:pid:u" (exactly)
* identifier[other].system ^short = "Varuvariant igasuguse prügi panemiseks, kui ükski teistest identifikaatoritest ei sobi. Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:u:' ja lõppema organisatsiooni registrikoodiga ja unikaalse väärtusega väljastava organisatsiooni sees."
* identifier[other].value 1..1 MS
* identifier[other].value ^short = "Saatja peab tagama väärtuse unikaalsust (maailmaa piires)."
*/

Instance: PatientIgorBossenko2
InstanceOf: EEMPIPatientVerified
Description: "Välismaalase kodeerimine."
Usage: #example
* id = "pat1"
* identifier[0]
  * system = "urn:pin:hl7.ee:pid:ni:est"
  * value = "37302102711"
* identifier[+]
  * system = "urn:pin:hl7.ee:pid:ni:uzb"
  * value = "31002736540023"
* identifier[+]
  * system = "urn:pin:hl7.ee:pid:cz:est"
  * value = "AB0421183"
  * period.end = "2023-12-28"
  * assigner.display = "Estonian Police and Board Agency"
* identifier[+]
  * system = "urn:pin:hl7.ee:pid:ppn:est"
  * value = "K0307337"
  * period.end = "2023-12-28"
  * assigner.display = "Estonian Police and Board Agency"
* identifier[+]
//  * type = IdentityTypeCS#MR
  * system = "https://mpi.tehik.ee"
  * value = "82746127612"
* identifier[+]
//  * type = IdentityTypeCS#PRN
  * system = "urn:pin:hl7.ee:pid:prn:90006399"
  * value = "123e4567-e89b-12d3-a456-426614174000"
* identifier[+]
// * type = IdentityTypeCS#U
  * system = "urn:pin:hl7.ee:pid:u"
  * value = "90006399:xyz:123e4567-e89b-12d3-a456-426614174000"
* name[0]
  * use = #official
  * given = "Igor"
  * family = "Bossenko"
* gender = #male
* birthDate = "1973-02-10"
* address[ee]
  * use = #work
  * postalCode = "14215"
  * country = "EE"
  * text = "Valukoja 10, Tallinn"
  * extension[ads].valueCoding.code = #2280361


Instance: PatientJohnDoe
InstanceOf: EEMPIPatientVerified
Description: "Patsient minimaalse andmekoosseisuga."
Usage: #example
* id = "pat2"
* identifier[0]
  * type = IdentityTypeCS#DL
  * system = "urn:pin:hl7.ee:pid:dl:usa"
  * value = "857623628"
* active = true
* name[0]
  * use = #official
  * given = "John"
  * family = "Doe"
* gender = #male
