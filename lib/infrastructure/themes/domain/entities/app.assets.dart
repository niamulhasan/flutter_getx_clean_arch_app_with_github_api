

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contracts/app_assets.contract.dart';
import '../contracts/app_icon_assets.contract.dart';

part '_light_icons.dart';
part '_dark_icons.dart';
part '_light_assets.dart';
part '_dark_assets.dart';
part '_common_assets.dart';


abstract class AppAssets {
  static final AppAssetsContract light = _LightAssets();
  static final AppAssetsContract dark = _DarkAssets();

  static AppAssetsContract themed(BuildContext context) {
    return context.isDarkMode ? AppAssets.dark : AppAssets.light;
  }

  static final appFontFamilies = _AppFontFamilies();
}

class _AppFontFamilies {
  final String alinurSnigdha = 'AlinurSnigdha';
  final String solaimanLipi = 'SolaimanLipi';
}
