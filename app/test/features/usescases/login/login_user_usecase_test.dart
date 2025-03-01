import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:app/src/core/domain/repositories/login/login_user_repository_imp.dart';
import 'package:app/src/features/pages/login/domain/usecases/login_user_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'login_user_usecase_test.mocks.dart';

@GenerateMocks([LoginUserRepositoryImp])
void main() {

  late LoginUserUseCaseImp useCase;
  late MockLoginUserRepositoryImp mockLoginRepository;

  test("login unSuccessFull test", (){
    mockLoginRepository = MockLoginUserRepositoryImp();
    useCase = LoginUserUseCaseImp(mockLoginRepository);

    UserEntity user = UserEntity(name: "Teste", email: "teste@gmil.com", password: "123456");
    
    expect(useCase(user), throwsException);
  });
  
}