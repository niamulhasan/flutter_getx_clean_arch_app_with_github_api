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
}
