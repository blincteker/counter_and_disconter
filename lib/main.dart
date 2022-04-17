import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Counter());
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo do Rodolfo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(message: 'Contador e Descontador'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (_counter <= 0) {
        _counter = 0;
        showErrorMessage();
        return;
      }
      _counter--;
    });
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Aviso!'),
              content: const Text(
                  'Não é possível deixar o contador com valores negativos.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.message),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('O valor atual do seu contador é:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline2,
              )
            ]),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        FloatingActionButton(
          onPressed: () => {decrementCounter()},
          child: const Icon(Icons.remove),
          tooltip: 'Decrement',
          heroTag: null,
        ),
        FloatingActionButton(
          onPressed: () => {incrementCounter()},
          child: const Icon(Icons.add),
          tooltip: 'Increment',
          heroTag: null,
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(213, 141, 247, 21),
        child: Container(
          height: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
