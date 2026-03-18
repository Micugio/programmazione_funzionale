# Programmazione Funzionale

## Git
git clone -> clona repository sulla macchina locale (Username: Micugio, Password: Generare token temporaneo su https://github.com/settings/tokens).  
git add . -> aggiunge tutte le modifiche effettuate nel repository alle modifiche che verrano salvate.  
git commit -m "<nome commit>" -> salva tutte le modifiche sul repository locale.  
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

## Tipi



### Esempi
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

## Funzioni
Le funzioni in ML prendono sempre UN SOLO parametro, quindi nel momento in cui gli passo 3 numeri (a,b,c) in realtà sta prendendo una tupla di 3 elementi.  
