import 'package:flutter/material.dart';
import 'select_payment_method_screen.dart';
import 'payment_success_screen.dart';

class PaymentFormScreen extends StatefulWidget {
  final String? initialMonth;
  const PaymentFormScreen({super.key, this.initialMonth});

  @override
  State<PaymentFormScreen> createState() => _PaymentFormScreenState();
}

class _PaymentFormScreenState extends State<PaymentFormScreen> {
  String selectedCategory = 'E-Wallet';
  String? selectedMethod;
  final TextEditingController monthController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialMonth != null) {
      monthController.text = widget.initialMonth!;
    }
  }

  @override
  void dispose() {
    monthController.dispose();
    amountController.dispose();
    super.dispose();
  }

  Future<void> _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      helpText: 'Pilih Bulan Pembayaran',
      locale: const Locale('id', 'ID'),
    );

    if (picked != null) {
      setState(() {
        monthController.text = '${picked.month}-${picked.year}';
      });
    }
  }

  void _navigateToSelectMethod() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => SelectPaymentMethodScreen(category: selectedCategory),
      ),
    );

    if (result != null) {
      setState(() {
        selectedMethod = result;
      });
    }
  }

  void _handleSubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PaymentSuccessScreen(),
      ),
    );
  }

  String _getMonthName() {
    if (monthController.text.isEmpty) return '-';
    try {
      final parts = monthController.text.split('-');
      final monthNumber = int.parse(parts[0]);
      const monthNames = [
        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
      ];
      return monthNames[monthNumber - 1];
    } catch (e) {
      return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alert Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber, color: Colors.orange),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Pembayaran SPP bulan ${_getMonthName()} telah jatuh tempo',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Formulir Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Dropdown Kategori Pembayaran
            const Text('Metode Pembayaran'),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: const [
                DropdownMenuItem(value: 'E-Wallet', child: Text('E-Wallet')),
                DropdownMenuItem(value: 'Transfer Bank', child: Text('Transfer Bank')),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  selectedMethod = null;
                });
                _navigateToSelectMethod();
              },
            ),

            if (selectedMethod != null) ...[
              const SizedBox(height: 10),
              Text(
                'Metode yang dipilih: $selectedMethod',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],

            const SizedBox(height: 20),

            // Bulan Pembayaran
            const Text('Pembayaran Bulan'),
            const SizedBox(height: 6),
            TextField(
              controller: monthController,
              readOnly: true,
              onTap: () => _selectMonth(context),
              decoration: const InputDecoration(
                hintText: 'Masukkan Bulan',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Nominal
            const Text('Nominal'),
            const SizedBox(height: 6),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Masukkan Nominal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Bayar Sekarang
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
