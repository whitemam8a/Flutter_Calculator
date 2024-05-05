import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/Controllers/CalculatorController.dart';
import 'package:hello_flutter/widgets/NavBar.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  CalculatorController controller = CalculatorController();
  List<String> expressions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: controller.history,
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('History').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
            // Отображаем индикатор загрузки пока данные загружаются
          }
          if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // В случае ошибки отображаем сообщение об ошибке
          }

          List<Widget> resultsWidgets = [];
          if (snapshot.hasData) {
            final results = snapshot.data?.docs.reversed.toList();
            for (var result in results!) {
              final resultWidget = ListTile(
                title: Text('${result["expression"]} = ${result["result"]}.'),
                subtitle: Text(result["date"]),
              );
              resultsWidgets.add(resultWidget);
            }
          }

          return Expanded(
            child: ListView(
              children: resultsWidgets.reversed.toList(),
            ),
          );
        },
      ),
    );
  }
}
