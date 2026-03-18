# Meta Language

## Caratteristiche 
> 2. basato sulle funzioni, sono sia valori sia codice

3. funzioni superiori possono prendere funzioni come parametri

> 4. fortemente incoraggiata la ricorsione

5. pattern matching 

> 6. no side effects, le variabili e l'enviornment(scope) non sono modificabili (non esiste assegnamento)

7. strong typing, determinati a compilazione

> 8. polimorfismo, si possono usare argomenti di tipo generico

9. dati astratti

## Esecuzione programmi


``` poly ``` -> esegue poly, facendo entrare nell'ambiente

``` rlwrap poly ``` -> esegue poly, mantiene la memoria dei comandi all'interno di poly
  
``` poly --use "foo"; ``` -> esegue il file e entra dentro l'ambiente
  
``` poly < foo ``` -> esegue il file poly

## Espressioni e Comandi

### Espressioni
entità la quale valutazione produce un valore oppure non termina
 - una variabile o costante
 - un operatore su argomenti
ci sono tre notazioni possibili
 1. infissa, a + b
 2. prefissa \+ a b 
 3. suffissa a b \+
  
la seconda e la terza sono comode perchè non hanno bisogno di parentesi  

gli operatori vengo visti come funzioni  
il + prende come parametri a e b   
dichiarare una variabile si dice binding, fa il binding del nome(anche per le funzioni)
#### Tipi di evaluation
eager evaluation -> prima valuta tutti gli operandi e poi gli applica l'operatore     
(con eccezioni come if con ||, risulterebbero inutili)  
lazy evaluation -> valuta gli operandi solo quando necessario  

### Comandi
entità la quale valutazione non produce un valore ma ha un side effect   
(non esistenti nella programmazione funzionale)

## Tipi di dati
ML è strongly typed, sono necessarie sempre conversioni esplicite
collezione di valori con operatori applicabili al loro tipo  
utili per:
* organizzare le info
* identificare errori
* ottimizzazione 

Tipi base:
 - int, per il negativo uso la tilde, posso usare anche la notazione esadecimale  
    * val it = 3:int;
    * val it = ~3:int;
 - real, per rendere reale deve avere almeno una cifra dopo il ., posso anche usare la notazione esponenziale  
    * val it = 3E2;
 - bool, true o false  
 - char, bisogna sempre usare #
    * val it = #"a":char;
 - string, senza #
    * val it = "a":string;
 - unit, per espressioni senza valore, vale ()
    * val it = ();

Tipi complessi:
 - tupla, può avere tipi diversi all'interno(inclusi altri complessi) e devono avere almeno 2 elementi  
    * val it = (1,2,3):int\*int\*int;  
    * #1 it -> restituisce il primo elemento della tupla
 - lista, deve avere stesso tipo
    * val it = [1,2,3]:int list;  
    * hd(it) ->head lista
    * tl(it) ->restituisce la lista senza testa
    * [1,2] @ [3,4] -> concatena
    * 2::[3,4] -> mette un elemento in testa
    * 1::2::3 -> [1,2,3]
    * nil = []
### Equivalenza e Compatibilità
#### Equivalenza
equivalenza per nome: se la definizione di un tipo è opaca, se hanno lo stesso nome o stesso identificatore.  
Se è la stessa cosa ma la rinomino allora è debolmente equivalente

equivalenza strutturale: se la definizione di un tipo è trasparente e hanno la stessa struttura  
#### Compatibilità
T e S sono compatibili se:  
 - sono equivalenti  
 - le operazioni di S si possono fare anche su T
 - c'è corrispondenza tra valori (float e int)
 - se i valori di T sono un subset di quelli di S
allora in questo caso posso fare conversioni(implicite o esplicite)
#### Conversioni
real(it) -> int to real  
floor(it) -> real to int (verso il basso)  
ceil(it) -> real to int(verso l'alto)  
round(it) -> real to int(o verso l'alto o il basso, se è a metà va verso il numero pari intero più vicino)  
ord(it) -> char to int  
chr(it) -> int to char   
str(it) -> char to str  
explode(it) -> string to char list
implode(it) -> char list to string
### Espressioni
tutte le espressioni finiscono con ;  
1+2*3; diventa  
> ```val it = 7: int;```  
if <p> then <esp1> else <esp2>;  
anche else è obbligatorio, e i tipi in then e else devono essere uguali  
if 5<5 then 3 else 4;  
 
### Operatori
#### Operatori calcolo
\+ \- \* / div(divisione interi) mod(%) ~(rende negativo) ^(concatena stringhe)
\+ (a,b) svolge la somma della tupla, il + può prendere solo duple (int*int -> int)

#### Comparazioni

= < > <= >= <>

#### Operatori Logici
questi usano la lazy evaluation
not andalso(&&) orelse(||)

## Funzioni
mapping di input in output, possono restituire valori o altre funzioni
non hanno side effect

map <funzione> [...] -> usa la funzione per ogni valore della lista 

