import 'package:flutter/material.dart';
import 'package:spp_mobile/screens/payment_from_screen.dart';
import 'package:spp_mobile/screens/tunggakan_screen.dart';
import 'package:spp_mobile/screens/history_screen.dart';
import 'package:spp_mobile/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.account_circle_outlined),
                    SizedBox(width: 8),
                    Text(
                      "Halo, Abhista",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                // Navigasi Notification
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            /// Menu Button 1 - Form Pembayaran Bulanan
            _buildMenuButton(
              title: 'Form Pembayaran Bulanan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentFormScreen(),
                  ),
                );
              },
            ),

            /// Menu Button 2 - Tunggakan
            _buildMenuButton(
              title: 'Tunggakan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TunggakanScreen(),
                  ),
                );
              },
            ),

            /// Menu Button 3 - Laporan Pembayaran
            _buildMenuButton(
              title: 'Laporan Pembayaran',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({required String title, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
