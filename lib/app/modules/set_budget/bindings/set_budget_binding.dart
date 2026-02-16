import 'package:get/get.dart';

import '../controllers/set_budget_controller.dart';

class SetBudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetBudgetController>(
      () => SetBudgetController(),
    );
  }
}
