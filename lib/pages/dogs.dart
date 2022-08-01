

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

String stringResponse="";

class Dogs extends StatefulWidget{
  const Dogs({Key? key}) : super(key: key);

  @override
  _Dogs createState() => _Dogs();
}

class _Dogs extends State<Dogs>{

  
  final dogs= "https://dog.ceo/api/breeds/image/random";
  Future apicall()async{
    http.Response response;
    response= await http.get(Uri.parse(dogs));
    if(response.statusCode == 200){
      setState(() {

        stringResponse= response.body;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    apicall();
    
  }
  

  @override
  Widget build (BuildContext context){

    return Scaffold(
      body: Center(
        child:
             Card(
              color: Vx.blue300,
                 child: Text(stringResponse.toString()),
             ),
      ),
      backgroundColor: Vx.cyan100,
                     
    );
  }
}
 