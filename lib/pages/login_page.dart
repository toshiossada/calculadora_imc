import 'package:calculadora_imc/components/ioasys_appbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: IoasysAppBar(),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Login"),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
