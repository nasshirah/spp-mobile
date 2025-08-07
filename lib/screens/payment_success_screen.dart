import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Success Icon
            const Icon(Icons.verified, size: 60, color: Colors.green),
            const SizedBox(height: 12),

            /// Title
            const Text(
              'Payment Successful',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            /// Penerima
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Penerima', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                    'SMK TARUNA BHAKTI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Bank Syariah Indonesia - 12345678'),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Divider(),

            /// Detail Transaksi
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Detail Transaksi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 12),

            _buildRow('Nominal Transfer', 'Rp 600.000'),
            _buildRow('Jenis Pembayaran', 'Lunas'),
            _buildRow('Metode Transfer', 'BI Fast'),
            _buildRow('Tanggal Transaksi', '10 Juni 2025'),

            const SizedBox(height: 16),
            const Divider(thickness: 1),
            _buildRow(
              'Total Transaksi',
              'Rp 600.000',
              isBold: true,
              hasBottomBorder: true,
            ),
            const SizedBox(height: 16),

            /// Rekening Sumber
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rekening Sumber', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                    'Fathia Litakuna',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Bank Mandiri - ........2234'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value,
      {bool isBold = false, bool hasBottomBorder = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(
              value,
              style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
        if (hasBottomBorder)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Divider(thickness: 1),
          ), 
        const SizedBox(height: 10),
      ],
    );
  }
}
