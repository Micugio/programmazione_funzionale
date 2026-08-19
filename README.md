# Programmazione Funzionale

## Git
git clone -> clona repository sulla macchina locale (Username: Micugio, Password: Generare token temporaneo su https://github.com/settings/tokens).  
git add . -> aggiunge tutte le modifiche effettuate nel repository alle modifiche che verrano salvate.  
git commit -m "nome commit" -> salva tutte le modifiche sul repository locale.  
git push -> invia le modifiche del repository locale online.  
git pull -> copia le modifica, del repository da github a locale.  
git config --global credential.helper store -> PER NON ACCEDERE CON USERNAME E PASSWORD  

## Repository Github
Michele Piamarta -> https://github.com/MicheleP030/ProgrammazioneFunzionale  
Leonardo Sparano -> https://github.com/sparryy/programmazione-funzionale  

## PolyML
**Avviare PolyML:**  
- poly

- rlwrap poly   
  **NOTA:** versione con cronologia dei comandi.

**Interrompere compilazione PolyML:**  
CTRL + C  

**Chiudere PolyML:**  
CTRL + D  

**Eseguire file .sml dentro PolyML:**  
- poly (INVIO) + use "nomefile"; (INVIO)        
  **NOTA:** scrivere solo il nome del file (senza estensione) tra virgolette. 
  
- rlwrap poly (INVIO) + use "nomefile"; (INVIO)   
  **NOTA:** scrivere solo il nome del file (senza estensione) tra virgolette. QUESTA VERSIONE ha la cronologia dei comandi.   

- poly < nomefile.sml   

**Commenti su file .sml**  
(* Questo è un commento *)

## Markdown
### Comandi (ufficiali)
https://www.markdownguide.org/basic-syntax/
### Scorciatoie dell'estensione
| Scorciatoia      | Cosa fa            |
| ---------------- | ------------------ |
| Ctrl + B         | grassetto          |
| Ctrl + I         | corsivo            |
| Ctrl + Shift + ] | aumenta heading    |
| Ctrl + Shift + [ | diminuisce heading |
| Ctrl + Shift + V | preview            |
| Ctrl + K V       | preview a lato     |
| Tab              | indentazione lista |
| Ctrl + Shift + P | comandi markdown   |

### Scrivere un blocco di codice
Linux = alt Gr + apostrofo  
Win11 = alt + 92  
**ESEMPIO:**
```ML
fun cubo (x:real) = x*x*x;
cubo(5.0);
```
## Operatori PolyML

### Operatori Aritmetici
| Operatore | Descrizione | Tipo di operandi | Esempio |
| :--- | :--- | :--- | :--- |
| `+` | Addizione | `int`, `real`, `word` | `5 + 3` |
| `-` | Sottrazione | `int`, `real`, `word` | `5 - 3` |
| `*` | Moltiplicazione | `int`, `real`, `word` | `5 * 3` |
| `/` | Divisione reale | Solo `real` | `5.0 / 2.0` *(ritorna 2.5)* |
| `div` | Divisione intera | `int`, `word` | `5 div 2` *(ritorna 2)* |
| `mod` | Resto (Modulo) | `int`, `word` | `5 mod 2` *(ritorna 1)* |
| `~` | Meno unario (Negazione) | `int`, `real` | `~5` *(indica -5)* |

> ⚠️ **Attenzione a `~`:** Il simbolo `-` si usa solo come operatore binario (sottrazione). Per scrivere un numero negativo o invertire il segno di una variabile si usa tassativamente la tilde `~`. Scrivere `-5` genera un errore di sintassi.

---

### Operatori di Confronto (Relazionali)
Questi operatori effettuano comparazioni e restituiscono un valore booleano (`true` o `false`).
| Operatore | Descrizione | Nota | Esempio |
| :--- | :--- | :--- | :--- |
| `=` | Uguale a | Funziona solo su tipi equality (`''a`) | `x = 5` |
| `<>` | Diverso da | Equivalente a "not equal" | `x <> 5` |
| `<` | Minore di | Usabile su tipi ordinati (`int`, `real`, `string`, ecc.) | `x < 5` |
| `>` | Maggiore di | Usabile su tipi ordinati | `x > 5` |
| `<=` | Minore o uguale | Usabile su tipi ordinati | `x <= 5` |
| `>=` | Maggiore o uguale | Usabile su tipi ordinati | `x >= 5` |

> ⚠️ **I numeri reali:** Non puoi usare `=` o `<>` direttamente sui tipi `real` (es. `1.0 = 1.0` fallisce in SML standard) perché i reali non sono considerati "equality types" a causa dell'approssimazione in virgola mobile.

---

### Operatori Logici Booleani
| Operatore | Descrizione | Comportamento | Esempio |
| :--- | :--- | :--- | :--- |
| `andalso` | AND logico | Cortocircuito (valuta il secondo operando solo se il primo è `true`) | `cond1 andalso cond2` |
| `orelse` | OR logico | Cortocircuito (valuta il secondo operando solo se il primo è `false`) | `cond1 orelse cond2` |
| `not` | NOT logico | È una funzione unaria (non un operatore infisso) | `not true` *(ritorna false)* |    

**ESEMPI:**    
```ML
> 1<2 andalso not (3>4);
val it = true: bool
```
```ML
> 3<4 orelse [6<5 andalso [not [(7<>8)]]];  (* NOTA: mi basta guardare il primo confronto, è vero quindi tutto vero. *)
val it = true: bool
```

## Conversione dei Tipi
| Operazione | Istruzione | Descrizione | Esempio |
| :--- | :--- | :--- | :--- |
| Da int a real | `real(n)` | Converte un intero in numero reale. | `real(5) = 5.0` |
| Da real a int | `floor(r)` | Arrotonda per difetto (verso l'infinito negativo). | `floor(3.7) = 3 /// floor(~3.7) = ~4` |
| Da real a int | `ceil(r)` | Arrotonda per eccesso (verso l'infinito positivo). | `ceil(3.2) = 4 /// ceil(~3.2) = ~3` |
| Da real a int | `round(r)` | Arrotonda all'intero più vicino (Se la parte decimale è esattamente `.5`, arrotonda al numero pari più vicino). | `round(3.5) = 4 /// round(2.5) = 2` |
| Da real a int | `trunc(r)` | Tronca la parte decimale (verso lo zero, ES: trunc(~3.9) = ~3) | `trunc(3.9) = 3 /// trunc(~3.9) = ~3` |
| Da char a int | `ord(c)` | Restituisce il codice ASCII del carattere. -> ES: ord(#"a") = 97 | `ord(#"A")= 65 /// ord(#"a") = 97` |
| Da int a char | `chr(n)` | Restituisce il carattere corrispondente al codice ASCII (range 0-255). | `chr(97) = #"a"` |
| Da char a string | `str(c)` | Converte un singolo carattere in una stringa. | `str(#"x") = "x"` |
| Da string a char list | `explode(s)` | Scompone una stringa in una lista di caratteri. | `explode("Ciao") = [#"C", #"i", #"a", #"o"]` |
| Da char list a string | `implode(l)` | Unisce una lista di caratteri in una stringa. | `implode([#"C", #"i", #"a", #"o"]) = "Ciao"` |
| Da (string*string) a string | `"str1" ^ "str2"` | Concatena due stringhe in una sola stringa. | `implode([#"C", #"i", #"a", #"o"]) = "Ciao"` |

## Operazioni con Tuple e Liste
| Tipo | Operazione | Istruzione | Descrizione |
| :--- | :--- | :--- | :--- |
| Tupla | Accesso | `#n (t)` | Estrae l'elemento all'indice `n` (`n` è un numero naturare che parte da 1). |
| Tupla | Accesso | `x as (a,b)` | `as` scompone la tupla "x" in due variabili "a" e "b" in modo da poter maneggiare la tupla con più semplicità. |
| Lista | Testa | `hd(L)` | Restituisce il primo elemento della lista (NOTA: non è un lista ma un singolo elemento, il suo tipo deriva dal tipo della lista). |
| Lista | Coda | `tl(L)` | Restituisce la lista privata del suo primo elemento. |
| Lista | Unione | `L1 @ L2` | Concatena due liste dello stesso tipo. |
| Lista | Inserimento | `x :: L` | Aggiunge l'elemento `x` in testa alla lista `L` (`x` deve essere dello stesso tipo della lista `L` -> NOTA: se decido che `x` è una tupla allora `L` sarà una lista di tuple. VALE ANCHE se `x`=lista allora `L`=lista di liste). |
| Lista | Vuota | `nil` o `[]` | Rappresenta la lista senza elementi. |

### Esempio dell'operatore tail (tl)
```ML
fun tail (lista) = tl(lista);
tail([1,2]);
tail([1]);
(*   tail([]);  ->  ERRORE: "tl" non funziona con liste vuote   *)
```

## if-then-else
```ML
> if 5.0<6.0 then 5 else 6;
val it = 5: int
```
```ML
> if 2=5 then true else false;
val it = false: bool
```
**NOTA:** il primo parte del if-then-else vuole una condizione bool, può essere un operatore di uguaglianza o confronto.

## Il Costrutto `case` in Standard ML
Il costrutto `case` è un'**espressione** (e non un'istruzione) che valuta un valore centrale e restituisce il risultato del primo pattern compatibile trovato.

---

### 🛠️ Regole Fondamentali sui Tipi
1. **Unicità del tipo di ritorno:** Tutti i rami di uscita (le espressioni a destra di `=>`) devono restituire **lo stesso identico tipo di dato** (es. tutte stringhe, tutti interi, ecc.).
2. **Obbligo di Esaustività:** Il pattern matching deve coprire *tutti* i possibili valori del tipo analizzato. Se mancano dei casi, il compilatore genera un warning di *match nonexhaustive* e l'esecuzione lancerà un'eccezione `Match` a runtime se incontra il valore escluso. Il carattere jolly `_` viene usato come caso di default per evitare questo problema.

---

### 🚀 Vantaggio del `case` rispetto al Pattern Matching Classico
Il pattern matching classico sulle funzioni (clausal form) ti permette di effettuare il controllo **solo sui parametri diretti** così come vengono passati alla funzione.
Il vero vantaggio del `case` è che ti permette di fare pattern matching sul **risultato di un'espressione calcolata a runtime**, anziché limitarti ai soli parametri di input.

#### Esempio Comparativo:
```sml
(* Con il pattern matching classico sei vincolato a valutare 'n' *)
fun controllaZero (0) = "È zero"
  | controllaZero (_) = "Non è zero"

(* Con il 'case' puoi calcolare un'espressione al volo (es. n + 1) e fare il match sul risultato *)
fun dayafter (n) = case (n+1) of
        1 => "Monday"
      | 2 => "Tuesday"
      | _ => "Other";
```
## Input/Output (`print` e `TextIO`)

### 🔄 Conversioni di Tipo per la `print` in SML

In Standard ML, la funzione `print` ha tipo `string -> unit`. Accetta **solo stringhe**. Per stampare altri tipi nativi, devi prima convertirli usando le funzioni delle rispettive strutture.

| Tipo di Partenza | Funzione di Conversione | Esempio di Codice | Stringa Risultante |
| :--- | :--- | :--- | :--- |
| **`int`** (Interi) | `Int.toString` | `Int.toString 42` | `"42"` |
| **`int`** (Negativi) | `Int.toString` | `Int.toString ~15` | `"~15"` *(usa la tilde)* |
| **`real`** (Reali/Float) | `Real.toString` | `Real.toString 3.14` | `"3.14"` |
| **`bool`** (Booleani) | `Bool.toString` | `Bool.toString true` | `"true"` |
| **`char`** (Caratteri) | `Char.toString` | `Char.toString #"a"` | `"a"` |
| **`char`** (Alternativa rapida) | `str` *(globale)* | `str #"x"` | `"x"` |

---

Questa tabella riassume le funzioni principali della libreria `TextIO` e della gestione del tipo `option`.

| Istruzione / Funzione | Tipo di Ritorno | Descrizione Breve | Avanza il Cursore? | Comportamento a Fine File (EOF) |
| :--- | :--- | :--- | :---: | :--- |
| **`TextIO.openIn ("file")`** | `TextIO.instream` | Apre un canale di input legato al file specificato. | — | Solleva eccezione se il file non esiste. |
| **`TextIO.closeIn (stream)`** | `unit` (`()`) | Chiude il canale di input e rilascia le risorse. | — | — |
| **`TextIO.endOfStream (stream)`** | `bool` | Controlla se si è raggiunta la fine del file. | No | Restituisce `true`. |
| **`TextIO.input (stream)`** | `string` | Legge **tutto** il contenuto rimanente del file. | Sì (fino alla fine) | Restituisce una stringa vuota `""`. |
| **`TextIO.inputN (stream, n)`** | `string` | Legge al massimo i successivi `n` caratteri. | Sì (di `n` posizioni) | Restituisce una stringa vuota `""`. |
| **`TextIO.input1 (stream)`** | `char option` | Legge un **singolo carattere**. | Sì (di 1 posizione) | Restituisce `NONE`. |
| **`TextIO.inputLine (stream)`** | `string option` | Legge una **linea intera** (carattere `\n` incluso). | Sì (fino a fine riga) | Restituisce `NONE`. |
| **`TextIO.lookahead (stream)`** | `char option` | Sbircia il carattere successivo **senza consumarlo**. | **No** | Restituisce `NONE`. |
| **`TextIO.canInput (stream, n)`** | `int option` | Verifica quanti caratteri (fino a `n`) sono pronti nel buffer. | No | Restituisce `SOME 0` o `NONE`. |
| **`valOf (opzione)`** | `'a` | Estrae il valore reale da un tipo `option` (`SOME x` $\rightarrow$ `x`). | — | Solleva l'eccezione `Option` se applicato a `NONE`. |

---

### 💡 Promemoria sui Tipi di Ritorno

Quando scrivi codice per gestire i file, ricordati di strutturare i tuoi algoritmi (o i pattern matching) dividendo le funzioni in due macro-categorie in base a come segnalano la fine del file:

*   **Funzioni basate su Stringhe (`input`, `inputN`):** 
    Identifichi la fine del file controllando se la stringa restituita è vuota (`""`).
*   **Funzioni basate su Option (`input1`, `inputLine`, `lookahead`):** 
    Sfruttano il pattern matching nativo di SML:
    ```sml
    case TextIO.inputLine(infile) of
        SOME riga => (* Elabora la riga *)
      | NONE      => (* Gestisci la fine del file *)
    ```

## Tipi e compilazione
## Operatori che vogliono lo stesso tipo:
- Comparativi ( > , >= , < , <= , = , <> ).
- Somma e prodotto.
- Then e else (non la condizione).

### Esempi sui tipi
**Quale è il tipo della seguente espressione?**
```ML
> (1.5, ("3",[4,5]));
val it = real * (string * int list)
```
```ML
> [(2,3.5), (4, 5.5), (6, 7.5)];
val it = (int * real) list
```
```ML
> ( [#"a", #"b"], [nil, [1,2,3]] );
val it = char list * int list list
```
```ML
> fun f (a:int,b,c,d,e) = if a<b then b<c else d;
val f = fn: int * int * int * bool * 'a -> bool
```
```ML
> fun f (a:int,b,c,d,e) = if b<c then d else e;
val f = fn: int * int * int * 'a * 'a -> 'a
```
```ML
> fun f (a:int,b,c,d,e) = if b<c then d+e else d*e;
val f = fn: int * int * int * int * int -> int
```
```ML
> fun f (a:int,b,c,d,e) = if b<c then a else c+d;
val f = fn: int * int * int * int * 'a -> int
```

### Esercizio 2.1 - LABORATORIO
#### Versione Corretta
```sml
fun cubo (x: real) = x * x * x;

(* Chiamata alla funzione *)
cubo(5.0);
```

> **Nota di teoria:**      
> In SML il compilatore analizza il codice in modo strettamente sequenziale, quindi fissa il tipo di una funzione nel momento esatto in cui la definisci senza poter "guardare avanti" per vedere con quali valori la chiamerai nelle righe successive.

---

#### Versione Errata
```sml
fun cubo (x) = x * x * x;
(* Genera un errore se chiamata con un real (es. 5.0) perché senza annotazioni il compilatore assume il tipo int di default *)

(* Chiamata alla funzione *)
cubo(5.0);
```

### Esercizio 3.8 - Laboratorio
> **Cosa fa?**    
> La funzione `cycle1nil` prende il primo elemento di una lista e lo sposta in coda (in fondo alla lista) sfruttando il *Pattern Matching*.

#### Codice Standard ML
```ML
(* Definizione della funzione *)
fun cycle1nil (nil: int list) = nil
  | cycle1nil (x::xs) = xs @ [x];

(* Test di esecuzione *)
cycle1nil([]);
cycle1nil([1]);
cycle1nil([1, 2, 3, 4]);
```
> **Nota sulla tipizzazione:**       
> Esplicitare il tipo della lista vuota con nil: int list è la pratica più corretta. Anche se ometterlo non è un errore di sintassi, farlo evita che il compilatore mostri warning legati all'ambiguità del tipo polimorfico.

## NOTE VARIE (da ricordare!)
- L'operatore "=" non supporta il confronto tra due numeri real -> (2.1 = 0.0) ERRORE! -> NOTA: Per questa regola, nel Pattern Matching non sono accetati parametri che sono numeri reali.
- Per scrivere un numero negativo in ML si usa la **tilde** (~) -> la tilde (~) si digita premendo: Alt Gr + ì (su Linux) OPPURE Alt + 126 "con il tastierino numerico" (su Windows).
- Le **funzioni** in ML prendono sempre UN SOLO parametro, quindi nel momento in cui gli passo 3 numeri (a,b,c) in realtà sta prendendo una tupla di 3 elementi.

## ARGOMENTI ed ESERCIZI DA RIPASSARE!!!
- Es. 4.10, 4.11, 4.12.  