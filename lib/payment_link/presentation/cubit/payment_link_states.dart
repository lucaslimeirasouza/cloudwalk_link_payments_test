import '../../domain/entities/payment_link_entity.dart';

abstract class PaymentLinkState {}

class InitialPaymentLinkState extends PaymentLinkState {}

class LoadingPaymentLinkState extends PaymentLinkState {}

class PaymentLinkScreenState extends PaymentLinkState {}

class DetailsScreenState extends PaymentLinkState {
  final PaymentLinkEntity paymentLink;

  DetailsScreenState(this.paymentLink);
}

class ApprovedScreenState extends PaymentLinkState {
  final PaymentLinkEntity paymentLink;

  ApprovedScreenState(this.paymentLink);
}

class DeniedScreenState extends PaymentLinkState {}

class LinkPaymentErrorPaymentLinkState extends PaymentLinkState {
  final String message;

  LinkPaymentErrorPaymentLinkState(this.message);
}

class CreditCardErrorPaymentLinkState extends PaymentLinkState {}


// class PaymentLinkScreenState extends PaymentLinkState {
//   final List<PaymentLinkEntity> list;

//   PaymentLinkScreenState(this.list);
// }
// class LoadedPaymentLinkState extends PaymentLinkState {
//   final List<PaymentLinkEntity> list;

//   LoadedPaymentLinkState(this.list);
// }
