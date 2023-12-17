import 'package:flutter/material.dart';
import 'package:pkce_oauth/login_web_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginWebViewApp(),
              ),
            ),
            child: Text('Login'),
          )
        ),
      ),
    );
  }
}
