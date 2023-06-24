import 'package:gitpaste/view/root.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _namectl = TextEditingController();
  final TextEditingController _passctl = TextEditingController();
  String _username = '';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/img/bocchi_user.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 250,
              child: TextFormField(
                controller: _namectl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Username',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 250,
              child: TextFormField(
                controller: _passctl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Ingresa tu contraseña',
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 48, 156, 211),
            ),
            onPressed: () {
              setState(() {
                _username = _namectl.text.toString();
              });
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => RootPage(
                  data: _namectl.text.toString(),
                ),
              ));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    ),
  );
}
}