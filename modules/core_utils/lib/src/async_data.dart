class AsyncData<T> {
  const AsyncData({
    this.data,
    this.error,
    this.loading = false,
  });

  final T? data;
  final dynamic error;
  final bool loading;

  T get requiredData {
    if (data == null) throw Exception('data is required');
    return data!;
  }

  bool get isError => error != null;
}
