import 'package:flutter/material.dart';

import 'package:hello_flutter/Controllers/ConverterController.dart';
import 'package:hello_flutter/widgets/NavBar.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  double _inputValue = 0;
  double _resultValue = 0;

  final _inputController = TextEditingController();
  final ConverterController _controller = ConverterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Flutter Converter',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
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
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter kilometers',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultValue =
                        double.parse(_controller.convert(_inputValue));
                    // вызываем метод контроллера для конвертации
                  });
                },
                child: const Text('Convert'),
              ),
              const SizedBox(height: 32),
              const Text(
                'Miles',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                _resultValue.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          )),
        ));
  }
}
