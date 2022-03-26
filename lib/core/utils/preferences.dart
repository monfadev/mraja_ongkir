part of 'utils.dart';

class Preferences {
  final SharedPreferences shared;

  Preferences(this.shared);

  set token(String? value) => shared.setString("token", value!);

  String? get token => shared.getString("token");

  static Future<Preferences> instance() => SharedPreferences.getInstance().then((value) => Preferences(value));
}
