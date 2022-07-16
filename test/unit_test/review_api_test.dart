import 'package:flutter_office_booking/services/api/review_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'review_api_test.mocks.dart';

@GenerateMocks([ReviewApi])
void main() {
  ReviewApi reviewApi = MockReviewApi();
  test('add review', () async {
    when(reviewApi.postReview('token', 1, 1, 5, 'review'))
        .thenAnswer((realInvocation) async => 'Berhasil Melakukan Review');
    var respose = await reviewApi.postReview('token', 1, 1, 5, 'review');

    expect(respose == 'Berhasil Melakukan Review', true);
  });
}
