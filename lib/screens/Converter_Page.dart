import 'package:flutter/material.dart';
import 'package:hello_flutter/NavBar.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  double _inputValue = 0;
  double _resultValue = 0;

  final _inputController = TextEditingController();

  void _convert() {
    setState(() {
      _resultValue = _inputValue * 0.621371;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Converter',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            'Kilometers',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _inputValue = double.tryParse(value) ?? 0;
                  // if (double.tryParse(value) != null) {
                  //   _inputValue = double.tryParse(value);
                  // } else {
                  //   _inputValue = 0;
                  // }
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter kilometers',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _convert,
            child: const Text('Convert'),
          ),
          const SizedBox(height: 32),
          const Text(
            'Miles',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            '$_resultValue',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      )),
    );
  }
}
