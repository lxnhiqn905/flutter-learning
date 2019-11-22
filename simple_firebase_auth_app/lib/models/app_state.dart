class AppState {
  // Your app will use this to know when to display loading spinners.
  bool isLoading;

  // Constructor
  AppState({
    this.isLoading = false,
    // this.user,
  });

  // A constructor for when the app is loading.
  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return null;
    // return 'AppState{isLoading: $isLoading, user: ${user?.displayName ?? 'null'}}';
  }
}