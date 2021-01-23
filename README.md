# progetto_309131

Speed Tools

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