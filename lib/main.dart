import 'package:flutter/material.dart';
import 'package:pokemon/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'stores/pokeapi_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
          title: 'Wesley Pokedex',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
      providers: <SingleChildWidget>[
        Provider<PokeApiStore>(
          create: (_) => PokeApiStore(),
        )
      ],
    );
  }
}
