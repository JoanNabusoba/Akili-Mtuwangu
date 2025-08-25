import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/add_edititems.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: ListView(children: const [
        Padding(
 padding: EdgeInsets.all(16.0),
 child: Text(
            "Items",
 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
 ),
 ),
        Card(
 margin: EdgeInsets.all(16.0),
 child: ListTile(
 leading: Image(
 image: AssetImage('img/mental1.jpg'), // Replace with your dummy image path
 width: 100,
 height: 100,
 fit: BoxFit.cover,
 ),
 title: Text('Dummy Item Title'),
 subtitle: Text('Dummy item description goes here.'),
 ),
 ),
        
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddEditItems());
        },
        backgroundColor: Color.fromRGBO(253, 94, 0, 1),
        child: Icon(Icons.add),
      ),
    );
  }
}
