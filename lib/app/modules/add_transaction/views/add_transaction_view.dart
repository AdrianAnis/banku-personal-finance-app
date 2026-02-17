import 'package:banku/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  const AddTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tambah Transaksi",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),

      // ================= BODY =================
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ================= TYPE SELECTOR =================
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Pengeluaran"),
                        selected: controller.selectedType.value == "expense",
                        onSelected: (_) {
                          controller.selectedType.value = "expense";
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Pemasukan"),
                        selected: controller.selectedType.value == "income",
                        onSelected: (_) {
                          controller.selectedType.value = "income";
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= JUMLAH =================
              const Text(
                'Masukkan Jumlah',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: controller.amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Rp 0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ================= KATEGORI =================
              const Text(
                'Kategori',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: "Makanan", child: Text("Makanan")),
                  DropdownMenuItem(
                    value: "Transportasi",
                    child: Text("Transportasi"),
                  ),
                  DropdownMenuItem(value: "Belanja", child: Text("Belanja")),
                  DropdownMenuItem(value: "Tagihan", child: Text("Tagihan")),
                  DropdownMenuItem(value: "Hiburan", child: Text("Hiburan")),
                  DropdownMenuItem(value: "Gaji", child: Text("Gaji")),
                  DropdownMenuItem(value: "Bonus", child: Text("Bonus")),
                  DropdownMenuItem(value: "Bisnis", child: Text("Bisnis")),
                  DropdownMenuItem(value: "Lainnya", child: Text("Lainnya")),
                ],
                onChanged: (value) {
                  controller.categoryController.text = value ?? "";
                },
              ),

              const SizedBox(height: 25),

              // ================= TANGGAL =================
              const Text(
                'Tanggal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Obx(
                () => ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  title: Text(
                    "${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}",
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate.value,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null) {
                      controller.selectedDate.value = picked;
                    }
                  },
                ),
              ),

              const SizedBox(height: 25),

              // ================= CATATAN =================
              const Text(
                'Catatan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  hintText: 'Masukkan catatan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ================= BUTTON =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.saveTransaction,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    "Simpan Transaksi",
                    style: TextStyle(fontSize: 16),
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
