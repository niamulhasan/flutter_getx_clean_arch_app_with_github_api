import '../../../domain/entities/owner.dart';

class OwnerModel extends Owner {
  OwnerModel({
    required super.id,
    required super.login,
    required super.avatarUrl,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }

  factory OwnerModel.fromEntity(Owner entity) {
    return OwnerModel(
      id: entity.id,
      login: entity.login,
      avatarUrl: entity.avatarUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'avatar_url': avatarUrl,
    };
  }
}
