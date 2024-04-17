import 'package:bloc/bloc.dart';
import 'package:cloudwalk_link_payment_test/payment_link/presentation/cubit/payment_link_states.dart';

import '../../domain/entities/payment_link_entity.dart';

import '../../domain/usecase/ipayment_link_usecase.dart';
import '../../domain/usecase/payment_link_usecase.dart';

class PaymentLinkCubit extends Cubit<PaymentLinkState> {
  IPaymentLinkUsecase usecase = PaymentLinkUsecase();
  PaymentLinkCubit() : super(InitialPaymentLinkState());
  // final IPaymentLinkUsecase usecase;
  // PaymentLinkCubit(this.usecase) : super(InitialPaymentLinkState());

  List<PaymentLinkEntity> getListLink = [];
  late PaymentLinkEntity paymentLinkFilter;

  Future<void> inicialPage() async {
    emit(PaymentLinkScreenState());
  }

  Future<void> getLinkPayment(String paymentLink) async {
    try {
      emit(LoadingPaymentLinkState());

      getListLink = await usecase.getList();
      Iterable<PaymentLinkEntity> paymentLinkListFilter = getListLink.where(
        (element) => element.transactionId == paymentLink,
      );

      paymentLinkFilter = paymentLinkListFilter.elementAt(0);

      emit(DetailsScreenState(paymentLinkFilter));
    } catch (e) {
      emit(LinkPaymentErrorPaymentLinkState("$e"));
    }
  }

  Future<void> getResponsePayment(String creditNumber) async {
    try {
      emit(LoadingPaymentLinkState());

      if (paymentLinkFilter.cardNumber == creditNumber) {
        if (paymentLinkFilter.hasCbk == 'TRUE') {
          emit(DeniedScreenState());
        } else {
          emit(ApprovedScreenState(paymentLinkFilter));
        }
      } else {
        emit(CreditCardErrorPaymentLinkState());
        creditCardReset();
      }
    } catch (e) {
      CreditCardErrorPaymentLinkState();
    }
  }

  reset() {
    getListLink = [];
    emit(PaymentLinkScreenState());
  }

  linkPaymentReset() {
    getListLink = [];
    emit(PaymentLinkScreenState());
  }

  creditCardReset() {
    emit(DetailsScreenState(paymentLinkFilter));
  }

  // Future<void> getList() async {
  //   try {
  //     emit(LoadingPaymentLinkState());

  //     getListLink = await refinancingUsecase.getList();

  //     emit(PaymentLinkScreenState(getListLink));
  //   } catch (e) {
  //     emit(ErrorPaymentLinkState("$e"));
  //   }
  // }
}
