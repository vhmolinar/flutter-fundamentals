import 'package:flutter/material.dart';
import 'package:flutter_fundementals/components/editor.dart';
import 'package:flutter_fundementals/models/transferencia.dart';

const _lblAppBar = 'Criando transferência';
const _lblCampoNro = 'Número da Conta';
const _lblCampoValor = 'Valor';
const _btnConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _ctrlCampoNroConta = TextEditingController();
  final TextEditingController _ctrlCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              ctrl: _ctrlCampoNroConta,
              lblCampo: _lblCampoNro,
              hintCampo: '0000',
            ),
            Editor(
              ctrl: _ctrlCampoValor,
              lblCampo: _lblCampoValor,
              hintCampo: '0.00',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_btnConfirmar),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text(_lblAppBar)),
    );
  }

  void _criarTransferencia(context) {
    final String nroConta = _ctrlCampoNroConta.text;
    final double valor = double.tryParse(_ctrlCampoValor.text);
    if (nroConta != null && valor != null) {
      final transferencia = Transferencia(valor, nroConta);
      Navigator.pop(context, transferencia);
    }
  }
}
