import 'package:cloudwalk_link_payment_test/payment_link/data/providers/ipayment_link_provider.dart';
import 'package:cloudwalk_link_payment_test/payment_link/data/providers/payment_link_provider.dart';
import 'package:cloudwalk_link_payment_test/payment_link/data/repositories/payment_link_repository.dart';
import 'package:cloudwalk_link_payment_test/payment_link/domain/repositories/ipayment_link_repository.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void setupDi() {
  _repositories();
  _providers();
}

void _repositories() {
  di.registerLazySingleton<IPaymentLinkRepository>(
      () => PaymentLinkRepository());
}

void _providers() {
  di.registerFactory<IPaymentLinkProvider>(() => PaymentLinkProvider());
}
