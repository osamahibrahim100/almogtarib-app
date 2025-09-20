import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // قائمة تجريبية للمستفيدين
  List<Map<String, dynamic>> beneficiaries = [
    {'name': 'أحمد علي', 'goal': 5000, 'collected': 2500},
    {'name': 'محمد سعيد', 'goal': 3000, 'collected': 1800},
  ];

  final TextEditingController _newBeneficiaryController = TextEditingController();
  final TextEditingController _donorNameController = TextEditingController();
  final TextEditingController _donationAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "لوحة الإدارة",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0b3355),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // قسم إضافة مستفيد جديد
            Text(
              "إضافة مستفيد جديد",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _newBeneficiaryController,
              decoration: InputDecoration(
                labelText: "اسم المستفيد",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (_newBeneficiaryController.text.isNotEmpty) {
                  setState(() {
                    beneficiaries.add({
                      'name': _newBeneficiaryController.text,
                      'goal': 0,
                      'collected': 0
                    });
                  });
                  _newBeneficiaryController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("تم إضافة مستفيد جديد")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0b3355),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "إضافة",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // قسم تأكيد التبرعات
            Text(
              "تأكيد التبرعات",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _donorNameController,
              decoration: InputDecoration(
                labelText: "اسم المتبرع",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _donationAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "المبلغ",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (_donorNameController.text.isNotEmpty &&
                    _donationAmountController.text.isNotEmpty) {
                  // هنا يمكنك ربط التبرع بالمستفيد المناسب
                  _donorNameController.clear();
                  _donationAmountController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("تم تسجيل التبرع بنجاح")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("تأكيد التبرع",
              style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // قسم قائمة المستفيدين
            Text(
              "المستفيدون الحاليون",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            ...beneficiaries.map((b) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(b['name']),
                  subtitle: Text("المبلغ المجموع: ${b['collected']} / الهدف: ${b['goal']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          // كود لتعديل المستفيد
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            beneficiaries.remove(b);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
