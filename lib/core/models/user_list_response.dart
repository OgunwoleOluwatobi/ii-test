import 'package:hive/hive.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/utils/type_id.dart';

part 'user_list_response.g.dart';

@HiveType(typeId: TypeId.userList, adapterName: 'UserListAdapter')
class UserListResponse {
  @HiveField(0)
  List<User>? users;
  int? total;
  int? page;
  int? limit;
  int? offset;

  UserListResponse({
    this.users,
    this.total,
    this.page,
    this.limit,
    this.offset
  });

  UserListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      users = new List<User>.empty(growable: true);
      json['data'].forEach((v) {
        users!.add(new User.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
  }
}
