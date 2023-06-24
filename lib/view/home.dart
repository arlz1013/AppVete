import 'package:gitpaste/view/root.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _namectl = TextEditingController();
  final TextEditingController _passctl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pets Barber"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
                controller: _namectl,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Username')),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
                controller: _passctl,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Password')),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => RootPage(
                        data: _namectl.text.toString(),
                      ))),
              child: const Text('Login'))
        ],
      ),
    );
  }
}