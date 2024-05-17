import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../domain/entities/git_repository_info.dart';
import '../controllers/home.controller.dart';
import '../widgets/reop_info_card.dart';

class ReposGridSection extends GetView<HomeController> {
  final List<GitRepositoryInfo> data;

  const ReposGridSection(
      this.data, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
