import 'package:hive/hive.dart';
import 'package:ii_test/core/models/location.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/models/user_list_response.dart';
import 'package:ii_test/core/utils/exports.dart';
import 'package:ii_test/core/utils/hive_boxes.dart';

class UserService with ReactiveServiceMixin {
  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.user);
  Box<User> get _userBox => _hiveService.box<User>(HiveBox.user);

  List<User>? _users;
  List<User>? get users => _users;

  User? _user;
  User? get user => _user;

  UserService(){
    listenToReactiveValues([_users, _user]);
  }

  Future<void> init() async{
    _hiveService.registerAdapter(UserAdapter());
    _hiveService.registerAdapter(UserListAdapter());
    _hiveService.registerAdapter(LocationAdapter());

    if (!_isBoxOpen) {
      await _hiveService.openBox<User>(HiveBox.user);
    }
  }

  Future addUsers(User user) async{
    await _userBox.put(user.id, user);
    getUser();
  }

  void getUser() {
    _users = _userBox.toMap().values.toList();
    notifyListeners();
  }

  void clear() {
    _userBox.clear();
    getUser();
  }

  void clearUser() {
    _users = null;
    notifyListeners();
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}