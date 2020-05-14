import 'package:flutter/material.dart';
import 'screens/list_transferencia.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData.dark().copyWith(
      accentColor: Colors.orange[800],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange[800],
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.orange[800],
      ),
    );

    return MaterialApp(
      home: ListaTransferencia(),
      theme: darkTheme,
    );
  }
}
