import 'package:flutter/material.dart';
import 'package:valorant_app/ui/screens/details_scrren.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:valorant_app/ui/screens/home_screen.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        DetailsScreen.routeName : (context) => DetailsScreen()
      },
    );
  }
}
