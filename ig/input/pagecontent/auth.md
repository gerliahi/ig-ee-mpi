Autentimine on protsess, millega üks kasutaja, süsteem või muu olem saab kontrollida teise olemi väidetava identiteedi tõesust.
Identiteeti tõestamiseks kasutaja/süsteem peab pärima tokeni universaalse TIS autentimisteenuse (Charon) käest x-Tee kaudu.

```info
Analoogne lahendus tokeni pärimiseks kasutatakse Andmevaaturis.
```

### Tokeni päring
Charon X-tee teenusel on olemas 3 erinevat keskkonda ning vastavalt sellele muutuvad ka teenuse urlis sisalduv service osas (samaväärne x-road-service päisega) ning x-road-client päises INSTANCE osa.

| Fragment  | Kirjeldus |
|---|---|
| INSTANCE | X-tee keskkond, näiteks ee-dev, ee-test või EE |
| CLASS | GOV, COM või NGO |
| MEMBER | Registrikood - kas TTO registrikood või teenuse osutaja registrikood (70009770) |
| SUBSYSTEM | Valikuline alamsüsteemi kood.Teenuse urlis kohustuslik (tis) |

 
### Eeldused TTO'le
- xTee teenus r1/INSTANCE/GOV/70009770/tis/charon peab olema kätte saadav; teenuse ligipääsu haldab TEHIK.
- TTO HIS'is on valmidus andmevaaturi käivitamise funktsiooni piiritletada vastavasisulise rolli ja/või privileegiga (näiteks AV käivitamise funktsiooni saab avada kasutaja tervisehoiu töötaja rollis).
- TTO on lisatud TAM registri.

### Eeldused kasutajale
- Meditsiiniliste töötajate puhul 
  - (optional) Kasutaja on kantud TAM registri arstina või spetsialistina.
  - (optional) Kasutajale on kantud seos kasutaja ja päringut teostatava TTO vahel.
- Mitte-meditsiiniliste töötajate puhul 
  - Kasutajal on Eesti isikukood.
  - Kasutajal on töösuhe TTO-ga, mida TTO kinnitab tokeni päringu teostamisega

### Päringu kirjeldus
#### HTTP päised

| Päis  | Kohustuslik | Kirjeldus |
|---|---|---|
| X-Road-Client | Jah | X-Tee kasutaja isikukood EE eesliitega |
| X-Road-UserId | Jah | X-Tee Client vormis INSTANCE/CLASS/MEMBER/SUBSYSTEM |
| X-Road-Represented-Party | Ei | TTO registrikood. Kohustuslik, kui X-Road-Clientis ei ole sama MEMBER, mis on pärija TTO registrikood. |
| X-NHS-Patient | Ei | Patsiendi isikukood. Soovituslik kasutada püstkriipsuga eraldatud vormingus, kus ees on patsiendi isikukoodi URL ja järel isikukood. |
| X-NHS-Role | Ei | Võimalik FHIR roll, mille alusel tehakse lisa kontroll, kas arvutatud roll on sama (Practitioner, Specialist, Student). Väärtus on tõstutundlik. |
| X-NHS-UserId | Ei | Tervishoiutöötaja kood. Soovituslik kasutada, et leida mitme koodi esinemisel hetkel arsti poolt kasutatav kood. Sobivad koodid on D, N või M eesliitega. |


#### Päringu teostamine läbi TTO xTee turvaserveri
Tokeni saamiseks peab TTO tarkvara pöörduma xTee turvaserveri poole järgmise URL'i kaudu (NB! Charon'i teenused on ehitatud xTee turvaserveri versiooni 6.22+ peal ning tegemist on xTee REST
teenusega): *http://tto_turvaserveri_ip/r1/INSTANCE/GOV/70009770/tis/charon/authorize*


#### Päised
Päringute päised vastavad X-tee REST protokolli [nõuetele](https://www.x- tee.ee/docs/live/xroad/pr-rest_x-road_message_protocol_for_rest.html#4-message-format)
Autentimisserver ootab järgmiseid päiseid:
- x-road-client: INSTANCE/CLASS/MEMBER/SUBSYSTEM (nt ee-dev/GOV/70009770/tis või EE/NGO/90004527)
- x-road-service: INSTANCE/GOV/70009770/tis/charon
- x-road-userId: EE(ARSTI_ISIKUKOOD) (näiteks EE38307210278)
- (optional) x-road-represented-party: TTO_REGISTRI_KOOD (näiteks 90009016)

#### Näidis
Päring cUrl kujul

```
curl -X POST "https://TTO_XTEE_SERVER_IP/ee-dev/GOV/70009770/tis/charon/authorize -H "accept: application/json" \
-H "X-Road-Client: ee-dev/COM/14379569/heda-dev" \
-H "X-Road-Service: ee-dev/GOV/70009770/tis/charon" \
-H "X-Road-UserId: EE37302102711" \
```

Vastuseks tuleb JSONi kujul autoriseerimise koodi objekt.
```
{
"code": "245ed8f8-dde4-4eb5-acb3-878eb5f2bcca", "type": "authorization_code",
"ttl": 15
}
```

### MPI kasutamine
Peale eduka tokeni kättesaamist tuleb pöörduda MPI aadressile:

| Keskkond  | URL |
|---|---|
| Arendus | https://tis.dev.tehik.ee/mpi/fhir |
| Test |  |
| Toodang |  |
