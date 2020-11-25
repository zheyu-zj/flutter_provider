import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider.value(value: new Counter())],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SecondPage();
                },
              ),
            ),
            child: Text('下一页'),
          )
        ],
      ),
      body: Center(
        child: Text('${number.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          number.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: Text("${number.count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          number.decrement();
        },
        child: Icon(Icons.remove),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
