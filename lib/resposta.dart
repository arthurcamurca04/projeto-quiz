import 'package:flutter/material.dart';

class BtnResposta extends StatelessWidget {
  
  final String textBtn;
  final void Function() onSelected;

  BtnResposta(this.textBtn, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onSelected,
        child: Text(
          textBtn,
        ),
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
