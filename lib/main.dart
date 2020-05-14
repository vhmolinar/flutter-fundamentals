import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencia(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _ctrlCampoNroConta = TextEditingController();
  final TextEditingController _ctrlCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Editor(
            ctrl: _ctrlCampoNroConta,
            lblCampo: 'Número da Conta',
            hintCampo: '0000',
          ),
          Editor(
            ctrl: _ctrlCampoValor,
            lblCampo: 'Valor',
            hintCampo: '0.00',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _criarTransferencia(context),
          ),
        ],
      ),
      appBar: AppBar(title: Text('Criando transferência')),
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

class Editor extends StatelessWidget {
  final TextEditingController ctrl;
  final String lblCampo;
  final String hintCampo;
  final IconData icone;

  Editor({this.ctrl, this.lblCampo, this.hintCampo, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: TextField(
        controller: ctrl,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: lblCampo,
          hintText: hintCampo,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, pos) {
          final transferencia = widget._transferencias[pos];
          return ItemTransferencia(transferencia);
        },
        itemCount: widget._transferencias.length,
      ),
      appBar: AppBar(title: Text('Transferências')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferencia) {
            widget._transferencias.add(transferencia);
            setState(() {});
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia => Nro. Conta: $numeroConta, Valor: $valor';
  }
}
