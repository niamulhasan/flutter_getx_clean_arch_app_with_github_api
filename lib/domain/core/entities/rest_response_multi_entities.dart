
class RestResponseMultiEntities<E> {
  final List<E> data;

  RestResponseMultiEntities({
    required this.data,
  });

  factory RestResponseMultiEntities.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic> json) dataDeSerializer) {
    return RestResponseMultiEntities(
      data: json['data'] is List
          ? (json['data'] as List).map<E>((e) => dataDeSerializer(e)).toList()
          : json['data'],
    );
  }
}


class PageMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int from;
  final int to;

  PageMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
  });

}