import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
   MessageScreen({
     Key? key,
     required this.id,
     required this.name
   }):super(key: key);
   String id;
   String name;
  @override
  State<MessageScreen> createState() => _MessageScreenState(id:id, name: name);
}

class _MessageScreenState extends State<MessageScreen> {
  String id;
  String name;
  _MessageScreenState({
      required this.id,
      required this.name
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Id: "),
                Text(id)
              ],
            ),
            Row(
              children: [
                Text("Name: "),
                Text(name)
              ],
            )
          ],
        ),
      ),
    );
  }
}
