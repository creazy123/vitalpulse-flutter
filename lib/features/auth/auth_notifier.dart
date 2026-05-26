import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  final String? accessToken;
  const AuthState({this.accessToken});
  bool get isLoggedIn => accessToken != null;
  AuthState copyWith({String? accessToken}) => AuthState(accessToken: accessToken);
}

class AuthNotifier extends ChangeNotifier {
  AuthState _state = const AuthState();
  AuthState get state => _state;

  static const _tokenKey = 'access_token';

  Future<void> load() async {
    final sp = await SharedPreferences.getInstance();
    final token = sp.getString(_tokenKey);
    _state = AuthState(accessToken: token);
    notifyListeners();
  }

  Future<void> loginWithPhone(String phone, String code) async {
    // TODO: 替换为真实 API 调用
    await Future.delayed(const Duration(milliseconds: 500));
    final token = 'mock-token-$phone';
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_tokenKey, token);
    _state = AuthState(accessToken: token);
    notifyListeners();
  }

  Future<void> logout() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(_tokenKey);
    _state = const AuthState();
    notifyListeners();
  }
}

final authNotifierProvider =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier()..load());
