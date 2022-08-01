
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

String stringResponse="";

class Bitcoin extends StatefulWidget{
  const Bitcoin({Key? key}) : super(key: key);

  @override
  _Bitcoin createState() => _Bitcoin();
}

class _Bitcoin extends State<Bitcoin>{

  
  final bitcoin = "https://api.coindesk.com/v1/bpi/currentprice.json";
  Future apicall()async{
    http.Response response;
    response= await http.get(Uri.parse(bitcoin));
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
              color: Vx.red200,
                 child: Text(stringResponse.toString()),
             ),
      ),
      
        backgroundColor: Vx.cyan100,             
                  
    );
  }
} 