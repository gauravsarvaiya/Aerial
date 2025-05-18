import 'package:flutter/cupertino.dart';
import '../../../base/domin/base_notifier.dart';
import '../use_cases/lending_use_case.dart';
import '../../../repository/lending/model/app_state.dart';


abstract class ILendingProvider {
  Future getAppState();
  Future setAppState({required AppState state});
  Future clearAppState();
}

class LendingProvider extends BaseNotifier implements ILendingProvider {
  late final ILendingUseCase useCase;

  AppState? appState;

  bool isUnderMaintenance = false;
  bool isMajorUpdate = false;
  bool isMinorUpdate = false;

  LendingProvider({required this.useCase}) {
    getAppState();
  }

  @override
  Future getAppState() async {

    try {
      appState = await useCase.getAppState();
      print(appState?.memberID);
    } catch (e) {
      debugPrint("$e");
      appState = AppState(isLogin: false);
    } finally {
      notifyListeners();
    }

  }

  @override
  Future setAppState({required AppState state}) async {

    try {
      await useCase.setAppState(state: state);
      await getAppState();
    } catch (e) {
      debugPrint("$e");
    }

  }

  @override
  Future clearAppState() async {
    await useCase.clearAppState();
    appState = AppState(isLogin: false);
    notifyListeners();
  }
}