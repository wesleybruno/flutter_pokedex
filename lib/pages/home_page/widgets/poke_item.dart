import 'package:flutter/material.dart';
import 'package:pokemon/consts/const_app.dart';

class PokeItem extends StatelessWidget {
  final String nome;
  final int index;
  final Color color;
  final Widget image;
  final List<String> types;

  const PokeItem({Key key, this.nome, this.color, this.image, this.index, this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            //alignment: Alignment.bottomRight,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Opacity(
                  child: Image.asset(
                    ConstApp.whitePokeball,
                    width: 100,
                    height: 100,
                  ),
                  opacity: 0.2,
                ),
              ),
              Align(alignment: Alignment.bottomRight, child: image),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment: Alignment.topLeft, child: Text(this.nome, style: TextStyle( fontFamily: 'Google', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),),),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
