# progetto_309131

## Speed Tools
![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/logo.png)




## Mappa dell'App
![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/app_speed_tools.png)

## Campo di utilizzo dell'App

Questa app è da considerarsi un'utility che permette di calcolare le velocità della rotazione ed avanzamenti degli utensili come frese e punte, utilizzate su centri di lavoro cnc ma anche su macchine utensili manuali.

Per un corretto calcolo, è necessario considerare diverse vaiabili sia dell'utensile che del materiale da lavorare. Anche se le variabili da cosiderare sarebbero tantissime le quali possono andare dalle varie tipologie di giometrie delgi utensili, alla gamma infinita dei materiali da lavorare, ma anche dal tipo ti macchina che li utilizza. Quest'app mette a disposizione la definizione delle variabili più significative al fine di calcolare le velocità di rotazione utensile e velocita di avanzamenti più ottimali in quel contesto. Tutto sommato è da considerare un buon punto di partenza per ottenere valori appropriati, frutto della mia esperienza nel settore e spero che sia appezzata sia da un pubblico che lavora nel settore che da quel pubblico, obbista, che non ha un punto di riferimento.

L'app mette a disposizione una pagina iniziale `Home`, una pagina `List Tools`, che permette selezionare un derteminato utensile e di aggiungere altri utensili alla libreria, inoltre tramite l'effetto `Slidable`, si ha accesso al pulsante `Delete` per cancellare eventuale utensile non più utilizzato, ed il punsante `Edit`, che permette di accedere ad una nuova pagina, `Edit`, che permette di configurare le dimensioni dell'utensile, il tipo di materiale, il numero di taglenti e di attivare un sistema di raffreddamento.
Inoltre la pagina `Home`, dipone in basso, di un menù `BottomNavigationBar` che permette di ottenre informazioni sulla versione dell'app, e di settare la quantità di materiale da esportare sia radiale che lungo l'asse `Z`.

## Home Page

La pagina `Home`, nella parte in alto, mostra l'utensile selezionato con le sue caratteristiche. Nella parte in basso vi è la possibilità di selezionare il tipo di materiale tramite un menù a discesa implementato con `DropdownButton`. 
Nella parte centrale vi è un riepologo della quantità del materiale da esportare e un pulsate che permette di avviare il calcolo delle velocità che vengono riportare come velocità di rotazione in giri al minuto, di avanzamento verso l'asse `XY` in millimetri al minuto ed eventuale velocità di avanzamento rispetto l'asse `Z`.
Il pulsante che permette il calcolo viene visualizzato con 2 colorazioni diverse, il classico colore `blu` permette di fare il calcolo e i campi dei valori delle velocità non sono ancora visualizzati, verranno visualizzati solo dopo aver premuto il pulsante `Blu`. Una volta premuto il pulsante `Blu` il pulsante diverta di colore `Lilla` e nei campi delle velocità ci saranno i valori calcolati.

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/home.png)

## Materiale dell'utesile
Le varie tiplogie di materiale da lavorare sono state inserite un un tipo enumerato con i seguenti tipi:

#### Tipi di utelsile

    enum FresaEnum {
      HssCutter,
      HmICutter,
      HmRCutter,
      HmInsertTool,
      CerInsertTool,
      DiaInsertTool,
    }
    
la tipologia `HssCutter` consite un un utensile di acciaio rapido, lo stesso tipo delle punte da trapano per metalli, `HmICutter` rappresenta l'utensile in metallo duro itegrale e `FresaHmR` rappresenta l'utensile in metallo duro integrale con rivestimento. Per poi passare ad utensili ad inserti sia con inserto in metallo duro ricoperto `HmInsertTool`, che con inserto in ceramica e in diamante per `CerInsertTool` ed `DiaInsertTool`.


## Materialei da lavorare
Le varie tiplogie di materiale da lavorare anch'esse state inserite un un tipo enumerato con i seguenti tipi:

#### Tipi di materiali da lavorare
    
    enum MaterialEnum {
      Wood,
      Plastic,
      Alluminium,
      Iron,
      Steel,
      TemperateSteel,
    }
    
le tiplogie di materile da lavorare vanno dal Legno, ai materiali Plasiti, all'aluminio, nella quale tipologia è da considerare tutti que materilai non ferrosi, per passare al materiale ferroso, agli acciai ed acciai con trattamenti termici.

## SettingPage
Questa pagina nella parte in alto, mostra la figura di un'utensile ed eventuale box quadrato, che all'inizio e quasi totalmente nascosto che che si può spostare tramite uno `Slider` per impostare la quantità del materiale da esportare in percentuale `radiale` ed uno `Slider` per impostare la quantità di materile da esportare rispetto l'asse `Z`.

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/setting.png)

## InfoPage
Questa pagina oltre al logo, mostra il nome del Package, la versione dell'app ed in numero della Build ed anche il numero della versione del motore di calcolo, infine un'immagine che mostra l'uso degli utensili.
Se si scrolla la pagina, dato che la pagina è una lista di widget, si può visualizzare le varie schermate dell'app e una breve descrizione della varie schermate di navigazione.
Per prelevare le informazioni del numero di versione e di bild si è fatto uso della libreria `package_info: ^0.4.3+2`, si è fatto poi uso dell' `@override` del metodo `void initState()` che a sua volta richiama un metodo `async` dato che deve attendere le info dall'app.
Il motore di calcolo è ospitato in uno spazio di altervista in un file `php` ed ho inserito un olteriore file `php` che mi torna il numero della versione. La scelta di mettere sul web il calcolo è stata per evitare di aggiornare la app nello store solo per un aggiornamento che riguarda il calcolo. Così facendo è possibile fare delle modifice, perfezzionare il calcolo senza chiedere all'utente di aggiornare l'app. 

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/info.png)


## ListTools
Questa pagina mostra la lista delgli utensili, libreria utensili, dove in ogni cella viene mostrato l'immagine del tipo id utensile, il nome dell'utensile, e le carattristiche fisiche dell'utensile. In fondo alla pagine vi è un pulsante che permette di aggiungere unovi utensili con parametri di default.
Le celle della lista dispongono del `GestureDetector` che permetta la selezione di un utensile, il quale poi sarà l'utensile della pagina `Home`. 
Inoltre le celle dispongono di un effetto `Slidable` che trascinando la cella verso sinistra mostra un menu nascosto . 
Il menu mette a disposizione il comando `Delete` per eliminare quell'utensile, ed il pulsante `Edit` che permette di personolizzare l'utensile portandolo nella pagine Edit.
L'esempio di codice per lo Slidable è stao reperito da `https://stackoverflow.com/questions/46651974/swipe-list-item-for-more-options-flutter`

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/listPage.png)

## EditTool
Questa pagina mostra il nome dell'utensile un un campo `TextField` ed il tipo dell'immagine dell'utensile, il quale si può cambiare tramite il menu a discesa che si trova più in basso. Sotto l'immagine vi è un campo `TextField` che permette di mostrare il `diamentro` e all'occorenza si può modificare eventuele valore. Anche sul lato destro dell'utensile vi sono dei `TextField` che mostrano la lunghezza del tagliente `Sharp` che la lunghezza dell'utensile `Length`, anch'essi modificabili.
Da notare il campo `TextField` del nome dell'utensile all'occorenza di una modifica l'app mette a disposizione la tastiera classica con i tasti alfanumerici, mentre i campi `TextField` del diamentro e della lunghezza del tagliente dell'utensile mostrano la tastiera numerica con il punto decimale. Per questi campi è stata implementata una funzione che permette di controllare che i valori siano esatti, in caso contrario provvede a renderli conformi, vedi nota `validateNumber`.
Nella parte sotto l'immagine partendo da sinistra vi è un `Slider` che permette di attivare o disattivare eventuale raffraddamento.
Al centro in basso vi è un menù a discesa, `DropdownButton`, che permette di selezionare il numero di taglienti.
A destra un menù a discesa, `DropdownButton`, che permette di selezionare i tipi di materiele utensile. vedi  `Materiale dell'utesile`.

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/edit.png)


## validateNumber
la funzione `String validateNumber(String s)`, prende una stringa e restituisce una stringa. 
In un primo passaggio controlla se il separatore decimale, punto, sia il punto e non la virgola, la tastiera Apple mette a disposizione solo la virgola, mentre Android mette a disposizione sia il punto che la virgola, ma per poi traformarlo in double è necessario che sia punto, quindi lo trasforma tutto in punto. 
Successivamente viene fatto uno split per separare ad ogni punto. Questo pechè l'utente potrebbe inserire più di un punto e in tal caso mi darebbe un'errore. 
Così facendo ricompongo la stringa con la parte intera, un punto, e la prima parte decimane. 
Successivamete converto il valore in double facendo si che il numero non sia minore i `1mm`, dato che un utensile di diametro molto piccolo darebbe valori di velocità di rotazione molto più grandi e non rientrano in questo contesto lavorativo.
In seguito con `nomero_double.toStringAsFixed(2)` viene convertito da double in stringa troncando i decimanli a solo 2 unità.
Poi viene tornata.



## Logica dell'App
L'app permette di salvare i dati nel db locale tramite la liberiria `sqflite: ^1.3.2`.
Nel main vi è il `MultiProvider` che mette a disposizione a tutto l'albero dell'app `<ServiceTool>`, `<GetEngineVersion>`, `<Work>` e `<Status>`.
Il `ChangeNotifierProvider`, con `ServiceTool` preleva dal db le instanze degli utensili, nel caso non siano presenti ne inserisce uno di default, sia per pololare la lista con almeno un utensile ma anche per averne uno nella `Home Page`. 
Il `ChangeNotifierProvider`, con `GetEngineVersion` mette a disposizione un metodo per servire il numero di versione del motore di calcolo su file php.
Il `ChangeNotifierProvider`, con `Work` implementa una classe per tenere i dati delle percentuali di lavorazione e del tipo di materiale da lavorare.
Il `ChangeNotifierProvider`, con `Status` implementa una classe che tiene trccia del fatto che il calcolo sia già stato effettuato per quell'utensile e tipologia di materiale e lavorazione o non sia ancora tato effettuato. Per evitare di avere valori di velocità non in linea quando si cambia i materiali, urensile o lavorazioni.

Quindi all'avvio dell'app viene istanziato un'oggetto `Tool` e inserito nel db. La classe `Tool extends ChangeNotifier` che a sua volta mette a disposizione di chi ascolta eventuli nuovi inserimenti.
La pagina `Home` ha quindi un tool da mostrare e la relativa `ListTools` ha il primo utensile.
Dalla Lista Tool si possono inserire altri utensili e ad ongni nuovo utensile viene annotato l'aggiornamento e rigenerata la lista Tool.
Dalla pagina ListTools si può selezionare un utensile e modificarlo in `EditPage`. Anche quì quando vengono fatte le modifiche e premuto il pulsante `salva` le modifiche aggiornano la classe `ServiceTool` ed il `db`.
 
La pagina Setting `SettingPage`, ulilizza i dato della classe `work` che si aggiornano in base alle preferenze delle lavorazioni e tali dati verranno poi utilizzati per il calcolo delle velocità utensile.

Una volta definito l'utensile, la lavorazione ed il tipo di materiale da lavorare dalla pagina `Home` si può avviare il calcolo tramite il pulsante `Blu` `Salva`.
Il calcolo viene fatto da una risorsa web. Per l'occasione ho implementato una pagina `php` in uno spazio di `Altervista`, che avevo già, alla quale vengono passate tramite una chiamanta `POST` tutte le variabili sin ora settate. La pagina `php` ritorna una stringa con tre numeri interi separati da virgola.
Per rimanere in tema avrei dovuto passare in `JSON` alla pagina `php` dal quale ricavavo le variabili, ffacevo il calcolo, e rigeneravo un `JSON` che una volta ricevuto ricavavo le variabili. Ma mi è sambrato uno spreco di risorve così lo trovo più performate performante anche se meno portabile.
Una volta ricevuto il corpo, `response.body`, faccio `split`
      
    final result = response.body.split(','); 
    
e popolo i campi dei valori delle velocità.

Il calcolo fatto dalla pagina `php` in parte sono calcoli `lineari`, come il diametro dell'utensile è un valore lineare dato che la velocità decresce con l'aumentare del diamentro ed aumenta se il diametro diminuisce, ma rimane comunque lineare. 
Valori come la percentuale radiale dell'utensile, posso dire che mediamente l'avanzamento si aggira su `0.05mm` ed `0.1mm` per tagliente, ma se la percentuale è molto piccola, `5%` o `10%`, posso andare il doppio di quando esporto il `50%`, ma tra il `50%` ed il `100%` non ci sarà la stessa proporzione. Quindi mi sono fatto un grafico accettabile dell'andamento tra percentuale radiale ed avenzamento, poi considerando il range di `[5%, 100%]`, ed uno punto intermendio al `50%`. Usando questi tre valori discreti ho poi creato una funzione contiuna che mi permette di calcolare in modo esatto la velocità per ogni unumero percentule. Per il calcolo ho usato una funzione di secondo grado, non lineare.
Per avere i giusti valori senza fare un sistema manualmente ho utilizzato questa risorsa web 

    https://www.mathepower.com/it/sistemiequazionilineari.php 

ma dopo diversi tentativi a volte ricevevo valori non sempe conformi allora ho fatto uso di Python prendendo esempio da questa risorsa 

    https://computer4dummy.altervista.org/programmazione-guide-alla-programmazione/python-data-analisi/numpy-per-python/risolvere-un-sistema-lineare/. 
Risoluzione equazioni di secondo grado passante per 3 punti: 
    
    https://www.lezionidimatematica.net/Parabola/lezioni/parabola_11.htm

Poi ho implementato il tutto usando Colab.

    # importo le librerie sia per i caloli matriciali che per il plot glafico
    import numpy as np
    import matplotlib.pyplot as plt

    # definisco la matrice con i valori di input
    M1 = np.array([[1,1,1],[25,5,1], [100, 10, 1]])
    # definisco il vettore con i dati di output
    M2 = np.array([0.2, 0.1, 0.05])

    # stampo la matrice
    print(M1)
    [[  1   1   1]
    [ 25   5   1]
    [100  10   1]]
    
    # stampo il vettore
    print(M2)
    [0.2  0.1  0.05]
    
    # ottengo i valori a b c
    np.linalg.solve(M1, M2)
    
    >>> array([ 0.00166667, -0.035     ,  0.23333333])
    
    x = np.array([0,1,2,3,4,5,6,7,8,9,10])
    y = np.array([])
    
    for i in range(len(x)):
    y = np.append(y, ((result[0] * x[i] * x[i]) + (result[1] * x[i]) + result[2]))

    plt.scatter(x, y)
    

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/grafico1.png)

altre forme di funzioni non lineari che approssimano molto il calcolo le ho ottenute cosi
       
    x = np.array([0,1,2,3,4,5,6,7,8,9,10])
    yd = np.array([])

    def scaleSharp(n):
        return (1/n + 1)

    for i in x:
        yd = np.append(yd, scaleSharp(x[i]))
 
    plt.scatter(x, yd)

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/grafico2.png)


## rotazione dello schermo bloccata 
Dato che li layout dell'App è stata ottimizzata per lo scermo verticale ho dovuto provvedere a bloccare la rotazione dello schermo

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
  	

    
    
## Riepilogo dei link
Slidable è stao reperito da 
    `https://stackoverflow.com/questions/46651974/swipe-list-item-for-more-options-flutter`
   
Per costruire funzioni non lineari
   `https://www.mathepower.com/it/sistemiequazionilineari.php`
   `https://computer4dummy.altervista.org/programmazione-guide-alla-programmazione/python-data-analisi/numpy-per-python/risolvere-un-sistema-lineare/`
   
   
   
   
   
   
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
   
