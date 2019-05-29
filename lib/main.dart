import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.green,
        brightness:Brightness.light,
        accentColor: Colors.red,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String myText="Hello World";
  void _changeText(){
    setState(() {
      if(myText.startsWith("H")){
        myText="Welcome to my page";
      }
      else{
        myText="Hello World";
      }

    });
  }

  Widget _bodyWidget(){
    return new Container(
      padding: const EdgeInsets.all(8.00),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(myText,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontStyle: FontStyle.italic
            ),),
            new RaisedButton(
              child: new Text("click" , style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic
              )),
              onPressed : _changeText,
            color: Colors.red,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("HomePage"),
      ),
      body: _bodyWidget(),
    );
  }
}

