import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gerencia_de_estado_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter_gerencia_de_estado_example/features/bloc_example/bloc_example.dart';
import 'package:flutter_gerencia_de_estado_example/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      routes: {
        '/home': (_) => HomePage(),
        '/example/bloc/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: BlocExample(),
            ),
        // '/exampleFreezed': (_) => ,
        // '/contact': (_) => ,
        // '/contactCubit': (_) => ,
      },
      home: const HomePage(),
    );
  }
}
