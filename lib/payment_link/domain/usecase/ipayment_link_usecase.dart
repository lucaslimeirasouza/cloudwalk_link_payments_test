import '../entities/payment_link_entity.dart';

abstract class IPaymentLinkUsecase {
  Future<List<PaymentLinkEntity>> getList();
}
