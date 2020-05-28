import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:demoapp/details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  //Parsing Json Data
  List data;
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assests/data.json');
    setState(() {
      data = json.decode(jsonText);
    });
    return data.toString();
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  //Drawer
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Stack(children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Image.asset('assests/images/1.png'),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Text('MailBox',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                )
              ]),
              ListTile(
                title: Text('All Inboxes'),
              ),
              ListTile(
                title: Text('Primary'),
              ),
              ListTile(
                title: Text('Social'),
              ),
              ListTile(
                title: Text('Updates'),
              ),
              ListTile(
                title: Text('Important'),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: data.length == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text(data[index]['id'].toString()),
                  ),
                  title: Text(data[index]['title'].toString()),
                  subtitle: Text(data[index]['description_short'].toString()),
                  onTap: () {
                    print(data[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageTwo(
                                id: data[index]['id'],
                                title: data[index]['title'],
                                description_short: data[index]
                                    ['description_short'],
                                description: data[index]['description'],
                                text: data[index]['text'],
                                imageURL: data[index]['imageURL'])));
                  },
                )
              ],
            );
          },
        ));
  }
}
