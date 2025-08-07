import 'package:flutter/material.dart';
import 'package:spp_mobile/screens/payment_success_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<Map<String, String>> paymentHistory = const [
    {'month': 'Januari', 'date': '10 Jan 2025'},
    {'month': 'Februari', 'date': '09 Feb 2025'},
    {'month': 'Maret', 'date': '15 Mar 2025'},
    {'month': 'April', 'date': '20 Apr 2025'},
    {'month': 'Mei', 'date': '01 Mei 2025'},
    {'month': 'Juni', 'date': '05 Jun 2025'},
    {'month': 'Juli', 'date': '30 Jul 2025'},
    {'month': 'Agustus', 'date': '18 Agu 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: paymentHistory.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = paymentHistory[index];
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF2563EB),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.monetization_on, color: Colors.white),
            ),
            title: Text(
              item['month']!,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(item['date']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // navigator
              Navigator.push(
              context,
              MaterialPageRoute(builder: (contaxt) => const PaymentSuccessScreen()),
            );

            },
          );
        },
      ),
    );
  }
}
