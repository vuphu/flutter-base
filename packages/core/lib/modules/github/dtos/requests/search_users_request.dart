class SearchUsersRequest {
  final String? q;
  final int? page;
  final int perPage;

  SearchUsersRequest({
    this.q,
    this.page,
    this.perPage = 20,
  });
}
