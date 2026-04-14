import 'package:flutter/material.dart';

void main() {
  runApp(const AlaGlassApp());
}

class AlaGlassApp extends StatelessWidget {
  const AlaGlassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int revenue = 0;
  final car = TextEditingController();
  final amount = TextEditingController();

  List<Map<String, dynamic>> sales = [];

  void addSale() {
    setState(() {
      int value = int.tryParse(amount.text) ?? 0;
      sales.add({"car": car.text, "amount": value});
      revenue += value;
      car.clear();
      amount.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ala Glass App")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            child: ListTile(
              title: const Text("Total Revenue"),
              trailing: Text("$revenue TND"),
            ),
          ),
          TextField(
            controller: car,
            decoration: const InputDecoration(hintText: "Car model"),
          ),
          TextField(
            controller: amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Amount"),
          ),
          ElevatedButton(
            onPressed: addSale,
            child: const Text("Add Sale"),
          ),
          const Divider(),
          ...sales.map((s) => ListTile(
                title: Text(s["car"]),
                trailing: Text("${s["amount"]} TND"),
              )),
        ],
      ),
    );
  }
}
