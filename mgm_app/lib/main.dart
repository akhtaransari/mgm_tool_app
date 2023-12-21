import 'package:flutter/material.dart';
import 'package:untitled/widgets/demo_page.dart';
import 'package:untitled/widgets/register_page.dart';
import 'package:untitled/widgets//login_page.dart';
import 'package:untitled/widgets//login_register_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TGT-MGM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Membership Manager'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(widget.title),
      ),
      body: Center(
      child:
      LoginRegisterButtons(
        onLoginPressed: () {
          // Handle login button press
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(), // Navigate to LoginPage
            ),
          );
        },
        onRegisterPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupPage(), // Navigate to LoginPage
            ),
          );
        },
        onDemoPressed: () {
          // Handle demo button press
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DemoPage(), // Navigate to LoginPage
            ),
          );
        },
      ),
    ),
    );
  }
}


