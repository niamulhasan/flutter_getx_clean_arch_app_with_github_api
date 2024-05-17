import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/repo_details.controller.dart';

class RepoDetailsHeader extends StatelessWidget {
  const RepoDetailsHeader({
    super.key,
    required this.controller,
  });

  final RepoDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              controller.routeArguments.owner.avatarUrl,
            ),
          ),
          Text(
            controller.routeArguments.owner.login,
            style: Get.textTheme.titleSmall,
          ),
        ]),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  controller.routeArguments.name,
                  style: Get.textTheme.titleLarge,
                ),
                const SizedBox(width: 8),
                Icon(
                  controller.routeArguments.private
                      ? Icons.lock
                      : Icons.lock_open,
                  color: controller.routeArguments.private
                      ? Colors.red
                      : Colors.green,
                  size: 22.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${controller.routeArguments.stargazersCount.toString()} Star(s)',
              style: Get.textTheme.titleSmall!.copyWith(
                color: Colors.black87.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}