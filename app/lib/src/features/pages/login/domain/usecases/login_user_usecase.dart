import 'package:app/src/core/domain/entities/user_entity.dart';

abstract class LoginUserUseCase {
  Future<void> call(UserEntity userEntity);
}