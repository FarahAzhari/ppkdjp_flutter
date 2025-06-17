import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './harry_potter/screens/splash_screen.dart';
// import 'package:ppkdjp_flutter/meet_dua.dart';
// import 'package:ppkdjp_flutter/meet_dua_a.dart';
// import 'package:ppkdjp_flutter/tugas_dua_flutter.dart';
// import 'package:ppkdjp_flutter/meet_dua.dart';
// import 'package:ppkdjp_flutter/tugas_satu_flutter.dart';
// import 'package:ppkdjp_flutter/meet_satu.dart';
// import 'package:ppkdjp_flutter/my_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (context) => SplashScreen(),
        // '/': (context) => SiswaScreen(),
        // '/': (context) => MenuPage(),
        // '/': (context) => UserListScreen(),
        // '/login': (context) => LoginScreenApp(),
        // ThankYouPage.id: (context) => ThankYouPage(name: '', domicile: ''),
        // LoginScreenApp.id: (context) => LoginScreenApp(),
        // RegisterScreenApp.id: (context) => RegisterScreenApp(),
        '/': (context) => SplashScreen(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      // HARRY POTTER THEME
      theme: ThemeData(
        primarySwatch:
            Colors.blueGrey, // You can define a custom MaterialColor here later
        // Define your magical fonts globally here if you like
        fontFamily: 'NotoSerif', // A general serif font for the app
        scaffoldBackgroundColor: Color(
          0xFFF5F5DC,
        ), // Light parchment background for the whole app
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E), // Deep blue AppBar
          foregroundColor: Color(0xFFFFD700), // Gold text
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'CinzelDecorative', // Title font
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: TugasSepuluhFlutter(),
    );
  }
}
