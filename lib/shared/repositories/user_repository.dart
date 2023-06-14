import 'package:sample_project/shared/repositories/shared_prefs.dart';

abstract class UserRepository {
  Future<void> applyName(String name);
  Future<void> applyAge(String age);
}

class SharedPreferenceRepository implements UserRepository {
  const SharedPreferenceRepository(this._sharedPrefs);
  final SharedPrefs _sharedPrefs;

  @override
  Future<void> applyAge(String age) async {
    await _sharedPrefs.setString('ageRange', age);
  }

  @override
  Future<void> applyName(String name) async {
    await _sharedPrefs.setString('name', name);
  }
}
