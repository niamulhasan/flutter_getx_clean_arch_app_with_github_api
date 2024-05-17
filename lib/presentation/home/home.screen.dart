import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter_project/domain/core/constants/app_translation_strings.dart';
import 'package:starter_project/infrastructure/utils/dependency_locator_utils/dependency_locator.dart';
import 'package:starter_project/presentation/home/components/language_switch_button.dart';
import 'package:starter_project/presentation/home/components/theme_toggle_switch.dart';

import '../../domain/entities/git_repository_info.dart';
import 'components/repos_grid_section.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslationStrings.appName.tr,
            style: Get.theme.textTheme.titleSmall),
        centerTitle: true,
      ),
      body: controller.stargazersRepositoriesViewModel.fold(
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: const Center(
          child: Text("No Repositories Found"),
        ),
        onError: (failure) {
          if(!controller.stargazersRepositoriesViewModel.hasCachedData){
            return Center(
              child: Text(failure.toString()),
            );
          } else {
            return ReposGridSection(controller.stargazersRepositoriesViewModel.items);
          }
        },
        onData: (data) => ReposGridSection(data),
        onLoadingMore: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}




