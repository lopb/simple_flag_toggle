// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:simple_flag_toggle/simple_flag_toggle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});
  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  static final List<String> _flagList = ["us", "br", "ca"];
  FlagBar appBarToggle = FlagBar(
    flagList: _flagList,
    initialIndex: 1,
    onChanged: (index) {
      print(
          "AppBar toggle used, changed to: index = $index and value = ${_flagList[index]}");
    },
  );
  FlagBar bodyToggle = FlagBar(
    flagList: _flagList,
    initialIndex: 0,
    onChanged: (index) {
      print(
          "Scaffold's body toggle used, changed to: index = $index and value = ${_flagList[index]}");
    },
  );
  FlagBar alertToggle = FlagBar(
    flagList: _flagList,
    initialIndex: 1,
    onChanged: (index) {
      print(
          "Alert toggle used, changed to: index = $index and value = ${_flagList[index]}");
    },
  );

  void showLanguages(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Change Language Example"),
          content: Container(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              heightFactor: 1,
              child: SizedBox(
                height: 50,
                width: 100,
                child: alertToggle,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget _appDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(child: Text("Example")),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: const Text('Change Language'),
            onTap: () {
              showLanguages(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example"), actions: [appBarToggle]),
      drawer: _appDrawer(context),
      body: Center(child: bodyToggle),
    );
  }
}
