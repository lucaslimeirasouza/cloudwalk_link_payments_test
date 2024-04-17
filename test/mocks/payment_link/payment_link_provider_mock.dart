import 'package:cloudwalk_link_payment_test/payment_link/data/model/payment_link_model.dart';
import 'package:cloudwalk_link_payment_test/payment_link/data/providers/ipayment_link_provider.dart';

class PaymentLinkProviderMock implements IPaymentLinkProvider {
  @override
  Future<List<PaymentLinkModel>> getList() {
    return Future.value([PaymentLinkModel()]);
  }
}
