import 'package:cloudwalk_link_payment_test/payment_link/data/model/payment_link_model.dart';
import 'package:cloudwalk_link_payment_test/payment_link/domain/repositories/ipayment_link_repository.dart';

class PaymentLinkRepositoryMock implements IPaymentLinkRepository {
  @override
  Future<List<PaymentLinkModel>> getList() {
    return Future.value([PaymentLinkModel()]);
  }
}
