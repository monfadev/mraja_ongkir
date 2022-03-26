part of 'providers.dart';

class UserProvider extends ChangeNotifier {
  String? _userId;

  String? get userId => _userId;

  set username(String? value) {
    _userId = value;
    notifyListeners();
  }

   bool get login => _userId != null;
}
