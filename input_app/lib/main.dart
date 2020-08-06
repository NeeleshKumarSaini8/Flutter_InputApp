import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

String x;

class MyApp extends StatelessWidget {

  web(cmd) async {
    var url = "http://13.233.67.141/cgi-bin/$cmd.py";
    var r  = await http.get(url);
    print(r.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('InputApp'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 350,
            height: 200,
            color: Colors.grey.shade300,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: TextField(
                    cursorColor: Colors.red,
                    //style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      //icon: Icon(Icons.send),
                      hintText: 'Type linux commands to run',
                      helperText: 'e.g. date',
                      //counterText: '0 characters',
                      border: OutlineInputBorder(),
                      //contentPadding: EdgeInsets.all(5)
                      filled: true,
                      fillColor: Colors.red.shade100,
                      //floatingLabelBehavior: FloatingLabelBehavior.always,
                      helperStyle: TextStyle(fontStyle: FontStyle.italic),
                      hintStyle: TextStyle(backgroundColor: Colors.red.shade200),
                      labelText: 'Textfield',
                     // prefixIcon: Icon(Icons.monetization_on),
                      
                    ),
                    onChanged: (val) {
                      x = val;
                    },
                  ),
                ),
               Card(
                 child: FlatButton(
                   onPressed: () {
                     print(x);
                     web(x); 
                   },
                   child: Text('Run'))
               )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}