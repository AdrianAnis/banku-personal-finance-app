import 'package:hive/hive.dart';

class BudgetService {
  final Box _box = Hive.box('budgetBox');

  double getBudget() {
    return _box.get('monthlyBudget', defaultValue: 0.0);
  }

  void saveBudget(double amount) {
    _box.put('monthlyBudget', amount);
  }

  void clearBudget() {
    _box.delete('monthlyBudget');
  }
}
