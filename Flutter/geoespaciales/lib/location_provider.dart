import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final proximityProvider = StreamProvider<double>((ref) async* {
  bool serviceEnabled;
  LocationPermission permission;

  // 1. Verificar si el servicio de GPS está encendido
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw 'El GPS está desactivado.';
  }

  // 2. Verificar y solicitar permisos
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw 'Permisos denegados por el usuario.';
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    throw 'Los permisos están bloqueados permanentemente en ajustes.';
  }

  // 3. Si todo está bien, escuchar la ubicación
  const targetLat = -3.987;
  const targetLng = -79.202;
  const settings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 5,
  );

  yield* Geolocator.getPositionStream(locationSettings: settings).map((position) {
    return Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      targetLat,
      targetLng,
    );
  });
});