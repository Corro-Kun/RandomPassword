import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String password = '';

  void _getPassword() {
    password = '1234567890';
  }

  @override
  void initState() {
    _getPassword();
    super.initState();
  }

  String _stringRandom(int length) {
    final random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center, <- esto centra todo, ya esta aplicado
        // crossAxisAlignment: CrossAxisAlignment.start, <- esto alinea todo a la izquierda
        children: [
          SizedBox(
            height: 80,
          ),
          _title(),
          _copyPassword(),
          SizedBox(
            height: 300,
          ),
          _buttonGenerate()
        ],
      ),
    );
  }

  Text _title() {
    return Text(
      'Random Password',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

  GestureDetector _buttonGenerate() {
    return GestureDetector(
      onTap: () {
        setState(() {
          password = _stringRandom(10);
        });
        print("generar");
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 2,
              )
            ]),
        child: Center(
          child: Text(
            "Generate",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Container _copyPassword() {
    return Container(
      height: 200,
      width: 400,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          final String value = password;
          Clipboard.setData(ClipboardData(text: value));
          print("Copiado");
        },
        child: Center(
          child: Text(
            password,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
