import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  final String name;   // اسم المستفيد
  final int goal;      // المبلغ المطلوب
  final int collected; // المبلغ المجموع

  DonationScreen({
    required this.name,
    required this.goal,
    required this.collected,
  });

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تبرع لـ ${widget.name}",
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Color(0xFF0b3355),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "المبلغ المطلوب: ${widget.goal} ريال",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "تم جمع: ${widget.collected} ريال",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "ادخل مبلغ التبرع",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_amountController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "تم تسجيل تبرعك بمبلغ ${_amountController.text} ريال. بانتظار تأكيد المدير.",
                      ),
                      backgroundColor: Color(0xFF0b3355),
                    ),
                  );
                  _amountController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0b3355),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "تأكيد التبرع",
                style: TextStyle(fontSize: 16,
                color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
