import '../model/payment_link_model.dart';

abstract class IPaymentLinkProvider {
  Future<List<PaymentLinkModel>> getList();
}
