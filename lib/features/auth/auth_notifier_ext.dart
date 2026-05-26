import 'auth_notifier.dart';

extension AuthNotifierShortcut on AuthNotifier {
  bool get isLoggedIn => state.isLoggedIn;
  String? get accessToken => state.accessToken;
}
