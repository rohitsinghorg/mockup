/// One page of results from a paginated mock data source.
///
/// Returned by `getPage` and `fetchPage` on every data provider, e.g.
/// `Mockup.user.getPage(2, pageSize: 10)`.
class MockPage<T> {
  /// Creates a page of [items].
  const MockPage({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalItems,
  });

  /// The items on this page. Fewer than [pageSize] on the last page, and empty
  /// when [page] is past the end.
  final List<T> items;

  /// The 1-based page number.
  final int page;

  /// The maximum number of items per page.
  final int pageSize;

  /// The total number of items across all pages.
  final int totalItems;

  /// The total number of pages.
  int get totalPages => (totalItems / pageSize).ceil();

  /// Whether another page follows this one.
  bool get hasNextPage => page < totalPages;

  /// The next page number, or `null` if this is the last page.
  int? get nextPage => hasNextPage ? page + 1 : null;

  @override
  String toString() => "MockPage(page: $page/$totalPages, "
      "items: ${items.length}, totalItems: $totalItems)";
}
