import 'package:banku/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: Obx(
          () => Text(
            "Budget Kamu: ${controller.formatRupiah(controller.budget.value)}",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTransactionOptions(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showTransactionOptions(BuildContext context) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Manual"),
            onTap: () {
              Get.toNamed(Routes.ADD_TRANSACTION);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Scan"),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
