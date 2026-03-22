import 'package:flutter/material.dart';

void main() {
  runApp(const DiscountCalculatorApp());
}

class DiscountCalculatorApp extends StatelessWidget {
  const DiscountCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discount Calculator',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF6F1EB)),
      home: const DiscountCalculatorScreen(),
    );
  }
}

class DiscountCalculatorScreen extends StatefulWidget {
  const DiscountCalculatorScreen({super.key});

  @override
  State<DiscountCalculatorScreen> createState() =>
      _DiscountCalculatorScreenState();
}

class _DiscountCalculatorScreenState extends State<DiscountCalculatorScreen> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  double discountAmount = 0.0;
  double finalPrice = 0.0;

  void calculateDiscount() {
    final double price = double.tryParse(priceController.text) ?? 0.0;
    final double discount = double.tryParse(discountController.text) ?? 0.0;

    setState(() {
      discountAmount = price * discount / 100;
      finalPrice = price - discountAmount;
    });
  }

  void clearFields() {
    setState(() {
      priceController.clear();
      discountController.clear();
      discountAmount = 0.0;
      finalPrice = 0.0;
    });
  }

  Widget saleTagImage({
    required double top,
    required double left,
    required double angle,
    required double width,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child: Opacity(
          opacity: 0.18,
          child: Image.asset('lib/assets/sale_tag.png', width: width),
        ),
      ),
    );
  }

  InputDecoration customInputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF9F9F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFE58C8C), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          saleTagImage(top: 60, left: 20, angle: -0.4, width: 120),
          saleTagImage(top: 100, left: 280, angle: 0.3, width: 100),
          saleTagImage(top: 520, left: 10, angle: 0.35, width: 110),
          saleTagImage(top: 610, left: 260, angle: -0.35, width: 120),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: Column(
                              children: [
                                Text(
                                  'Discount Calculator',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Calculate your savings instantly',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: customInputDecoration(
                              'Original Price',
                              'Enter price',
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: discountController,
                            keyboardType: TextInputType.number,
                            decoration: customInputDecoration(
                              'Discount Percentage',
                              'Enter discount %',
                            ),
                          ),
                          const SizedBox(height: 28),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: calculateDiscount,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE58C8C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Calculate Discount',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: OutlinedButton(
                              onPressed: clearFields,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFFE58C8C),
                                side: const BorderSide(
                                  color: Color(0xFFE58C8C),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Clear',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5F5),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Discount Amount: ${discountAmount.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Final Price: ${finalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC85C5C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
