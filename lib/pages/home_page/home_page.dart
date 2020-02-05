import 'package:flutter/material.dart';
import 'package:pokemon/consts/const_app.dart';
import 'package:pokemon/pages/home_page/widgets/app_bar_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screeWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.5),
            left: screeWidth - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstApp.blackPokeball,
                width: 240,
                height: 240,
              ),
              opacity: 0.2,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(height: statusHeight),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
