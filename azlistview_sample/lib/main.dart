import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:azlistview_sample/azlist/model/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> itemList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    rootBundle.loadString('assets/itemList.json').then((value) {
      final List jsonMap = json.decode(value);
      for (var e in jsonMap) {
        itemList.add(Item.fromJson(e));
      }
      setSuspentionTag(itemList);
      setState(() {});
    });
  }

  void setSuspentionTag(List<Item> list) {
    if (list.isEmpty) return;
    for (int i = 0; i < list.length; i++) {
      String tag = list[i].name.substring(0, 1).toUpperCase();
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].suspentionTag = tag;
      } else {
        list[i].suspentionTag = "#";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AzListView(
        data: itemList,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(itemList[index].name));
        },
        indexBarWidth: 64,
      ),
    );
  }
}
