import '../../../di_payment_link.dart';
import '../../domain/repositories/ipayment_link_repository.dart';
import '../model/payment_link_model.dart';
import '../providers/ipayment_link_provider.dart';

class PaymentLinkRepository extends IPaymentLinkRepository {
  IPaymentLinkProvider get _provider => di.get<IPaymentLinkProvider>();
  // final IPaymentLinkProvider _provider;
  // PaymentLinkRepository(this._provider);

  @override
  Future<List<PaymentLinkModel>> getList() async {
    return await _provider.getList();
  }
}
