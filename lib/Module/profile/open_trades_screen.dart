
import 'package:flutter/material.dart';
class OpenTradesScreen extends StatefulWidget {
  const OpenTradesScreen({Key? key}) : super(key: key);

  @override
  State<OpenTradesScreen> createState() => _OpenTradesScreenState();
}

class _OpenTradesScreenState extends State<OpenTradesScreen> {

  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];
  Future<void> _refreshData() async {
    // Simulate loading data for 2 seconds.
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual data fetching logic.
    setState(() {
      // Update your data source here.
      items = [
        "New Item 1",
        "New Item 2",
        "New Item 3",
        "New Item 4",
        "New Item 5",
      ];
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Trades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
