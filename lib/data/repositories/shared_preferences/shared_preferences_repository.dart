import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesRepository {
  Future<void> saveFirstRunApp({
    required bool isFirstRunApp,
  });

  Future<bool?> readFirstRunApp();
}

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final _isFirstRunApp = 'isFirstRunApp';

  @override
  Future<void> saveFirstRunApp({
    required bool isFirstRunApp,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstRunApp, isFirstRunApp);
  }

  @override
  Future<bool?> readFirstRunApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstRunApp) ?? false;
  }
}
