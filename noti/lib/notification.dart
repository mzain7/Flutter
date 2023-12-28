import 'package:flutter/material.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),
      body: Center(
        child:
            Text("Notification: ${message}", style: TextStyle(fontSize: 24)),

      ),
    );
  }
}