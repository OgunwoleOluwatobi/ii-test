import 'package:dartz/dartz.dart';
import 'package:ii_test/core/models/app_error.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/models/user_list_response.dart';

abstract class UserRemoteDataSource {
  Future<Either<AppError, UserListResponse>> fetchUsers();
  Future<Either<AppError, User>> fetchUserDetails({required String id});
}