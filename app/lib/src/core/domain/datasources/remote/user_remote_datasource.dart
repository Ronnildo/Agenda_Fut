
import 'package:app/src/core/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<void> saveUser(UserEntity userEntity);
  Future<void> login(UserEntity userEntity);
}

