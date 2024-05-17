
class RestResponsePaginated<E> {
  final List<E> data;
  final PageMeta meta;

  RestResponsePaginated({
    required this.data,
    required this.meta,
  });

  factory RestResponsePaginated.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic> json) dataDeSerializer) {
    return RestResponsePaginated(
      data: json['data'] is List
          ? (json['data'] as List).map<E>((e) => dataDeSerializer(e)).toList()
          : json['data'],
      meta: PageMeta(
        currentPage: json['meta']['current_page'],
        lastPage: json['meta']['last_page'],
        perPage: json['meta']['per_page'],
        total: json['meta']['total'],
        from: json['meta']['from'],
        to: json['meta']['to'],
      ),
    );
  }
}


class PageMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int? from;
  final int? to;

  PageMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
  });

}