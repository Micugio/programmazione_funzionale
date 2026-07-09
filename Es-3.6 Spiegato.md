## Analisi esecuzione dell'esercizio 3.6 in cui la funzione "maxList", data una lista di stringhe, deve trovare la stringa più grande della lista.

Ecco l'analisi passo-passo di come la funzione "maxList" elabora la lista: `["a", "abc", "ab", "a"]`.

Vediamo come il meccanismo a eliminazione diretta gestisce i confronti lessicografici fino alla fine.

---

### **Passo 1**

* **Lista attuale `L`:** `["a", "abc", "ab", "a"]`
* **Verifica caso base:** `tl(L)` è `["abc", "ab", "a"]` (non vuoto).
* **Confronto:** `hd(L) > hd(tl(L))` $\rightarrow$ `"a" > "abc"`?
* **Falso.** `"abc"` viene dopo `"a"` nell'ordine del dizionario.


* **Azione:** Si attiva l'ultimo ramo `else`. La prima `"a"` viene scartata e la funzione viene richiamata sulla coda della lista.
* **Prossima chiamata:** `maxList (["abc", "ab", "a"])`

---

### **Passo 2**

* **Lista attuale `L`:** `["abc", "ab", "a"]`
* **Verifica caso base:** `tl(L)` è `["ab", "a"]` (non vuoto).
* **Confronto:** `hd(L) > hd(tl(L))` $\rightarrow$ `"abc" > "ab"`?
* **Vero.** Condividono il prefisso `"ab"`, ma `"abc"` ha un carattere in più, quindi è maggiore.


* **Azione:** Si attiva il ramo `then maxList(hd(L) :: tl(tl(L)))`.
* `hd(L)` è `"abc"`
* `tl(tl(L))` estrae la coda di `["ab", "a"]`, che è `["a"]`
* La nuova lista unisce il vincitore con il resto: `["abc", "a"]`


* **Prossima chiamata:** `maxList (["abc", "a"])`

---

### **Passo 3**

* **Lista attuale `L`:** `["abc", "a"]`
* **Verifica caso base:** `tl(L)` è `["a"]` (non vuoto).
* **Confronto:** `hd(L) > hd(tl(L))` $\rightarrow$ `"abc" > "a"`?
* **Vero.** Stessa logica di prima: `"abc"` estende la stringa `"a"`, quindi vince il confronto.


* **Azione:** Si attiva di nuovo il ramo `then maxList(hd(L) :: tl(tl(L)))`.
* `hd(L)` è `"abc"`
* `tl(tl(L))` prende la coda di `["a"]`, che è vuota (`nil`)
* La nuova lista diventa semplicemente `["abc"]`


* **Prossima chiamata:** `maxList (["abc"])`

---

### **Passo 4 (Caso Base)**

* **Lista attuale `L`:** `["abc"]`
* **Verifica caso base:** `tl(L)` è `nil` (la lista è rimasta con un solo elemento).
* **Vero.** La condizione iniziale `if tl(L) = nil` è soddisfatta.


* **Azione:** La funzione termina e restituisce la testa della lista attuale.

---

### **Risultato Finale**

```sml
val it = "abc" : string

```

Rispetto all'esecuzione precedente, qui `"abc"` non ha trovato una stringa come `"c"` a sbarrargli la strada, quindi è riuscito a mantenere il titolo di "massimo" fino all'ultimo caso base.