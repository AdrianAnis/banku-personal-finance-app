import 'package:hive/hive.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final Box _box = Hive.box('transactionBox');

  void addTransaction(TransactionModel transaction) {
    _box.put(transaction.id, transaction.toMap());
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
