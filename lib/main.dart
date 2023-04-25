import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer_sample/widgets/list_widget.dart';
import 'package:shimmer_sample/widgets/shimmer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shimmer Sample'),
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
  ListWidget listWidget = ListWidget();
  ShimmerWidget shimmerWidget = ShimmerWidget();
  List data = [];

  loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/girl_images.json');
    setState(() => data = json.decode(jsonText));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      loadJsonData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: data.isEmpty
          ? shimmerWidget.getShimmer()
          : listWidget.getList(data),
    );
  }
}
