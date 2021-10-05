import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoping_list_bloc/route/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter? router;
  const MyApp({
    Key? key,
    this.router,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router!.generateRoute,
      initialRoute: "/home",
    );
  }
}
