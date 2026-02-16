import 'package:get/get.dart';
import '../../../data/services/budget_service.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final BudgetService _budgetService = BudgetService();

  @override
  void onInit() {
    super.onInit();
    checkBudget();
  }

  void checkBudget() async {
    await Future.delayed(Duration(seconds: 3));

    var budget = _budgetService.getBudget();

    if (budget == null) {
      Get.offAllNamed(Routes.SET_BUDGET);
    } else {
      Get.offAllNamed(Routes.DASHBOARD);
    }
  }
}
