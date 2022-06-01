import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/provider_state_management/counter_state_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Counter()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Count Counter Application'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        //backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            _getSizedBox(),
            Text(
              '${context.watch<Counter>().counterValue}',
              style: Theme.of(context).textTheme.headline6,
            ),
            _getSizedBox(),
            getElevatedButton("Increment", () => counter.incrementCounter()),
            _getSizedBox(),
            getElevatedButton("Decrement", () => counter.decrementCounter()),
            _getSizedBox(),
            getElevatedButton("Reset", () => counter.resetCounter())
          ],
        ),
      ),
    );
  }
}

Widget getElevatedButton(String? data, void Function()? onPress) {
  return ElevatedButton(
    onPressed: onPress,
    clipBehavior: Clip.hardEdge,
    child: SizedBox(
      width: 100,
      child: Text(
        data ?? '',
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget _getSizedBox() {
  return const SizedBox(
    height: 5,
  );
}
