import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends SharedPreferenceRepository {
  SharedPreferences? _pref;

  SharedPreference._privateConstructor();

  static final SharedPreference instance =
      SharedPreference._privateConstructor();

  @override
  Future<bool?> clearData() async {
    return _pref?.clear();
  }

  Future<SharedPreferences> initPreference() async =>
      _pref = await SharedPreferences.getInstance();
}

abstract class SharedPreferenceRepository {
  Future<bool?> clearData();
}
