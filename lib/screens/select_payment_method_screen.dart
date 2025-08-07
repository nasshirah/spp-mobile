import 'package:flutter/material.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  final String category;
  const SelectPaymentMethodScreen({super.key, required this.category});

  @override
  State<SelectPaymentMethodScreen> createState() => _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  String? selectedMethod;

  final List<Map<String, String>> ewallets = [
    {'name': 'Gopay', 'icon': 'assets/gopay.png'},
    {'name': 'Dana', 'icon': 'assets/dana.png'},
    {'name': 'Ovo', 'icon': 'assets/ovo.png'},
    {'name': 'LinkAja', 'icon': 'assets/linkaja.png'},
  ];

  final List<Map<String, String>> banks = [
    {'name': 'Mandiri', 'icon': 'assets/mandiri.png'},
    {'name': 'BCA', 'icon': 'assets/bca.png'},
    {'name': 'BRI', 'icon': 'assets/bri.png'},
    {'name': 'BNI', 'icon': 'assets/bni.png'},
    {'name': 'Citibank', 'icon': 'assets/citibank.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final isEwallet = widget.category == 'E-Wallet';
    final List<Map<String, String>> methods = isEwallet ? ewallets : banks;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FB),
      appBar: AppBar(
        title: Text(widget.category),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          /// Alert
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.info, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Cash on Delivery is not available. Please select another method.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: methods.length,
              itemBuilder: (context, index) {
                final item = methods[index];
                return ListTile(
                  leading: Image.asset(item['icon']!, width: 30, height: 30),
                  title: Text(item['name']!),
                  trailing: Radio<String>(
                    value: item['name']!,
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      selectedMethod = item['name'];
                    });
                  },
                );
              },
            ),
          ),

          /// Select Button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: selectedMethod == null
                  ? null
                  : () {
                      Navigator.pop(context, selectedMethod);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedMethod == null
                    ? Colors.grey.shade400
                    : const Color(0xFF2563EB),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Select Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
