
class RestResponse<E> {
  final int totalCount;
  final bool incompleteResults;
  final List<E> items;

  RestResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,

  });

  factory RestResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic> json) dataDeSerializer) {
    return RestResponse(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: json['data'] is List
          ? (json['data'] as List).map<E>((e) => dataDeSerializer(e)).toList()
          : json['data'],
    );
  }
}
