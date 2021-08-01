import 'package:ii_test/core/data_source/user_remote_data_source/user_remote_data_source.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/services/user_service.dart';
import 'package:ii_test/core/utils/exports.dart';

class UserDetailsViewModel extends ReactiveViewModel {
  final UserRemoteDataSource _userRemoteDataSource = locator<UserRemoteDataSource>();
  final UserService _userService = locator<UserService>();

  User? get user => _userService.user;
  List<User>? get users => _userService.users;

  void setup() {
    if(!user!.loaded!) {
      Future.delayed(
        Duration(milliseconds: 200),
        () => getUserDetails()
      );
    }
  }

  Future getUserDetails() async{
    if(user == null) {
      flusher('Error with user');
      return;
    }
    setBusyForObject(user, true);

    final data = await _userRemoteDataSource.fetchUserDetails(id: user!.id!);

    data.fold(
      (l) {
        flusher(l.message ?? 'An error occured');
      },
      (r) {
        setBusyForObject(user, false);
        _userService.setUser(r);
        _userService.addUsers(r);
      }
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userService];
}