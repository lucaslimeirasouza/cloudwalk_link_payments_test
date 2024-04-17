import '../../../di_payment_link.dart';
import '../entities/payment_link_entity.dart';
import '../repositories/ipayment_link_repository.dart';
import 'ipayment_link_usecase.dart';

class PaymentLinkUsecase extends IPaymentLinkUsecase {
  IPaymentLinkRepository _repository = di.get<IPaymentLinkRepository>();
  // final IPaymentLinkRepository _repository;
  // PaymentLinkUsecase(this._repository);

  @override
  Future<List<PaymentLinkEntity>> getList() async {
    List<PaymentLinkEntity> result = await _repository.getList();

    return result;
  }
}
