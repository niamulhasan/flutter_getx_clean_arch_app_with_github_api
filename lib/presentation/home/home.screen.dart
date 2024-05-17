import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter_project/domain/core/constants/app_translation_strings.dart';
import 'package:starter_project/infrastructure/utils/dependency_locator_utils/dependency_locator.dart';
import 'package:starter_project/presentation/home/components/language_switch_button.dart';
import 'package:starter_project/presentation/home/components/theme_toggle_switch.dart';

import '../../domain/entities/git_repository_info.dart';
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
        actions: [
          // ThemeToggleSwitch(
          //   DependencyLocator.locate(),
          //   DependencyLocator.locate(),
          // ),
          LanguageSwitchButton(
            DependencyLocator.locate(),
          ),
        ],
      ),
      body: controller.stargazersRepositoriesViewModel.fold(
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: const Center(
          child: Text("No Repositories Found"),
        ),
        onError: (failure) => Center(
          child: Text(failure.message, style: Get.textTheme.titleSmall),
        ),
        onData: (data) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              //triggering next page loading when scroll reaches the end
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter == 0) {
                controller.stargazersRepositoriesViewModel.fetchNext();
              }
              return false;
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                // final wallpaper = wallpapersPaginatedResponse[index];
                // return AppWallpaperGridItem(wallpaper: wallpaper);
                return RepoInfoCard(data[index]);
              },
            ),
          ),
        ),
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

class RepoInfoCard extends StatelessWidget {
  final GitRepositoryInfo repo;

  const RepoInfoCard(
    this.repo, {
    super.key,
  });

  String _trimDescription(String? description) {
    if (description == null) {
      return "No Description";
    }
    if (description.length > 100) {
      return "${description.substring(0, 100)}...";
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    repo.name,
                    style: Get.textTheme.titleLarge,
                  ),
                ),
                Icon(
                  repo.private ? Icons.lock : Icons.lock_open,
                  color: repo.private ? Colors.red : Colors.green,
                  size: 22.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _trimDescription(repo.description),
              style: Get.textTheme.bodyMedium!.copyWith(
                color: Colors.black87.withOpacity(0.5),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  repo.owner.login,
                  style: Get.textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(repo.owner.avatarUrl),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
