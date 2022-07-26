import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/to_do_model.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:flutter_bloc_example/providers/keys.dart';
import 'package:flutter_bloc_example/views/auth/login/login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  
  Hive.registerAdapter(ToDoAdapter());
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => Controllers()),
      Provider(create: (_) => FormKeys()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
