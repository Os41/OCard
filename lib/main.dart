import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/user.dart';
import 'Screens/wrapper.dart';
import 'Services/auth.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User testUser = User(uid: 'uid-1');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [StreamProvider<User>.value( initialData: testUser, value: AuthService().user)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper()
        )
    );
  }
}
