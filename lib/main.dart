import './get_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World time',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'World Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //抓資料+

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: List.generate(
          country.length,
          (i) => ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.flag),
            ),
            title: Text(country[i]),
            onTap: () {show(i,context);},
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.chrome_reader_mode),
              ),
              title: const Text('選項一'),
              onTap: () {},
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.chrome_reader_mode),
              ),
              title: const Text('選項二'),
              onTap: () {},
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.chrome_reader_mode),
              ),
              title: const Text('選項三'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
