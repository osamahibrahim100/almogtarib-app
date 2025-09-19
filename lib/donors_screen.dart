import 'package:flutter/material.dart';

class DonorsScreen extends StatelessWidget {
  // بيانات تجريبية للمتبرعين
  final List<Map<String, dynamic>> donors = [
    {
      'name': 'فهد',
      'amount': 500,
      'date': '2025-09-12',
    },
    {
      'name': 'سلمان',
      'amount': 2000,
      'date': '2025-09-13',
    },
    {
      'name': 'ليلى',
      'amount': 800,
      'date': '2025-09-13',
    },
    {
      'name': 'علي',
      'amount': 1000,
      'date': '2025-09-14',
    },
    {
      'name': 'سعيد',
      'amount': 1500,
      'date': '2025-09-14',
    },
    {
      'name': 'نور',
      'amount': 2000,
      'date': '2025-09-14',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المتبرعون",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0b3355),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // زر الرجوع أبيض
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: donors.length,
        itemBuilder: (context, index) {
          final donor = donors[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF0b3355),
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                donor['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("التاريخ: ${donor['date']}"),
              trailing: Text(
                "${donor['amount']} ريال",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0b3355),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
