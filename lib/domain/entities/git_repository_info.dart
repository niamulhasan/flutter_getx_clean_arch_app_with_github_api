

import 'owner.dart';

class GitRepositoryInfo {
  final int id;
  final String name;
  final String fullName;
  final bool private;
  final String? description;
  final String url;
  final Owner owner;

  const GitRepositoryInfo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.description,
    required this.url,
    required this.owner,
  });
}