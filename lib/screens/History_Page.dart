import 'package:flutter/material.dart';
import 'package:hello_flutter/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> expressions = [];

  Future<List<String>> loadExpressions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> expressions = prefs.getStringList('expressions') ?? [];
    return expressions;
  }

  @override
  void initState() {
    super.initState();
    loadExpressions().then((loadedExpressions) {
      setState(() {
        expressions = loadedExpressions;
      });
    });
  }

  void clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      expressions.clear();
    });
  }

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
            icon: Icon(Icons.delete),
            onPressed: clearSharedPreferences,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: expressions.length,
        itemBuilder: (context, index) {
          final reversedIndex = expressions.length - index - 1;
          List<String> parts = expressions[reversedIndex].split(' | ');
          String expression = parts[0];
          String result = parts[1];
          String date = parts[2];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text('$expression = $result.'),
              subtitle: Text(date),
            ),
          );
        },
      ),
    );
  }
}
