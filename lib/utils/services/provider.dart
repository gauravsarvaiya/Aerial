part of utils;


class AppProviders {
  static AppProviders shared = AppProviders();

  // ============================= Repository
  get _authRepo => AuthRepo();
  get _lendingRepo => LendingRepository();

  // ================================= useCases
  get _authUseCase => AuthUseCases(authRepo: _authRepo);
  get _lendingUseCase => LendingUseCase(repo: _lendingRepo);

  // ============================= Provider
  get authProvider => ChangeNotifierProvider(create: (context) => AuthProvider(authUseCases: _authUseCase));
  get lendingProvider => ChangeNotifierProvider(create: (context) => LendingProvider(useCase: _lendingUseCase));
  get tabProvider => ChangeNotifierProvider(create: (context) => TabProvider());


}