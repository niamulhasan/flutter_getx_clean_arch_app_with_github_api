import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter_project/presentation/repo_details/widgets/repo_details_header_section.dart';

import 'controllers/repo_details.controller.dart';

class RepoDetailsScreen extends GetView<RepoDetailsController> {
  const RepoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.routeArguments.name,
          style: Get.theme.textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
          child: Column(
            children: [
              RepoDetailsHeader(controller: controller),
              const SizedBox(height: 8),
              Text(
                controller.routeArguments.fullName,
                style: Get.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "Updated at: ${controller.routeArguments.updatedAt.toUtc()}",
                style: Get.textTheme.titleSmall!.copyWith(
                  color: Colors.black87.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                controller.routeArguments.url,
                style: Get.textTheme.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                controller.routeArguments.description ?? "No Description",
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: Colors.black87.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
