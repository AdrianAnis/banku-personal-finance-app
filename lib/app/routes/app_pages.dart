import 'package:get/get.dart';

import '../modules/add_transaction/bindings/add_transaction_binding.dart';
import '../modules/add_transaction/views/add_transaction_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/set_budget/bindings/set_budget_binding.dart';
import '../modules/set_budget/views/set_budget_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SET_BUDGET,
      page: () => SetBudgetView(),
      binding: SetBudgetBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TRANSACTION,
      page: () => const AddTransactionView(),
      binding: AddTransactionBinding(),
    ),
  ];
}
