# progetto_309131

Speed Tools

## Campo di utilizzo dell'App

Questa app è da considerarsi un'utiliti che permette di calcolare le velocità della rotazione ed avanzamenti degli utensili come frese e punte, utilizzate su centri di lavoro cnc ma anche su macchine utensili manuali.

Per un corretto calcolo, è necessario considerare diverse vaiabili sia dell'utensile che del materiale da lavorare. Le variabili da cosiderare sarebbero tantissime che possono andare dalle varie tipologie di giometrie delgi utensili, alla gamma infinita dei materiali da lavorare, ma anche dal tipo ti macchina che li utilizza. Tutto sommato è da considerare un buon punto di partenza per assegnare i giusti valori di velocità giri utensile ed avanzamenti. Data la mia esperienza nel settore spero che sia appezzata da quel pubblico che non ha un punto di riferimento.

L'app mette a disposizione una pagina iniziale "Home", una pagina "List Tools", che permette selezionare un derteminato utensile e di aggiungere altri utensili alla libreria degli utensili, inoltre tramite l'effetto "Slidable", si ha accesso al pulsante "Delete" per cancellare eventuale utensile non più utilizzato, ed il punsante "Edit", che permette di accedere ad una nuova pagina che permette di configurare le dimensioni dell'utensile, il tipo di materiale, il numero di taglenti e di attivare un sistema di raffreddamento.
Inoltre la pagina Home, dipone di un menù in basso "BottomNavigationBar" che permette di ottenre informazioni sulla versione dell'app, e di settare la quantità di materiale da esportare sia radiale che lungo l'asse Z.
La pagina Home, nella parte in alto, mostra l'utensile selezionato con le sue caratteristiche. Nella parte in basso vi è la possibilità di selezionare il tipo di materiale tramite un menù a discesa. Nella parte centrale vi è un riepologo della quantità del materiale da esportare e un pulsate che permette di avviare il calcolo delle velocità che vengono riportare come velocità di rotazione in giri al minuto, di avanzamento verso l'asse XY in millimetri al minuto ed eventuale velocità di avanzamento rispetto l'asse Z.

## Materiale dell'utesile
Le varie tiplogie di materiale da lavorare sono state inserite un un tipo enumerato con i seguenti tipi:

#### [FresaHss, FresaHm, FresaHmR, InsertToolHm, InsertToolCer, InsertToolDia]
la tipologia FresaHss consite un un utensile di acciaio rapido, lo stesso tipo delle punte da trapano per metalli, FresaHm rappresenta l'utensile in metallo duro itegrale e FresaHmR rappresenta l'utensile in metallo duro integrale con rivestimento. Per poi passare ad utensili ad inserti sia con inserto in metallo duro ricoperto InsertHm, che con inserto in ceramica e in diamante per InsertToolCer ed InsertToolDia.


## Materialei da lavorare
Le varie tiplogie di materiale da lavorare anch'esse state inserite un un tipo enumerato con i seguenti tipi:

#### [Wood, Plastic, Alluminium, Iron, Stell, Temperate Stell]
le tiplogie di materile da lavorare vanno dal Legno, ai materiali Plasiti, all'aluminio, nella quale tipologia è da considerare tutti que materilai non ferrisi, per passare al materiale ferroso, agli acciai ed acciai con trattamenti termici.

## SettingPage
Questa pagina nella parte mostra la figura di un'utensile ed eventuale box quadrato, che all'inizio e quasi totalmente nascosto che che si può spostare tramite uno "Slider" per impostare la quantità del materiale da esportare in percentuale radiale ed uno "Slider" per impostare la quantità di materile da esportare rispetto l'asse Z.

## InfoPage
Questa pagina mostra mostra la versione dell'app ed in numero della Build oltre al logo ed un'immagine che mostra l'uso degli utensili.

## ListTools
Questa pagina mostra la lista delgli utensili, libreria utensili, dove in ogni cella viene mostrato l'immagine dell'utensile cossispondente, il nome dell'utensile, e le carattristiche fisiche dell'utensile. In fondo alla pagine vi è un pulsante che permette di aggiungere unovi utensili con parametri di default.
Le celle della lista dispongono del "GestureDetector" che permetta la selezione di una cella dove l'utensile al suo interno rarà quello che poi ritroviamo nella pagina "Home". Inoltre le celle dispongono di un effetto "Slidable" che permette di mostrate un menu nascosto trascinando la cella verso sinistra. Il menu mette a disposizione il comando "Delete" per eliminare quell'utensile, ed il pulsante "Edit" che permette di personolizzare l'utensile portandolo nella pagine Edit.

## EditTool
Questa pagina mostra il nome dell'utensile e la sua immagine, la quale si può cambiare nel caso lo si vuole cambiare tramite il menu a discesa che si trova più in basso. Sotto l'immagine vi è un campo "TextField" che permette di mostrare il diamentro e all'occorenza di modificare eventuele valore. Anche sul lato destro dell'utensile vi sono dei "TextField" che mostrano la lunghezza del tagliente "Flut" che la lunghezza dell'utensile, anch'essi modificabili.
Da notare il campo "TextField" del nome dell'utensile all'occorenza di una modifica l'app mette a disposizione la tastiera classica con i tasti alfanumerici, mentre i campi "TextField" del diamentro e della lunghezza del tagliente e dell'utensile mostrano la tastiera numerica con il punto decimale. Per questi campi è stata implementata una funzione che permette di controllare che i valori siano esatti, in caso contrario provvede a renderli conformi, vedi nota "validateNumber".
Nella parte sotto l'immagine partendo da sinistra vi è un "Slider" che permette di attivare o disattivare eventuale raffraddamento.
Al centro in basso vi è un menù a discesa, "DropdownButton", che permette di selezionare il numero di taglienti.
A destra un menù a discesa, "DropdownButton", che permette di selezionare i tipi di materiele utensile. vedi  "Materiale dell'utesile".


## validateNumber
la funzione "String validateNumber(String s)", prende una stringa e restituisce una stringa. 
In un primo passaggio controlla se il separatore decimale, punto, sia il punto e non la virgola, dato che la tastiera Apple mette a disposizione solo la virgola, mentre Android mette a disposizione sia il punto che la virgola, e lo trasforma tutto in punto. 
Successivamente viene fatto uno split per separare ad ogni punto. Questo pechè l'utente potrebbe inserire più di un punto e in tal caso mi darebbe un'errore. 
Così facendo ricompongo la stringa con la parte intera, un punto, e la parte decimane. 
Successivamente viene convertito da stringa in double al fine di fare poi una successiva conversione da double in stringa troncando i decimanli a solo 2 unità.
Poi viene tornata.

Nell'implementazione dell'app è stato inserito un "DropdownButton" menù a discesa per selezionare il tipo di materiale da lavorare 


## Logica dell'App
L'app permette di salvare i dati nel db locale tramite "sqflite: ^1.3.2".
Nel main vi è il MultiProvider che mette a disposizione a tutto l'albero dell'app <ServiceTool> e <Work>, tramite "ChangeNotifierProvider", dove ServiceTool implementa anche il primo utensile. Un utensile deve essere comunque sempre presente.
Quindi all'avvio dell'app viene istanziato un'oggetto Tool e inserito nel db. La classe Tool extends ChangeNotifier che a sua volta mette a disposizione di chi ascolta eventuli nuovi inserimenti.
La pagina Home ha quindi un tool da mostrare e la relativa ListTools ha il primo utensile.
Dalla Lista Tool si possono inserire altri utensili e ad ongni nuovo utensile viene annotato l'aggiornamento e rigenerata la lista Tool.
Dalla pagina ListTools si può selezionare un utensile e modificarlo in EditPage. Anche quì quando vengono fatte le modifiche e premuto il pulsante salva le modifiche aggiornano la classe ServiceTool ed il db.
 
La pagina Setting "SettingPage", ulilizza i dato della classe "work" che si aggiornano in base alle preferenze delle lavorazioni e tali dati verranno poi utilizzati per il calcolo delle velocità utensile.

Una volta definito l'utensile, la lavorazione ed il tipo di materiale da lavorare dalla pagina Home si può avviare il calcolo.
Il calcolo viene fatto da una risorsa web. Per l'occasione ho implementato una pagina php in uno spazio di Altervista, che avevo già, alla quale vengono passate tramite una chiamanta POST tutte le variabili sin ora settate. La pagina php ritorna una stringa con tre numeri interi separati da virgola.
Per rimanere in tema avrei dovuto trasformare in JSON per ricavare i dati da un dizionario, ma mi sembrava un calcolo superfluo e mi è sembrato più performante.
Una volta ricevuto il corpo, "response.body", faccio split, "final result = response.body.split(',');" e popolo i campi dei valori delle velocità.

Il calcolo fatto dalla pagina php in parte sono calcoli lineari, come il diametro dell'utensile è un valore lineare dato che la velocità decresce con l'aumentare del diamentro ed aumenta se il diametro diminuisce, ma rimane comunque lineare. 
Valori come la percentuale radiale dell'utensile, posso dire che mediamente l'avanzamento si aggira su 0.05mm - 0.1mm per tagliente, ma se la percentuale è molto piccola, 5% o 10%, posso andare il doppio di quando esporto il 50%, ma tra il 50% ed il 100% non ci sarà la stessa proporzione. Quindi mi sono fatto un grafico accettabile dell'andamento tra percentuale radiale ed avenzamento, poi ho preso un punto al massimo, 100%, un al minimo, 5%, ed uno intermendio al 50%. Usando questi tre valori discreti ho poi creato una funzione contiuna che mi permette di calcolare in modo esatto la velocità per ogni unumero percentule. Per il calcolo ho usato una funzione di secondo grado, non lineare, dove per avere i giusti valori senza fare un sistema manualmente ho utilizzato questa risorsa web https://www.mathepower.com/it/sistemiequazionilineari.php ma dopo diversi tentativi a volte dava valori non sempe esatti allora ho fatto uso di Python prendendo esempio da questa risorsa https://computer4dummy.altervista.org/programmazione-guide-alla-programmazione/python-data-analisi/numpy-per-python/risolvere-un-sistema-lineare/. 
Risoluzione equazioni di secondo grado passante per 3 punti: https://www.lezionidimatematica.net/Parabola/lezioni/parabola_11.htm

Poi ho implementato il tutto usando Colab.

import numpy as np

import matplotlib.pyplot as plt

M1 = np.array([[1,1,1],[25,5,1], [100, 10, 1]])

M2 = np.array([0.2, 0.1, 0.05])

print(M1)

print(M2)

np.linalg.solve(M1, M2)

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/FresaHm.png)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## rotazione dello schermo bloccata 
per bloccare la rotazione dello schermo si è aggiunta nel main 
 SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  
  e per far si che funzioni anche in iOS si è modificato il file info.plist eliminando le orientazioni non compatibili 
  	<key>UISupportedInterfaceOrientations</key>
  	<array>
  		<string>UIInterfaceOrientationPortrait</string>
  		<string>UIInterfaceOrientationLandscapeLeft</string>
  		<string>UIInterfaceOrientationLandscapeRight</string>
  	</array>
  	
  	
## ToDo
    sistemare il calcolo delle velocità nel lato web
    convalidare i numeri decimali e approssimarli a 2 decimali
    
    
## link
   https://stackoverflow.com/questions/46651974/swipe-list-item-for-more-options-flutter
   
   per costruire funzioni non lineari
   https://www.mathepower.com/it/sistemiequazionilineari.php
   https://computer4dummy.altervista.org/programmazione-guide-alla-programmazione/python-data-analisi/numpy-per-python/risolvere-un-sistema-lineare/
   
