import 'package:get/get.dart';
import '../../../data/services/budget_service.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  final BudgetService _budgetService = BudgetService();

  var budget = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadBudget();
  }

  void loadBudget() {
    double? savedBudget = _budgetService.getBudget();
    budget.value = savedBudget ?? 0.0;
  }

  String formatRupiah(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return formatter.format(amount);
  }
}
