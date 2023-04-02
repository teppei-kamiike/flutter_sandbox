import 'package:animation_sample/animations/top_center_to_bottom_center.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Sample',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animation List'),
      routes: Map.fromIterables(
          samples.map((e) => e.path), samples.map((e) => e.builder)),
    );
  }
}

class Sample {
  const Sample({required this.name, required this.path, required this.builder});
  final String name;
  final String path;
  final WidgetBuilder builder;
}

final samples = [
  Sample(
      name: 'top center to bottom center screen',
      path: '/sample1',
      builder: (_) => const TopCenterToBottomCenterScreen()),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: samples.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(samples[index].name),
            onTap: () {
              Navigator.of(context).pushNamed(samples[index].path,
                  arguments: samples[index].name);
            },
          );
        },
      ),
    );
  }
}
