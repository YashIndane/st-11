import 'package:flutter/material.dart';
import 'docker.dart';
import 'linux.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0DFF23),
                    Color(0xFF697692),
                    Color(0xFB8989CC),
                  ],
                ),
              ),
            ),
            
            centerTitle: true,
            title: Text(
              'TERMINAL APP',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 25.0
                ),
            ),
            bottom: TabBar(
              tabs: [
                Text('LINUX'),
                Text('DOCKER'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LinuxPage(),
              MyApp(),
            ],
          ),
        ),
      ),
    );
  }
}