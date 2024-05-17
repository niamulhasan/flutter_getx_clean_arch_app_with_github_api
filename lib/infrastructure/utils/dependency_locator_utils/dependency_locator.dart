
import 'dart:developer';

import 'package:get/get.dart';

import '../../../di_container.dart';

abstract class DependencyLocator {

  static T? locate<T>() {
    try {
      return Get.find<T>();
    }
    catch (e) {
      log("⚠️$T NOT FOUND: \nContinuing without features that depend on it.");
      return null;
    }
  }
}