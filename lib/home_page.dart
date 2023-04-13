import 'package:bluetooth_print_test/print_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {'title': 'Cadbury dairy milk', 'price': 15, 'qty': 2},
    {'title': 'Parle-G Gluco Biscut', 'price': 5, 'qty': 5},
    {'title': 'Fresh Onion -1KG', 'price': 20, 'qty': 1},
    {'title': 'Fresh Sweet Lime', 'price': 20, 'qty': 1},
    {'title': 'Maggi', 'price': 20, 'qty': 5},
  ];

  final f = NumberFormat("\$######", "en_US");

  @override
  Widget build(BuildContext context) {
    int _total = 0;
    _total = data.map((e) => e['price'] * e['qty']).reduce((value, element) => value + element);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter - thermal Printer'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(
                      data[i]['title'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${f.format(data[i]['price'])} x ${data[i]['qty']}",
                    ),
                  );
                })),
        Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(
                      data[i]['title'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${f.format(data[i]['price'])} x ${data[i]['qty']}",
                    ),
                  );
                })),
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PrintPage(data)));
            },
            icon: const Icon(Icons.print),
            label: const Text('Print'),
          ),
        ),
      ]),
    );
  }
}
