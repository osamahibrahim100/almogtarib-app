import 'package:flutter/material.dart';
import 'DonationScreen.dart';
import 'donation_screen.dart';
import 'donation_details_screen.dart'; // استيراد شاشة تفاصيل التبرع


class BeneficiariesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> beneficiaries = [
    {
      'name': 'أحمد علي',
      'goal': 5000,
      'collected': 2500,
      'image': Icons.person,
      'donations': [
        {'name': 'فهد', 'amount': 500},
        {'name': 'سلمان', 'amount': 2000},
      ],
    },
    {
      'name': 'محمد سعيد',
      'goal': 3000,
      'collected': 1800,
      'image': Icons.person,
      'donations': [
        {'name': 'ليلى', 'amount': 800},
        {'name': 'علي', 'amount': 1000},
      ],
    },
    {
      'name': 'خالد يوسف',
      'goal': 7000,
      'collected': 3500,
      'image': Icons.person,
      'donations': [
        {'name': 'سعيد', 'amount': 1500},
        {'name': 'نور', 'amount': 2000},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المستفيدون",
          style: TextStyle(
            color: Colors.white, // هنا الخط أصبح أبيض
            fontSize: 20,        // يمكنك تعديل حجم الخط إذا أحببت
            fontWeight: FontWeight.bold, // إذا تريد الخط عريض

          ),
        ),
        backgroundColor: Color(0xFF0b3355),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: beneficiaries.length,
        itemBuilder: (context, index) {
          final item = beneficiaries[index];
          double progress = item['collected'] / item['goal'];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFF0b3355),
                        child: Icon(item['image'], color: Colors.white, size: 30),
                      ),
                      SizedBox(width: 12),
                      Text(
                        item['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0b3355),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    color: Color(0xFF0b3355),
                    minHeight: 8,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "تم جمع ${item['collected']} من ${item['goal']} ريال",
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationScreen(
                                name: item['name'],
                                goal: item['goal'],
                                collected: item['collected'],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0b3355),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("تبرع",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationDetailsScreen(
                                beneficiaryName: item['name'],
                                donations: item['donations'] ?? [],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("تفاصيل التبرع",
                        style: TextStyle(
                          color: Colors.blue[1000],
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
