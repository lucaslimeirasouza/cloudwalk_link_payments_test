import 'package:cloudwalk_link_payment_test/payment_link/data/model/payment_link_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/payment_link/payment_link_provider_mock.dart';

void main() {
  late PaymentLinkProviderMock _provider;

  setUp(() {
    _provider = PaymentLinkProviderMock();
  });

  test(
    'should return a list of payment links',
    () async {
      final result = await _provider.getList();

      expect(result, isA<List<PaymentLinkModel>>());
    },
  );
}
