import 'package:app/src/core/domain/entities/user_entity.dart';

abstract class LoginUserRepository {
  Future<void> loginUser(UserEntity user);
}