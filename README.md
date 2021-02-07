# progetto_309131
## Paolo Capellacci
## Matricola 309131
## nome dell'app SpeedTools

![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/logo.png)


## Mappa dell'App
![alt text](https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/app_speed_tools.png)

## Campo di utilizzo dell'App

Questa app è da considerarsi un'utility che permette di calcolare le velocità della rotazione ed avanzamenti degli utensili come frese e punte, utilizzate su centri di lavoro cnc ma anche su macchine utensili manuali.

Per un corretto calcolo, è necessario considerare le diverse vaiabili sia dell'utensile che del materiale da lavorare. Le variabili possibili sarebbero tantissime poichè dipendono non solo dal tipo di macchinache si utilizza, ma anche dalle arie giometrie degli utensili da utilizzare e dalla gamma praticamente infinita dei materiali che si possono lavorare. Quest'app mette a disposizione la definizione delle variabili più significative, al fine di calcolare le velocità di rotazione utensile e le velocità di avanzamenti più ottimali in quel contesto. Tutto sommato è da considerare un buon punto di partenza per ottenere valori appropriati, frutto della mia esperienza nel settore, e spero che sia appezzata sia da un pubblico che lavora nel settore che da quello obbista che non ha un punto di riferimento.

L'app mette a disposizione una pagina iniziale `Home` che dispone, in basso, di un menù `BottomNavigationBar` che permette di ottenere informazioni sulla versione dell'app e di settare la quantità di materiale da esportare, sia radiale che lungo l'asse `Z`. Mentre la pagina `List Tools` permette di selezionare un derteminato utensile e di aggiungere altri utensili alla libreria. Inoltre tramite l'effetto `Slidable`, si ha accesso al pulsante `Delete` per cancellare un eventuale utensile non più utilizzato, ed il punsante `Edit`, che permette di accedere ad una nuova pagina, `Edit`, che permette di configurare le dimensioni dell'utensile, il tipo di materiale, il numero di taglienti e di attivare un sistema di raffreddamento.

## Home Page

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/home.png" width="200">

La pagina `Home`, nella parte in alto, mostra l'utensile selezionato con le sue caratteristiche. Nella parte in basso vi è la possibilità di selezionare il tipo di materiale tramite un menù a discesa implementato con `DropdownButton`. 
Nella parte centrale vi è un riepologo della quantità del materiale da esportare e un pulsate che permette di avviare il calcolo delle velocità che vengono riportare come velocità di rotazione in giri al minuto, di avanzamento verso l'asse `XY` in millimetri al minuto ed eventuale velocità di avanzamento rispetto l'asse `Z`.
Il pulsante che permette il calcolo viene visualizzato con 2 colorazioni diverse, il classico colore `blu` permette di fare il calcolo (i campi dei valori delle velocità non sono ancora visualizzati, verranno visualizzati solo dopo aver premuto il pulsante `Blu`). Una volta premuto il pulsante `Blu` , il pulsante diverta di colore `Lilla` e nei campi delle velocità ci saranno i valori calcolati.


## Materiale dell'utesile
Le varie tiplogie di materiale da lavorare sono state inserite in un tipo enumerato con i seguenti tipi:

#### Tipi di utelsile

    enum FresaEnum {
      HssCutter,
      HmICutter,
      HmRCutter,
      HmInsertTool,
      CerInsertTool,
      DiaInsertTool,
    }
    
la tipologia `HssCutter` consite in un utensile di acciaio rapido, lo stesso tipo delle punte da trapano per metalli, `HmICutter` rappresenta l'utensile in metallo duro integrale e `FresaHmR` rappresenta l'utensile in metallo duro integrale con rivestimento. Si passa poi ad utensili ad inserti, sia con inserto in metallo duro ricoperto, `HmInsertTool`, che con inserto in ceramica e in diamante, rispettivamente `CerInsertTool` ed `DiaInsertTool`.


## Materiali da lavorare
Anche le varie tiplogie di materiale da lavorare sono state inserite in un tipo enumerato con i seguenti tipi:

#### Tipi di materiali da lavorare
    
    enum MaterialEnum {
      Wood,
      Plastic,
      Alluminium,
      Iron,
      Steel,
      TemperateSteel,
    }
    
le tiplogie di materiale da lavorare vanno dal legno, ai materiali plasitici, all'aluminio, nella quale tipologia è da considerare tutti quei materilai non ferrosi, per poi passare al materiale ferroso, agli acciai ed acciai con trattamenti termici.

## SettingPage

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/setting.png" width="200">

Questa pagina nella parte in alto mostra la figura di un utensile ed eventuale box quadrato, che all'inizio è quasi totalmente nascosto e che si può spostare tramite uno `Slider` per impostare la quantità del materiale da esportare in percentuale `radiale` ed uno `Slider` per impostare la quantità di materiale da esportare rispetto l'asse `Z`.


## InfoPage

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/info.png" width="200">

Questa pagina oltre al logo, mostra il nome del Package, la versione dell'app ed in numero della Build ed anche il numero della versione del motore di calcolo, infine un'immagine mostra l'uso degli utensili.
Se si scrolla la pagina, dato che la pagina è una lista di widget, si possono visualizzare le varie schermate dell'app e una breve descrizione della varie schermate di navigazione.
Per prelevare le informazioni del numero di versione e di build si è fatto uso della libreria `package_info: ^0.4.3+2`, si è fatto poi uso del `@override` del metodo `void initState()` che a sua volta richiama un metodo `async` dato che deve attendere le info dall'app.
Il motore di calcolo è ospitato in uno spazio di altervista in un file `php` ed ho inserito un ulteriore file `php` che mi torna il numero della versione. La scelta di mettere sul web il calcolo è stata per evitare di aggiornare la app nello store solo per un aggiornamento che riguarda il calcolo. Così facendo è possibile fare delle modifiche e perfezzionare il calcolo senza chiedere all'utente di aggiornare l'app. 



## ListTools

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/listPage.png" width="200">

Questa pagina mostra la lista degli utensili, libreria utensili, dove in ogni cella viene mostrata l'immagine del tipo di utensile, il suo nome, e le sue carattristiche fisiche. In fondo alla pagine vi è un pulsante che permette di aggiungere nuovi utensili con parametri di default.
Le celle della lista dispongono del `GestureDetector` che permetta la selezione di un utensile, che poi sarà l'utensile mostrato nella pagina `Home`. 
Inoltre le celle dispongono di un effetto `Slidable` che, trascinando la cella verso sinistra, mostra un menù nascosto . 
Il menù mette a disposizione il comando `Delete` per eliminare quell'utensile, ed il pulsante `Edit` che permette di personolizzare l'utensile portandolo nella pagine Edit.
L'esempio di codice per lo Slidable è stato reperito da `https://stackoverflow.com/questions/46651974/swipe-list-item-for-more-options-flutter`



## EditTool

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/edit.png" width="200">

Questa pagina mostra il nome dell'utensile in un campo `TextField` ed il tipo dell'immagine dell'utensile, il quale si può cambiare tramite il menu a discesa che si trova più in basso. Sotto l'immagine vi è un campo `TextField` che permette di mostrare il `diamentro` e all'occorenza si può modificare tale valore. Anche sul lato destro dell'utensile vi sono dei `TextField` che mostrano la lunghezza del tagliente `Sharp` e la lunghezza dell'utensile `Length`, anch'essi modificabili.
Da notare che in caso di modifica al campo `TextField` con il nome dell'utensile l'app mette a disposizione la tastiera classica con i tasti alfanumerici, mentre per i campi `TextField` del diamentro e della lunghezza del tagliente dell'utensile viene mostrata la tastiera numerica con il punto decimale. Per questi campi è stata implementata una funzione che permette di controllare che i valori siano esatti, in caso contrario provvede a renderli conformi, si veda la nota `validateNumber`.
Nella parte sotto l'immagine partendo da sinistra vi è un `Slider` che permette di attivare o disattivare eventuale raffraddamento.
Al centro in basso vi è un menù a discesa, `DropdownButton`, che permette di selezionare il numero di taglienti.
A destra un menù a discesa, `DropdownButton`, permette di selezionare i tipi di materiale dell'utensile. Si veda  `Materiale dell'utesile`.




## validateNumber
La funzione `String validateNumber(String s)` prende una stringa e restituisce una stringa. 
In un primo passaggio controlla se il separatore decimale è il punto e non la virgola (la tastiera Apple mette a disposizione solo la virgola, mentre Android mette a disposizione sia il punto che la virgola, ma per poi trasformarlo in double è necessario che sia il punto) e in caso trasforma tutto in punto. 
Successivamente viene fatto uno split per separare ad ogni punto. Questo pechè l'utente potrebbe inserire più di un punto e in tal caso  darebbe errore. 
Così facendo  ricompone la stringa con la parte intera, un punto, e la prima parte decimale. 
Successivamete converte il valore in double facendo si che il numero non sia minore i `1mm`, dato che un utensile di diametro molto piccolo darebbe valori di velocità di rotazione molto più grandi che non rientrerebbero in questo contesto lavorativo.
In seguito con `numero_double.toStringAsFixed(2)` viene convertito da double in stringa troncando i decimanli a solo 2 unità.
Infine la stringe viene tornata.



## Logica dell'App


<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/speed_tools.png" >

L'app permette di salvare i dati nel db locale tramite la liberiria `sqflite: ^1.3.2`.
Nel main vi è il `MultiProvider` che mette a disposizione a tutto l'albero dell'app `<ServiceTool>`, `<GetEngineVersion>`, `<Work>` e `<Status>`.
Il `ChangeNotifierProvider`, con `ServiceTool` preleva dal db le instanze degli utensili, nel caso non siano presenti ne inserisce una di default, sia per pololare la lista con almeno un utensile ma anche per averne uno nella `Home Page`. 
Il `ChangeNotifierProvider` con `GetEngineVersion` mette a disposizione un metodo per servire il numero di versione del motore di calcolo su file php.
Il `ChangeNotifierProvider` con `Work` implementa una classe per tenere i dati delle percentuali di lavorazione e del tipo di materiale da lavorare.
Il `ChangeNotifierProvider` con `Status` implementa una classe che controlla se il calcolo delle velocità nella pagina Home è già stato effettuato per quell'utensile e la tipologia di materiale e lavorazione selezionata, o se non è ancora stato effettuato. Per evitare di avere valori di velocità non in linea quando si cambiano i materiali, utensile o lavorazioni.

Quindi all'avvio dell'app viene istanziato un'oggetto `Tool` e inserito nel db. La classe `Tool extends ChangeNotifier` che a sua volta mette a disposizione di chi ascolta eventuli nuove modifiche.
La `ListTools` ha un primo utensile di default, che è anche il tool mostrato nella pagina `Home`.
Dalla Lista Tool si possono inserire altri utensili e ad ogni nuovo utensile viene annotato l'aggiornamento e rigenerata la lista Tool.
Dalla pagina ListTools si può selezionare un utensile e modificarlo in `EditPage`. Anche qui quando vengono fatte le modifiche e premuto il pulsante `salva` le modifiche aggiornano la classe `ServiceTool` ed il `db`.
 
La pagina Setting `SettingPage`, ulilizza i dati della classe `work` che si aggiornano in base alle preferenze delle lavorazioni e tali dati verranno poi utilizzati per il calcolo delle velocità utensile. Questi dati vengono poi salvati nelle `SharedPreferences` in modo di riavere quei valori al successivo riavvio.

Una volta definito l'utensile, la lavorazione ed il tipo di materiale da lavorare dalla pagina `Home` si può avviare il calcolo tramite il pulsante `Blu` `Salva`.
Il calcolo viene fatto da una risorsa web. Per l'occasione ho implementato una pagina `php` in uno spazio di `Altervista`, che avevo già, alla quale vengono passate tramite una chiamanta `POST` tutte le variabili sin ora settate. La pagina `php` ritorna una stringa con tre numeri interi separati da virgola.
Per rimanere in tema avrei dovuto passare in `JSON` alla pagina `php` dalla quale ricavavo le variabili, facevo il calcolo, e rigeneravo un `JSON` che una volta ricevuto ricavavo le variabili. Ma mi è sambrato uno spreco di riserve, così lo trovo più performante anche se meno portabile.
Una volta ricevuto il corpo, `response.body`, faccio `split`
      
    final result = response.body.split(','); 
    
e popolo i campi dei valori delle velocità.

Il calcolo fatto dalla pagina `php` in parte è costituito da calcoli `lineari`, come il diametro dell'utensile è un valore lineare dato che la velocità decresce con l'aumentare del diamentro ed aumenta se il diametro diminuisce. 
Per valori come la percentuale radiale dell'utensile, posso dire che mediamente l'avanzamento si aggira su `0.05mm` ed `0.1mm` per tagliente, ma se la percentuale è molto piccola, `5%` o `10%`, posso andare il doppio di quando esporto il `50%`, ma tra il `50%` ed il `100%` non ci sarà la stessa proporzione. Quindi mi sono fatto un grafico accettabile dell'andamento tra percentuale radiale ed avanzamento, considerando il range di `[5%, 100%]` ed uno punto intermendio al `50%`. Usando questi tre valori discreti ho poi creato una funzione contiuna che mi permette di calcolare in modo esatto la velocità per ogni numero percentule. Per il calcolo ho usato una funzione di secondo grado, non lineare.
Per avere i giusti valori senza fare un sistema manualmente ho utilizzato questa risorsa web 

    https://www.mathepower.com/it/sistemiequazionilineari.php 

ma dopo diversi tentativi a volte ricevevo valori non sempe conformi, allora ho fatto uso di Python prendendo esempio da questa risorsa: 

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
    

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/grafico1.png" width="400">


Altre forme di funzioni non lineari che approssimano molto il calcolo le ho ottenute così:
       
    x = np.array([0,1,2,3,4,5,6,7,8,9,10])
    yd = np.array([])

    def scaleSharp(n):
        return (1/n + 1)

    for i in x:
        yd = np.append(yd, scaleSharp(x[i]))
 
    plt.scatter(x, yd)

<img src="https://github.com/paolo-capellacci/progetto_309131/blob/main/assets/images/redame/grafico2.png" width="400">



## rotazione dello schermo bloccata 
Dato che il layout dell'App è stato ottimizzato per lo schermo verticale ho dovuto provvedere a bloccare la rotazione dello schermo,

    void main() {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      ).then((val) {
        runApp(MyApp());
      });
    }
    
 ed aggiungere nel file AndroidManifest.xml
 
    <manifest xmlns:android="http://schemas.android.com/apk/res/android"
    ...
    ...
    
    <application
        ...
        ...
        <activity
            ...
            ...
            android:screenOrientation="portrait"
            ...
            ...
  
  e per far si che funzioni anche in iOS si è modificato il file info.plist eliminando le orientazioni non compatibili: 
    
    key>UISupportedInterfaceOrientations</key>
  	    <array>
  		    <string>UIInterfaceOrientationPortrait</string>
  		    <string>UIInterfaceOrientationLandscapeLeft</string>
  		    <string>UIInterfaceOrientationLandscapeRight</string>
  	    </array>
  	

    
    
#### Riepilogo dei link
Slidable è stato reperito da 
    `https://stackoverflow.com/questions/46651974/swipe-list-item-for-more-options-flutter`
   
#### Per costruire funzioni non lineari
   `https://www.mathepower.com/it/sistemiequazionilineari.php`
   `https://computer4dummy.altervista.org/programmazione-guide-alla-programmazione/python-data-analisi/numpy-per-python/risolvere-un-sistema-lineare/`
   
   
#### Rotazione dello schermo
    https://qastack.it/programming/49418332/flutter-how-to-prevent-device-orientation-changes-and-force-portrait
   





   
