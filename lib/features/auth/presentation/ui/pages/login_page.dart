import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GFCard(
        margin: const EdgeInsets.all(16),
        content: Column(
          children: [TextFormField()],
        ),
      ),
    );
  }
}
