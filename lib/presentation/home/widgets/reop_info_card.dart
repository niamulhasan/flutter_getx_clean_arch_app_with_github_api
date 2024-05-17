import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../domain/entities/git_repository_info.dart';
import '../../../infrastructure/navigation/routes.dart';

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
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        print("Tapped");
        Get.rootDelegate.toNamed(
          Routes.REPO_DETAILS,
          arguments: repo,
        );
      },
      child: Card(
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
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Stars: ${repo.stargazersCount}",
                    style: Get.textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
      ),
    );
  }
}
