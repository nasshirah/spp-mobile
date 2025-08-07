import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: const [
          NotificationItem(
            title: "Pembayaran bulan juni sudah jatuh tempo",
            date: "10 Juni 2025",
            time: "12 : 50",
          ),
          NotificationItem(
            title: "Tunggakan pembayaran bulan mei",
            date: "10 Mei 2025",
            time: "11 : 55",
          ),
          NotificationItem(
            title: "Tunggakan pembayaran bulan januari",
            date: "10 Jan 2025",
            time: "10 : 55",
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  const NotificationItem({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const Icon(Icons.chat_bubble_outline, size: 32, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '$date   •   $time',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
