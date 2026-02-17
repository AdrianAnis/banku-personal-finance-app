import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/transaction_model.dart';
import '../../../data/services/transaction_service.dart';

class AddTransactionController extends GetxController {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final categoryController = TextEditingController();

  var selectedType = "expense".obs;
  var selectedDate = DateTime.now().obs;

  final TransactionService _transactionService = TransactionService();

  void saveTransaction() {
    if (amountController.text.isEmpty ||
        titleController.text.isEmpty ||
        categoryController.text.isEmpty) {
      Get.snackbar("Error", "Semua field wajib diisi");
      return;
    }

    double amount = double.tryParse(amountController.text) ?? 0;

    if (amount <= 0) {
      Get.snackbar("Error", "Nominal tidak valid");
      return;
    }

    final transaction = TransactionModel(
      id: const Uuid().v4(),
      amount: amount,
      type: selectedType.value,
      title: titleController.text,
      category: categoryController.text,
      date: selectedDate.value,
    );

    _transactionService.addTransaction(transaction);

    Get.back();
  }
}
