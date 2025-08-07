import 'package:flutter/material.dart';
import 'package:spp_mobile/screens/payment_from_screen.dart';

class TunggakanScreen extends StatelessWidget {
  const TunggakanScreen({super.key});

  final List<String> bulanTunggakan = const ['Mei', 'Juni', 'Juli'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tunggakan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        itemCount: bulanTunggakan.length,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2563EB),
                ),
                child: const Icon(
                  Icons.money,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(bulanTunggakan[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // navigator 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentFormScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
