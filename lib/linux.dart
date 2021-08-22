import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MaterialApp(
    home: LinuxPage(),
  ));
}

class LinuxPage extends StatefulWidget {
  @override
  _LinuxPageState createState() => _LinuxPageState();
}

class _LinuxPageState extends State<LinuxPage> {
  web() async {
    var url = Uri.http("", "/cgi-bin/cmd.py", {"x": cmd});
    var response = await http.get(url);
    print(response.body);
    setState(() {
      result = response.body;
    });
  }

  var result = ' ';
  late String cmd;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          
          Container(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Text(
              'ENTER COMMAND :',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: TextField(
              onChanged: (value) {
                cmd = value;
              },
              decoration: InputDecoration(
                hintText: 'TYPE COMMAND',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
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
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        
                      ),
                      onPressed: web,
                      child: Text('RUN'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 60.0),
            child: Text(
              'OUTPUT',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "${result}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.black,
            width: 350.0,
            height: 250.0,
          ),
          Container(
            height: 70.0,
            child: Image(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/YashIndane/Web-Menu/main/Images/tux.png'),
              height: 60.0,
              width: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}