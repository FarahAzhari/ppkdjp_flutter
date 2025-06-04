import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkdjp_flutter/meet_16/login_screen.dart';
import 'package:ppkdjp_flutter/meet_16/register_screen.dart';
import 'package:ppkdjp_flutter/meet_sepuluh/thank_you_page.dart';
import 'package:ppkdjp_flutter/splash_screen.dart';
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
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreenApp(),
        ThankYouPage.id: (context) => ThankYouPage(name: '', domicile: ''),
        LoginScreenApp.id: (context) => LoginScreenApp(),
        RegisterScreenApp.id: (context) => RegisterScreenApp(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: TugasSepuluhFlutter(),
    );
  }
}
