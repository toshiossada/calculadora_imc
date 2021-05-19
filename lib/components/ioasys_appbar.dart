import 'package:flutter/material.dart';

class IoasysAppBar extends StatelessWidget {
  final Function()? resetField;
  const IoasysAppBar({Key? key, this.resetField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/logo_home.png',
            ),
          ),
          Text(
            "Calculadora de IMC",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[
        resetField == null
            ? Container()
            : IconButton(
                icon: Icon(Icons.refresh),
                onPressed: resetField,
              )
      ],
    );
  }
}
