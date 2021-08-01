import 'package:dartz/dartz.dart';
import 'package:ii_test/app/locator.dart';
import 'package:ii_test/core/data_source/user_remote_data_source/user_remote_data_source.dart';
import 'package:ii_test/core/models/app_error.dart';
import 'package:ii_test/core/models/response.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/models/user_list_response.dart';
import 'package:ii_test/core/utils/exports.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();
  
  @override
  Future<Either<AppError, UserListResponse>> fetchUsers() async{
    try {
      FormattedResponse raw = await _httpService.getHttp('/user?limit=100');
      if(raw.success) {
        return Right(UserListResponse.fromJson(raw.data));
      } else {
        return Left(AppError(errorType: AppErrorType.network, message: raw.data??'An Error Occured'));
      }
    } on NetworkException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception catch(e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.toString()));
    }
  }
  
  @override
  Future<Either<AppError, User>> fetchUserDetails({required String id}) async{
    try {
      FormattedResponse raw = await _httpService.getHttp('/user/$id');
      if(raw.success) {
        return Right(User.fromJson(raw.data));
      } else {
        return Left(AppError(errorType: AppErrorType.network, message: raw.data??'An Error Occured'));
      }
    } on NetworkException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception catch(e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.toString()));
    }
  }
  
}