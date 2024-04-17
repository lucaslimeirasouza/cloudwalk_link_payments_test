import '../entities/payment_link_entity.dart';

abstract class IPaymentLinkRepository {
  Future<List<PaymentLinkEntity>> getList();
}
