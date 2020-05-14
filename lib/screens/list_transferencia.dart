import 'package:flutter/material.dart';
import 'package:flutter_fundementals/models/transferencia.dart';
import 'form_transferencia.dart';

const _lblAppBar = 'Transferências';

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
      appBar: AppBar(title: Text(_lblAppBar)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferencia) {
            if (transferencia == null) {
              return;
            }
            _atualizaTransferencia(transferencia);
          });
        },
      ),
    );
  }

  void _atualizaTransferencia(transferencia) {    
    setState(() {
      widget._transferencias.add(transferencia);
    });
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
