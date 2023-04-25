Extension: ExtensionEEBaseADS
Id: Extension-EEBase-ADS
Title: "EEBase ADS extension"
* ^meta.lastUpdated = "2022-11-01T09:34:11.3138271+00:00"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 EE"
* ^context.type = #element
* ^context.expression = "Address"
* . ^short = "ADS extension"
* . ^definition = "Aadressiandmete süsteem (ADS) koosneb aadressiandmete süsteemi infosüsteemist ning erinevatest nõuetest. ADS-i eesmärk on tagada ühene aadressiandmete kogumine, registreerimine, töötlemine, säilitamine, identifitseerimine ning töötlemise funktsioonide ühetaoline korraldamine."
* value[x] only Coding
* value[x].system 1..
* value[x].system = "https://fhir.ee/NamingSystem/ads-id" (exactly)
* value[x].system ^short = "Reference to ADR-ID (identifier of address object and its version)"
* value[x].system ^definition = "https://geoportaal.maaamet.ee/est/Ruumiandmed/Aadressiandmed-p112.html"
* value[x].code 1..
