import 'package:flutter/material.dart';
import 'package:proyectoasistencia/screens/agregar-noticia.dart';
import 'package:proyectoasistencia/screens/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),

      initialRoute: '/',
    routes: {
      '/agregar-noticia': (context) => AgregarNoticiaScreen(),
    },
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          
        ),
      ),
    );
  }
}
