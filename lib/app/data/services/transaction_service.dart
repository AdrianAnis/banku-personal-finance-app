import 'package:hive/hive.dart';
import '../models/transaction_model.dart';
import 'budget_service.dart';

class TransactionService {
  // 1️⃣ Ambil box transaksi dari Hive
  final Box _box = Hive.box('transactionBox');

  // 2️⃣ Buat instance BudgetService
  final BudgetService _budgetService = BudgetService();

  // 3️⃣ Method untuk menambah transaksi
  void addTransaction(TransactionModel transaction) {
    // Simpan transaksi ke Hive
    _box.put(transaction.id, transaction.toMap());
    double currentBudget = _budgetService.getBudget();
    if (transaction.type == "expense") {
      // Jika pengeluaran → kurangi budget
      currentBudget -= transaction.amount;
    } else {
      currentBudget += transaction.amount;
    }
    _budgetService.saveBudget(currentBudget);
  }

  List<TransactionModel> getTransactions() {
    final data = _box.values.toList();

    return data
        .map(
          (item) => TransactionModel.fromMap(Map<String, dynamic>.from(item)),
        )
        .toList();
  }

  void updateTransaction(TransactionModel transaction) {
    _box.put(transaction.id, transaction.toMap());
  }
  void deleteTransaction(String id) {
    _box.delete(id);
  }
}
