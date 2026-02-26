import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'proximity_screen.dart'; // Importa el archivo que creamos antes

void main() {
  // ProviderScope es esencial para que Riverpod gestione el ciclo de vida
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auditoría Geoespacial Verde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true, // Arquitectura moderna y eficiente
      ),
      home: const ProximityScreen(),
    );
  }
}