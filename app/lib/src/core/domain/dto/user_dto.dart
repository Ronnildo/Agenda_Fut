// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/src/core/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  String name;
  String email;
  String password;
  String? cellPhone;
  String? position;
  String? photo;

  UserDto({
    required this.name,
    required this.email,
    required this.password,
    this.cellPhone,
    this.position,
    this.photo,
  }) : super(
          name: name,
          email: email,
          password: password,
          cellPhone: cellPhone,
          position: position,
          photo: photo,
        );

  static fromMap(Map map) {
    return UserDto(
      name: map["name"],
      email: map["email"],
      password: map["password"],
      position: map["position"],
      photo: map["photo"],
      cellPhone: map["cellPhone"],
    );
  }

  Map toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "cellPhone": cellPhone,
      "position": position,
      "photo": photo,
    };
  }
}
