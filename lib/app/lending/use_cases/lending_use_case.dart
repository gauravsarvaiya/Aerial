import '../../../repository/lending/lending_repo.dart';
import '../../../repository/lending/model/app_state.dart';

abstract class ILendingUseCase {
  Future<AppState> getAppState();
  Future setAppState({required AppState state});
  Future clearAppState();
}

class LendingUseCase extends ILendingUseCase {

  final ILendingRepository repo;

  LendingUseCase({required this.repo});

  @override
  Future<AppState> getAppState() => repo.getAppState();

  @override
  Future setAppState({required AppState state}) => repo.setAppState(state: state);

  @override
  Future clearAppState() => repo.clearAppState();
}