part of utils;

kClearAppState() async {
  final context = kNavigatorKey.currentContext;

  if(context == null) {
    return;
  }

  final lendingProvider = context.read<LendingProvider>();
  final navigator = kNavigatorKey.currentState;

  await lendingProvider.clearAppState();

  navigator?.popUntil((route) => route.isFirst);

}