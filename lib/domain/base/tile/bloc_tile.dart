class BlocTile {
  bool isLoading;

  dynamic data;

  bool isDispose;

  BlocTile(
    this.isLoading,
    this.data,
    this.isDispose,
  );

  factory BlocTile.init() => BlocTile(false, null, false);

  void updateParams(
    bool isLoading,
    dynamic data,
  ) {
    if (isLoading != null) this.isLoading = isLoading;
    if (data != null) this.data = data;
  }

  void dispose() {
    this.isDispose = true;
  }

  BlocTile copy() {
    return BlocTile(
      this.isLoading,
      this.data,
      this.isDispose,
    );
  }
}
