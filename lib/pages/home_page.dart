import 'dart:ui';

import 'package:calculadora_imc/components/ioasys_appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _textInfo = 'Informe seus dados';

  void _resetField() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _textInfo = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _textInfo = "Você está baixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc > 18.6 && imc < 24.9) {
        _textInfo =
            "Você está no seu Peso Ideal  (${imc.toStringAsPrecision(3)})";
      } else if (imc > 24.9 && imc < 29.9) {
        _textInfo =
            "Você está Levemente acima do Peso  (${imc.toStringAsPrecision(3)})";
      } else if (imc > 29.9 && imc < 34.9) {
        _textInfo =
            "Você está com Obesidade Grau I  (${imc.toStringAsPrecision(3)})";
      } else if (imc > 34.9 && imc < 39.9) {
        _textInfo =
            "Você está com Obesidade Grau II  (${imc.toStringAsPrecision(3)})";
      } else if (imc > 39.9) {
        _textInfo =
            "Você está com Obesidade Grau III  (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: IoasysAppBar(
          resetField: _resetField,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 104,
                    height: 104,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso (kg) ",
                    labelStyle: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 14),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 25),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu peso!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura (cm) ",
                    labelStyle: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 14),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 25),
                  controller: heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira sua altura!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        textStyle: TextStyle(fontSize: 16),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _calculate();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    _textInfo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
