import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class homeactivity extends StatelessWidget {
  const homeactivity({super.key});

  @override
  Widget build(BuildContext context) {


    final users = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your session is now closed'),
      ),
      body: SafeArea(
        
        child:Column(
          children: [
            Text('Hello : ${users?.email}' ,style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 6, 7, 6)),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 58, 20, 60)),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                } ,
                child: 
                Text(
                  'Reconnect',
                ) )
          ]
          ),
          )
    );
  }
}