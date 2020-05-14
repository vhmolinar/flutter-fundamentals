import 'package:flutter/material.dart';

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
