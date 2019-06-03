import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = "https://swapi.co/api/people/";
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsondata();
  }

  Future<String> getJsondata() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers : {"Accept": "application/json"}
    );
    print("hello "+ response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
//      var convertDataToJson = JSON.decode(response.body);
      data = convertDataToJson['results'];

    });
    return "Success";
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
      AppBar(
        title: new Text("Retrieve JSON via http get"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context , int index){
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(
                        data[index]['name']
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
