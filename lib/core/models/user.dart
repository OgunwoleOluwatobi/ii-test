import 'package:hive/hive.dart';
import 'package:ii_test/core/models/location.dart';
import 'package:ii_test/core/utils/type_id.dart';

part 'user.g.dart';

@HiveType(typeId: TypeId.user, adapterName: 'UserAdapter')
class User {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? dateOfBirth;
  @HiveField(7)
  String? phone;
  @HiveField(8)
  String? picture;
  @HiveField(9)
  Location? location;
  @HiveField(10)
  String? registerDate;
  @HiveField(11)
  String? updatedAt;
  @HiveField(12)
  bool? loaded;

  User(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.dateOfBirth,
      this.phone,
      this.picture,
      this.location,
      this.registerDate,
      this.updatedAt,
      this.loaded = false});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    phone = json['phone'];
    picture = json['picture'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    registerDate = json['registerDate'];
    updatedAt = json['updatedAt'];
    loaded = false;
  }
}
