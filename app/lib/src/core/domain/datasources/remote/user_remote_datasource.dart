
import 'package:app/src/core/domain/dto/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<void> saveUser(UserDto userDto);
}

