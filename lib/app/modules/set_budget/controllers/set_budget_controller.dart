import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/budget_service.dart';
import '../../../routes/app_pages.dart';

class SetBudgetController extends GetxController {
  final TextEditingController budgetController = TextEditingController();
  final BudgetService _budgetService = BudgetService();

  void saveBudget() {
    if (budgetController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Budget tidak boleh kosong",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    double amount =
        double.tryParse(
          budgetController.text.replaceAll('.', '').replaceAll(',', ''),
        ) ??
        0;
    if (amount <= 0) {
      Get.snackbar(
        "Error",
        "Masukkan angka yang valid",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    _budgetService.saveBudget(amount);

    Get.offAllNamed(Routes.DASHBOARD);
  }
}
