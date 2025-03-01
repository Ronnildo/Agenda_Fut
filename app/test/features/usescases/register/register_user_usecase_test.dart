import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:app/src/core/domain/repositories/register/register_user_repository_imp.dart';
import 'package:app/src/features/pages/register/domain/usecases/register_use_usecase/register_user_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'register_user_usecase_test.mocks.dart';

@GenerateMocks([RegisterUserRepositoryImp])
void main() {
  late RegisterUserUseCaseImp useCase;
  late MockRegisterUserRepositoryImp mockUserRepository;

  test("Register use unsucessfull", () {
    mockUserRepository = MockRegisterUserRepositoryImp();
    useCase = RegisterUserUseCaseImp(mockUserRepository);
    final userInvalido =
        UserEntity(name: "ronnildo", email: "teste@test.com", password: "1211");

    // Act & Assert
    expect(useCase(userInvalido), throwsException);
  });
}
