import 'package:cloudwalk_link_payment_test/payment_link/domain/entities/payment_link_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/payment_link/payment_link_repository_mock.dart';

void main() {
  late PaymentLinkRepositoryMock _repository;

  setUp(() {
    _repository = PaymentLinkRepositoryMock();
  });

  test(
    'should return a list of payment links',
    () async {
      final result = await _repository.getList();

      expect(result, isA<List<PaymentLinkEntity>>());
    },
  );
}
