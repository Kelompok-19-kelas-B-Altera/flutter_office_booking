import 'package:flutter_office_booking/services/api/user_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'user_api_test.mocks.dart';

@GenerateMocks([UserApi])
void main() {
  UserApi userApi = MockUserApi();

  group('UserAPI', () {
    test('sign in', () async {
      when(userApi.signIn(email: 'email', password: 'password'))
          .thenAnswer((realInvocation) => {});

      var response = userApi.signIn(email: 'email', password: 'password');
      expect(response != null, true);
    });

    test('sign up', () async {
      when(userApi.signUp(email: 'email', name: 'name', password: 'password'))
          .thenAnswer((realInvocation) => {});

      var response =
          userApi.signUp(email: 'email', name: 'name', password: 'password');
      expect(response != null, true);
    });

    test('get user data', () async {
      when(userApi.getUserData(1, 'token')).thenAnswer((realInvocation) => {});

      var response = userApi.getUserData(1, 'token');
      expect(response != null, true);
    });
  });
}
