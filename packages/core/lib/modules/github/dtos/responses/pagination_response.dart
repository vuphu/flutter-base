class PaginationResponse<T> {
  final List<T> items;
  final int totalCount;

  PaginationResponse({
    required this.items,
    required this.totalCount,
  });

  factory PaginationResponse.fromJson(dynamic json, T Function(Map<String, dynamic> json) parser) {
    return PaginationResponse(
      items: (json['items'] as List<dynamic>).map((item) => parser(item)).toList(),
      totalCount: json['total_count'],
    );
  }
}
