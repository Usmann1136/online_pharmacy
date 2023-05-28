import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LiveLocationViewModel extends GetxController {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return await Geolocator.getCurrentPosition();
  }
}
