import 'package:flutlab/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChartBar()));
          },
          color: Colors.blue,
          child: Text('Open Chart!', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}