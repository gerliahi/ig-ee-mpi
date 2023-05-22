/* This file contains Estonian FHIR standard description*/
Alias: RIK = https://ariregister.rik.ee

Instance: ExampleHospital
InstanceOf: Organization
Description: "Example of organization Org1"
Usage: #example
* id = "Org1"
* name = "Kodality General Hospital"
* identifier.system = RIK
* identifier.value = "14379569"
* alias = "Kodality"
* contact
  * telecom.system = #email
  * telecom.value = "info@kodality.com"
  * address.line = "Valukoja 8/2"
  * address.city = "Tallinn"

Instance: ExampleSynlab
InstanceOf: Organization
Description: "Example of organization Synlab"
Usage: #example
* id = "synlab"
* name = "SYNLAB EESTI OÜ"
* identifier.system = RIK
* identifier.value = "11107913"
* alias = "Synlab"
* contact
  * telecom.system = #email
  * telecom.value = "info@synlab.com"
  * address.line = "Veerenni tn 53a"
  * address.city = "Tallinn"


Instance: ExampleTervisekassa
InstanceOf: Organization
Description: "Example of organization Tervisekassa"
Usage: #example
* id = "ins"
* name = "Eesti Haigekassa"
* identifier.system = RIK
* identifier.value = "74000091"
* alias = "EHK"
* contact
  * telecom.system = #email
  * telecom.value = "info@tervisekassa.ee"
  * address.line = "Lastekodu 88"
  * address.city = "Tallinn"
