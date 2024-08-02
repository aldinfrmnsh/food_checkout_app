import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orderHistory;

  OrderHistoryPage({required this.orderHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Riwayat Pesanan'),
      ),
      body: ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          final order = orderHistory[index];
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            color: Colors.green[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  order['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                order['name'],
                style:
                    TextStyle(color: Colors.white), // White milk color for text
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumlah: ${order['quantity']}',
                    style: TextStyle(
                        color: Colors.white70), // White milk color for text
                  ),
                  Text(
                    'Tanggal: ${order['date']}',
                    style: TextStyle(
                        color: Colors.white30), // White milk color for text
                  ),
                ],
              ),
              trailing: Text(
                'Rp ${order['price'] * order['quantity']}',
                style:
                    TextStyle(color: Colors.white), // White milk color for text
              ),
            ),
          );
        },
      ),
    );
  }
}
