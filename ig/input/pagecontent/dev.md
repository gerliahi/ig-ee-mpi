Antud juhend selgitab põhireeglid patsiendi andmete pärimiseks ja sõnumite koostamiseks. 
Testimiseks laadige alla Postman [kollektsiooni](images/MPI_FHIR_examples.postman_collection.json) näidetega 

### Andmete pärimine
Patsiendi andmete pärimiseks saab esitada REST päringu mis tagastab kas üksiku ressurssi või ressursside kollektsiooni (edaspidi *Bundle*).

#### Ressurss
Üksiku ressurssi tagastatakse siis kui andmed päritakse REST päringuga MPI sisemise id (viida) järgi:
```
GET {MPI}/Patient/1
Accept: application/json
```
Sõltuvalt Accept päringu väärtuses vastuseks tuleb sõnumi keha JSON või XML vormingus.
Järgmine sektsioon sisaldab andmed minimaalse andmekoosseisuga:
```json
{
    "resourceType": "Patient",
    "id": "1",
    "meta": {
        "profile": [
            "https://hl7.ee/fhir/StructureDefinition/EEMPI-Patient-Verified"
        ]
    },
    "identifier": [
        {
            "system": "urn:pin:hl7.ee:pid:est:ni",
            "value": "37412251234"
        }
    ],
    "active": false,
    "name": [
        {
            "use": "official",
            "family": "Tamm",
            "given": [
                "Tiit",
                "Priit"
            ]
        }
    ],
    "gender": "male"
}
```

#### Otsing
Patsiendi otsingu tulemusena tagastatakse [Bundle](https://www.hl7.org/fhir/bundle.html) (või teiste sõnadega "ümbrik"), mis võib sisaldada mitu ressurssi (0..n). Järgnevas näites teostatakse otsing Eesti isikukoodi _37412251234_ järgi:
```
GET {MPI}/Patient?identifier=urn:pin:hl7.ee:pid:est:ni|37412251234
```
Enne saatmist kõik erisümbolid peavad olema encode-itud:
```
GET {MPI}/Patient?identifier=urn%253Apin%253Ahl7.ee%253Apid%253Ani%253Aest%257C37412251234
```
Vastusena tuleb (searchset) Bundle mis tagastab metainformatsiooni päringu kohta ja kollektsiooni kahest ressurssist (kust eemaldatud patsiendi ressurssi sisuline osa):
```json
{
    "resourceType": "Bundle",
    "type": "searchset",
    "total": 2,
    "link": [
        {
            "relation": "self",
            "url": "{MPI}/Patient?identifier=urn%3Apin%3Ahl7.ee%3Apid%3Ani%3Aest%7C37412251234&_page=1"
        },
        {
            "relation": "first",
            "url": "{MPI}/Patient?identifier=urn%3Apin%3Ahl7.ee%3Apid%3Ani%3Aest%7C37412251234&_page=1"
        },
        {
            "relation": "last",
            "url": "{MPI}/Patient?identifier=urn%3Apin%3Ahl7.ee%3Apid%3Ani%3Aest%7C37412251234&_page=1"
        }
    ],
    "entry": [
        {
            "fullUrl": "Patient/1",
            "resource": {
                "resourceType": "Patient",
                "id": "1",

            ...
            }
        },
        {
            "fullUrl": "Patient/2",
            "resource": {
                "resourceType": "Patient",
                "id": "2",

            ...
            }
        }        
    ]
}                            
```

#### Otsing identifikaatori järgi
MPI toetab otsingu [identifikaatori](identifiers.html) järgi.

#### Välismaalaste otsing
Välismaalaste otsimiseks või patsientide otsimiseks ilma identifikaatorita tuleb kasutada operatsiooni [Patient/$foreigner](OperationDefinition-Patient-foreigner.html). Toetavate parameetrite hulka kuuluvad: identifikaatori väljastanud riik, eesnimi, perekonnanimi, sünnikuupäev, sugu ja kontaktandmed.
```
GET {MPI}/Patient/$foreign?family=smith&gender=male
```
Vastusena tuleb (collection) Bundle mis tagastab kollektsiooni leitud ressurssidest (ilma metainformatsioonita):
```json
{
    "resourceType": "Bundle",
    "type": "collection",
    "entry": [
        {
            "resource": {
                "resourceType": "Patient",
                "id": "1027",
                ...
            }
        }
    ]
}                    
```

#### Ressurssi ajalugu
Iga FHIR ressurssi muutmine loob uut ressurssi versiooni. Varasemate versioonide nimekirja saamiseks kasuta päringu:
```
GET {MPI}/Patient/1/_history
```
Ning ühte kindla versiooni saad päringuga
```
GET {MPI}/Patient/1/_history/2
```
, kus 2 on versiooni number.

#### Muudatuste ajalugu
MPI pakub võimalust pärida nimekirja muudatud patsientidest alates kindlast ajahetkest
```
GET {MPI}/Patient/_history?_since=2023-03-31&_count=10
```

### Andmete muutmine
#### Üldised nõuded
Patsiendi andmete saatmiseks iga FHIR-i ressurss PEAB sisaldama ressursi tüübi (“resourceType”) ja profiili (“meta.profile”).
Uue kirje loomisel saab anda kaasa oma infosüsteemi sisemise identifikaatori (“meta.source”).
```json
  "resourceType": "Patient",
  "meta": {
    "profile": [
      "https://fhir.ee/StructureDefinition/EEMPI-Patient-Verified"
    ],
    "source": "https://my.his.ee/Patient/92837-fdsvsd-3f4gfew-2342dwd" 
  },
  "id": "1"
```

Profiil on reeglite kogum, mis seotud kindla kasutusjuhuga. MPI toetab [tuvastatud](StructureDefinition-EEMPIPatientVerified.html) ja [tundmatu](StructureDefinition-EEMPIPatientUnknown.html) patsientide rregistreerimist. Tulevikus võivad lisanduda [vastsündinu-](StructureDefinition-EEMPIPatientNewborn.html), [surnultsündinu-](StructureDefinition-EEMPIPatientStillborn.html) ja [mitte inimpatsientide]() registreerimine.
Iga patsiendi lisamisel või muutmisel tuleb määrata vastav profiil.

#### Request
Patsiendi loomisel/muutmisel tuleb saata päringu FHIR-i endpointile, näiteks arenduskeskkonnas aadressile: https://tis.dev.tehik.ee/mpi/fhir/Patient. 
Päringus tuleb määrata mitu tunnust REST päringu päises (Header-is):
- andmetüübi määramiseks ("Content-Type" väärtustega "application/json" või application/xml või "application/fhir+json" või application/fhir+xml)
- autentimisluba ("Authorization")
- valiidset sõnumi tuleb edastada päringu kehas. Andmekoosseisu saab leida lehel [Patsiendid](patient.html).

#### Vastus (response)
Eduka vastuse korral FHIR server tagastab HTTP koodi 20X. Näiteks uue patsiendi loomisel tagastakse HTTP-kood = "201 Created".
Vastuse päis "Location" sisaldab lingi loodud ressursile.
```
Location:	https://tis.dev.tehik.ee/mpi/fhir/Patient/3
```
Vaikimisi loodud ressursi kehat ei tagastata. Vajadusel saate muuta vaikekäitumist määrates päiset "[Prefer](http://hl7.org/fhir/http.html#ops)".
Loogilise vea puhul vastatakse koodiga 40x veaga. Juhul kui teenus ei ole kättesaadav tuleb 50X viga. 
Vead tagastatakse [OperationOutcome](http://hl7.org/fhir/operationoutcome.html) vormingus. Väli "code" tüüpiliselt sisaldab ühte loogilistest [koodidest](errors.html).


