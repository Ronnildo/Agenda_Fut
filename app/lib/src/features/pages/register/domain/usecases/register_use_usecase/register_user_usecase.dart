import 'package:app/src/core/domain/entities/user_entity.dart';

abstract class RegisterUserUseCase {
  Future call(UserEntity user);
}