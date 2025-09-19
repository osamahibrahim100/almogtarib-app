import 'package:flutter/material.dart';

class DonationDetailsScreen extends StatelessWidget {
  final String beneficiaryName;
  final List<Map<String, dynamic>> donations;

  DonationDetailsScreen({required this.beneficiaryName, required this.donations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تبرعات $beneficiaryName",
        style: TextStyle(
          color: Colors.white,
        ) ,),
        backgroundColor: Color(0xFF0b3355),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: donations.isEmpty
          ? Center(child: Text("لا توجد تبرعات بعد", style: TextStyle(fontSize: 18)))
          : ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: donations.length,
        itemBuilder: (context, index) {
          final donation = donations[index];
          return ListTile(
            leading: Icon(Icons.person, color: Color(0xFF0b3355)),
            title: Text(donation['name']),
            trailing: Text("${donation['amount']} ريال"),
          );
        },
      ),
    );
  }
}
