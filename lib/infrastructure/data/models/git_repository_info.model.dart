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
    required super.stargazersCount,
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
      stargazersCount: json['stargazers_count'],
      owner: OwnerModel.fromJson(json['owner']),
    );
  }

  factory GitRepositoryInfoModel.fromEntity(GitRepositoryInfo entity) {
    return GitRepositoryInfoModel(
      id: entity.id,
      name: entity.name,
      fullName: entity.fullName,
      private: entity.private,
      description: entity.description,
      url: entity.url,
      stargazersCount: entity.stargazersCount,
      owner: OwnerModel.fromEntity(entity.owner),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'private': private,
      'description': description,
      'url': url,
      'stargazers_count': stargazersCount,
      'owner': OwnerModel.fromEntity(owner).toJson(),
    };
  }
}
