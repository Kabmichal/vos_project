#DBS 2019
**Zadanie:**
Vo vami zvolenom prostredí vytvorte databázovú aplikáciu, ktorá komplexne rieši päť vami zadefinovaných scenárov (prípadov použitia) vo vami zvolenej doméne tak, aby ste demonštrovali využitie relačnej databázy podľa pokynov uvedených nižšie. Presný rozsah a konkretizáciu scenárov si dohodnete s Vašim cvičiacim na cvičení. Projekt sa rieši vo dvojiciach, pričom sa očakáva, že na synchronizáciu práce so spolužiakom / spolužiačkou použijete git. 

**Petdiary** je wbová aplikácia, ktorá slúži
chovateľom na zaznamenávanie si kalórií, ktoré ich 
domáci miláčik počas dňa prijal. Používateľ sa
zaregistruje. Vytvorí si živočícha a typ potravy, ktorou ho
kŕmi. Aplikácia zobrazuje používateľovi jednotlivé záznami,
ktoré sú vyzualizované grafmi. Zároveň si používateľ
môže zobraziť štatistiky, kde má vypočítaný priemerný počet kalórií na
jednotlivý tip živočícha za deň. Zároveň má možnosť vydieť priemerný
počet kalórií všetkých používateľov.

**Stručne opísané cenáre:**
+ **Prvý scenár**: Pridanie záznamu. Tento scenár sa v 
mojej aplikácií nachádza niekoľko krát. napr. Vytvorenie používateľa,
vytvorenie potravy, ktorou chce používateľ daného živočícha kŕmiť,
vytvorenie živočícha, vytvorenie záznamu pre živočícha.

+ **Druhý scenár**: Zobrazenie záznamu. Tento scenár sa takisto
vyskytuje veľa krát. Používateľ má možnosť zobraziť všetkých používateľov,
živočíchy aj záznami.

+ **Tretí scenár**: Vymazanie záznamu. Používateľ má možnosť vymazať
záznam o živočíchovy. Takisto môže vymazať aj živočícha. Vymazanie živočícha je
ošetrené transakciou, ktorá vymaže aj všetky záznami o ňom.

+ **Štvrtý scenár**: Updatnutie záznamu. Používateľ má možnosť updatnúť svoj profil(môže si v ňom zmeniť údaje).

+ **Piaty scenár**: Vyhľadanie záznamu. Používateľ má možnosť vyhľadať živočíchy.
Vyhľadávanie prebieha na základe mena alebo typu živočícha.

Projekt je naprogramovaný v programovacom jazyku Ruby on rails. 
V projekte sú využité programovacie jazyky: HTML, CSS, JavaScript, Ruby

Použitá databáza: Postgresql

Prístup k databáze je vyriešený v database.yml 

**Využitie relačnej databázy:**
+ Join, group by, agregačná funkcia - sa nachádzajú hlavne v statisctics_controller.rb, ale je možné nájsť
ich aj v ostatných controlleroch.V agregačných funkciách využívam COUNT, AVG, SUM. Pri práci s databázou som na písanie 
príkazov použil jazyk SQL a Ruby.
+ Transakcia - väčšinu transakcií si ruby on rails rieši sám, pomocou active recordu,
ale transakcia, ktorú som napísal ja a využíva prácu s viacerými tabuľkami sa nachádza v
animals_controller.rb. Rieši vymazanie z dvoch tabuliek(animals, animal_foods). Najprv sa 
vymažú všetky záznami a potom sa vymaže aj živočích.
Things you may want to cover:

* Ruby version: 2.6.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Vos

Michal Kabac asi id 92784