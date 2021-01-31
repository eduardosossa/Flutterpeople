/*import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'Package:http/http.dart'as http;
void main()=>runApp(MiApp());
class MiApp extends StatelessWidget {
  const MiApp
    ({Key key}) : super(key: key);

 
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App image ",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget 
{
  Inicio
  ({Key key}) : super(key: key);

  @override
  _InicioState createState() => 
  _InicioState();
}

class _InicioState extends State<
Inicio> 
{
  List data;
  Future <String> getData()async{
var response= await http.get(
  Uri.encodeFull("https://apipersonaelsc.azurewebsites.net/api/People"),
  headers: {"Accept":"application/json"}
);
data=json.decode(response.body);
print(data[1]);
    return "Success";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi app con imagen"),
        ),
        body:Column(
          children:<Widget>[
           Container(
          padding: EdgeInsets.all(20.0),
          child: Image.network("https://http2.mlstatic.com/D_NQ_NP_758089-MLM33075509825_122019-V.jpg"),
        ),
        new Center(
          child: new RaisedButton(
            child: new Text("obtener datos"),
            onPressed: getData)
        )
      ]
     ),
    );
  }
}*/
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://webapipersonanas.azurewebsites.net/api/people"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    
    print(data[1]["Name"]);
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["Birthday"]),
          );
        },
      ),
    );
  }
}
