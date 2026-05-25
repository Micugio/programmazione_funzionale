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
poly  
**Interrompere compilazione PolyML:**  
CTRL + C  
**Chiudere PolyML:**  
CTRL + D  
**Eseguire file .sml dentro PolyML:**  
poly < nomefile.sml  
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

## Conversione dei Tipi
| Operazione | Istruzione | Descrizione |
| :--- | :--- | :--- |
| Da int a real | `real(n)` | Converte un intero in numero reale. |
| Da real a int | `floor(r)` | Arrotonda per difetto (verso l'infinito negativo). |
| Da real a int | `ceil(r)` | Arrotonda per eccesso (verso l'infinito positivo). |
| Da real a int | `round(r)` | Arrotonda all'intero più vicino (Se la parte decimale è esattamente `.5`, arrotonda al numero pari più vicino. ES: ). |
| Da real a int | `trunc(r)` | Tronca la parte decimale (verso lo zero, ES: trunc(~3.9) = ~3) |
| Da char a int | `ord(c)` | Restituisce il codice ASCII del carattere. -> ES: ord(#"a") = 97 |
| Da int a char | `chr(n)` | Restituisce il carattere corrispondente al codice ASCII (range 0-255). |
| Da char a string | `str(c)` | Converte un singolo carattere in una stringa. |
| Da string a char list | `explode(s)` | Scompone una stringa in una lista di caratteri. -> ES: explode("Ciao") = [#"C", #"i", #"a", #"o"] |
| Da char list a string | `implode(l)` | Unisce una lista di caratteri in una stringa. -> ES: implode([#"C", #"i", #"a", #"o"]) = "Ciao" |

## Operazioni con Tuple e Liste
| Tipo | Operazione | Istruzione | Descrizione |
| :--- | :--- | :--- | :--- |
| Tupla | Accesso | `#n (t)` | Estrae l'elemento all'indice `n` (`n` è un numero naturare che parte da 1). |
| Lista | Testa | `hd(L)` | Restituisce il primo elemento della lista (NOTA: non è un lista ma un singolo elemento, il suo tipo deriva dal tipo della lista). |
| Lista | Coda | `tl(L)` | Restituisce la lista privata del suo primo elemento. |
| Lista | Unione | `L1 @ L2` | Concatena due liste dello stesso tipo. |
| Lista | Inserimento | `x :: L` | Aggiunge l'elemento `x` in testa alla lista `L` (`x` deve essere dello stesso tipo della lista `L`). |
| Lista | Vuota | `nil` o `[]` | Rappresenta la lista senza elementi. |

### Esempio dell'operatore tail (tl)
```ML
fun tail (lista) = tl(lista);
tail([1,2]);
tail([1]);
(*   tail([]);  ->  ERRORE: "tl" non funziona con liste vuote   *)
```

## Esempi
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

## Operatori che vogliono lo stesso tipo:
- Comparativi
- Somma e prodotto
- Then e else (non la condizione)

## Funzioni
Le funzioni in ML prendono sempre UN SOLO parametro, quindi nel momento in cui gli passo 3 numeri (a,b,c) in realtà sta prendendo una tupla di 3 elementi.  

## andalso, orelse e not
```ML
> 1<2 andalso not (3>4);
val it = true: bool
```
```ML
> 3<4 orelse [6<5 andalso [not [(7<>8)]]];  (* NOTA: mi basta guardare il primo confronto, è vero quindi tutto vero. *)
val it = true: bool
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