import 'package:banku/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/set_budget_controller.dart';

class SetBudgetView extends GetView<SetBudgetController> {
  const SetBudgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Atur Budget Kamu',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Masukkan jumlah budget bulanan kamu untuk\nmulai mengelola keuangan dengan lebih baik.',
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 60),
              Text(
                'Jumlah Budget',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: controller.budgetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Rp 2.000.000',
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: AppColors.softGray),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.softyellow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.accent),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.accent),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Budget ini akan digunakan untuk membantu kamu mengelola keuangan dengan lebih baik.',
                        style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    controller.saveBudget();
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
