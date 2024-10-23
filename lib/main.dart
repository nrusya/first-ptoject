import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();
  String _feedback = '';

  void _incrementCounter([int incrementBy = 1]) {
    setState(() {
      _counter += incrementBy;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _feedback = 'Counter reset by magic!';
    });
  }

  void _handleInput(String input) {
    setState(() {
      if (input == 'Avada Kedavra') {  // Одинарні лапки
        _resetCounter();
      } else {
        final value = int.tryParse(input);
        if (value != null) {
          _incrementCounter(value);
          _feedback = 'Added $value to the counter!';
        } else {
          _feedback = 'Please enter a valid number or try the magic phrase!';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a number or magic word',
                ),
                onSubmitted: _handleInput,
              ),
            ),
            Text(
              _feedback,
              style: TextStyle(
                color: _feedback.contains('magic') ? Colors.red : Colors.green, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment by 1',
        child: const Icon(Icons.add),
      ),
    );
  }
}
