## Zadanie: Pracovný pohovor
__________
Mojou úlohou bolo navrhnúť a implementovať riešenie pre problém kde chceme vrátiť celkový výnos(čiastku).
Pre vyriešenie problému som mal použiť PL/SQL. 
__________
### Zadanie
Vytvoril som si Postgres databázu pomocou Docker kontajneru. Do databázy som si vytvoril  3 tabuľky - `orders`, 
`order_items` a `products`. Tieto tabuľky som vytvoril pomocou scriptu `starter.postres.sql`, kde môžeme vidieť 
inicializované ich stĺpce. Order_items je prepojovacia tabuľka medzi 
orders a products. Následne som vytvoril funkciu `get_product_revenue` ktorá z databázy vráti celkový výnos. Jej vstupom
sú tri parametre - `product_id`,`start_date` a `end_date`. Funkcia ošetruje prípady, 
kedy je `start_date` väčší ako `end_date`. Vtedy vyhodím chybu. Ďalej ošetrujem prípad, kedy produkt s ID neexistuje. 
Vtedy rovnako vyhodím chybu, že produkt neexistuje. Následne z databázy vrátim sumu výnosov produktu, ktorý bol vytvorený
v danom časovom intervale. V skripte `select.sql` môžeme vidieť príklad volania
funkcie. 
```sql
SELECT get_product_revenue(5, '2024-02-24', '2024-03-05');
```
__________
### Záver
Zadanie, ktoré som dostal bolo veľmi zaujímavé, keďže som sa s PL/SQL ešte nestretol, musel som sa naučiť ako sa v 
PL/SQL pracuje. V škole som sa nadobudol poznatky z SQL. Bola to pre mňa veľmi dobrá skúsenosť, aby som si 
rozšíril svoje znalosti. Zadanie som sa snažil riešiť čo najlepšie a najefektívnejšie ako som vedel. 
__________
**Autor**: Matúš Kornhauser <br/>
**Email**: matus088@gmail.com
