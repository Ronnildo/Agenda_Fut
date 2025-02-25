import 'package:app/src/core/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUser(UserEntity user);
}