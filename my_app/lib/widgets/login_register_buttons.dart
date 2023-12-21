import 'package:flutter/material.dart';

class LoginRegisterButtons extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;
  final VoidCallback onDemoPressed; // New callback for the 'Demo' button
  final Color loginButtonColor;
  final Color registerButtonColor;
  final Color demoButtonColor; // Color for the 'Demo' button

  const LoginRegisterButtons({
    Key? key,
    required this.onLoginPressed,
    required this.onRegisterPressed,
    required this.onDemoPressed,
    this.loginButtonColor = Colors.blue,
    this.registerButtonColor = Colors.green,
    this.demoButtonColor = Colors.orange, // Default color for the 'Demo' button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: onLoginPressed,
            child: const Text('Login'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
        const SizedBox(height: 20),
        FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: onRegisterPressed,
            child: const Text('Register'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
        const SizedBox(height: 20),
        FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: onDemoPressed,
            child: const Text('Demo'), // Text for the 'Demo' button
            style: ElevatedButton.styleFrom(
              primary: demoButtonColor, // Set 'Demo' button color
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
      ],
    );
  }
}
