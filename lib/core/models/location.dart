import 'package:hive/hive.dart';
import 'package:ii_test/core/utils/type_id.dart';

part 'location.g.dart';

@HiveType(typeId: TypeId.location, adapterName: 'LocationAdapter')
class Location {
  @HiveField(0)
  String? street;
  @HiveField(1)
  String? city;
  @HiveField(2)
  String? state;
  @HiveField(3)
  String? country;
  @HiveField(5)
  String? timezone;

  Location({this.street, this.city, this.state, this.country, this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['timezone'] = this.timezone;
    return data;
  }
}