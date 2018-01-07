# Native apps II: iOS

## Boekenjagers applicatie

Het concept van de boekenjagers:
- Leg een boek ergens “te vondeling”.
- Post een hint op de Facebookgroep de Boekenjagers
- Andere boekenjagers gaan op jacht, vinden de buit.
- Ze lezen jouw boek en laten het boek daarna terug vrij in de natuur.
- De jacht kan dan opnieuw beginnen! 🙂

Deze app dient als hulpmiddel bij het 'jagen' naar boeken. De leden kunnen hun verstopte boek ingeven in de app. deze verschijnt dan bij de juiste gemeente. Zo kunnen leden specifiek zoeken in de regio waar ze willen jagen.

De app bestaat uit 4 delen:

1. Alle gemeenten waar boeken verstopt liggen
2. De te jagen boeken bij die gemeenten
3. Te vondeling gelegd boek toevoegen
4. Een detail van een boek met de vindplaats en een eventuele hint

Gebruikte frameworks:

- [Realm](https://github.com/realm)
- [MapKit](https://developer.apple.com/documentation/mapkit)

### Overzicht gemeenten
Op deze pagina wordt een overzicht getoond van alle gemeenten waar een boek te vondeling werd gelegd.

![alt text](https://i.imgur.com/TpYJhNBl.png)

### Overzicht van boeken per gemeente
Op deze pagina wordt een overzicht getoond van de boeken die te vinden zijn in deze gemeente.

![alt text](https://i.imgur.com/Us8rVYkl.png)

### Nieuw boek toevoegen
Op deze pagina kunnen te vondeling gelegde boeken gemeld worden. Deze boeken worden dan aan de juiste gemeente toegevoegd en worden nu bewaard in de Realm databank. 

![alt text](https://imgur.com/S6Pj1JMl.png)

### Overzicht boek 
Op deze pagina worden er meer details gegeven over het te vondeling gelegde boek. Het exacte adres of regio rond die plaats wordt getoond op een mapje. De hint die eventueel bijgevoegd werd is ook hier te lezen. Er is een mogelijkheid om via de knop "navigeer" met de maps-app te navigeren van je huidige locatie naar de plaats van het boek. Je kan hier ook aanduiden dat je dit boek gevonden hebt. Dit boek verdwijnt dan uit de lijst zodat er niet meer op gejaagd kan worden.

![alt text](https://i.imgur.com/mZ1gJgSl.png) ![alt text](https://i.imgur.com/d4PTm2Jl.png)




