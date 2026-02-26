import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'location_provider.dart';

class ProximityScreen extends ConsumerWidget {
  const ProximityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchamos el estado del provider
    final proximityAsync = ref.watch(proximityProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Auditoría de Eficiencia")),
      body: Center(
        child: proximityAsync.when(
          data: (distance) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Distancia al punto crítico:"),
              Text(
                "${distance.toStringAsFixed(2)} metros",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              // Lógica de carga perezosa (Lazy Loading) visual
              if (distance <= 50)
                const Icon(Icons.warning, color: Colors.red, size: 50)
              else
                const Text("Fuera de zona de riesgo"),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}