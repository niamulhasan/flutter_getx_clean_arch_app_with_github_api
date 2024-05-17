import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter_project/domain/core/constants/app_translation_strings.dart';
import 'package:starter_project/infrastructure/utils/dependency_locator_utils/dependency_locator.dart';
import 'package:starter_project/presentation/home/components/language_switch_button.dart';
import 'package:starter_project/presentation/home/components/theme_toggle_switch.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslationStrings.appName.tr, style: Get.theme.textTheme.titleSmall),
        centerTitle: true,
        actions: [
          ThemeToggleSwitch(
            DependencyLocator.locate(),
            DependencyLocator.locate(),
          ),
          LanguageSwitchButton(
            DependencyLocator.locate(),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'HomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
