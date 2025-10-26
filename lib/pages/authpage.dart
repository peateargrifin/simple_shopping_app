import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'loginorreg.dart';
import 'loginpg.dart';

class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snap){
            if(snap.hasData){
              return Homepage();
            }
            else{
              return loginorregipg();
            }




          }
          ),

    );
  }
}
