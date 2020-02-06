import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'Pokedex',
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              ],
          ),
        ],
      ),
      height: 100,
      color: (Color.fromARGB(0, 240, 245, 210)),
    );
  }
}
