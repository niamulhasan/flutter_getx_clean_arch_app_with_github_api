import 'package:starter_project/domain/entities/git_repository_info.dart';

import 'owner.model.dart';

class GitRepositoryInfoModel extends GitRepositoryInfo {
  GitRepositoryInfoModel({
    required super.id,
    required super.name,
    required super.fullName,
    required super.private,
    required super.description,
    required super.url,
    required super.owner,
  });

  factory GitRepositoryInfoModel.fromJson(Map<String, dynamic> json) {
    return GitRepositoryInfoModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      description: json['description'],
      url: json['url'],
      owner: OwnerModel.fromJson(json['owner']),
    );
  }


}
