import 'package:ii_test/core/data_source/user_remote_data_source/user_remote_data_source.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/services/user_service.dart';
import 'package:ii_test/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class UserListViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final UserRemoteDataSource _userRemoteDataSource = locator<UserRemoteDataSource>();

  List<User>? get users => _userService.users;

  void setup() {
    Future.delayed(
      Duration(milliseconds: 200),
      () {
        _userService.getUser();
        fetchUsers();
      }
    );
  }

  void setUser(User val) {
    _userService.setUser(val);
    _navigationService.navigateTo(Routes.userDetails);
  }

  Future fetchUsers() async{
    setBusyForObject(users, true);

    final data = await _userRemoteDataSource.fetchUsers();

    data.fold(
      (l) {
        setBusyForObject(users, false);
        flusher(l.message ?? 'An error occured');
      },
      (r) {
        setBusyForObject(users, false);
        if(r.users != null) {
          for(User item in r.users!) {
           _userService.addUsers(item); 
          }
        }
      }
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userService];
}