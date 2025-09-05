import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gerencia_de_estado_example/features/bloc_example/bloc/example_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: BlocListener<ExampleBloc, ExampleState>(
        listenWhen: (previous, current) {
          // posso 'selecionar' quando q eu quero q meu widget seja rebuildado
          if (previous is ExampleStateInitial && current is ExampleStateData) {
            if (current.names.length > 6) {
              return true;
            }
          }
          return false;
        },
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A quantidade de nomes é ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            BlocConsumer<ExampleBloc, ExampleState>(
              builder: (context, state) {
                if (state is ExampleStateData) {
                  return Text('Total de nome é ${state.names.length}');
                }
                return SizedBox.shrink();
              },
              listener: (context, state) => log(
                'Estado alterado para ${state.runtimeType}',
              ),
            ),
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) {
                if (state is ExampleStateInitial) return true;
                return false;
              },
              builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            Expanded(
              child: BlocBuilder<ExampleBloc, ExampleState>(
                builder: (context, state) {
                  if (state is ExampleStateData) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.names.length,
                            itemBuilder: (context, index) {
                              final name = state.names[index];
                              return ListTile(
                                onTap: () {
                                  context
                                      .read<ExampleBloc>()
                                      .add(ExampleRemoveNameEvent(name: name));
                                },
                                title: Text(name),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: TextButton(
                            onPressed: () =>
                                context.read<ExampleBloc>().add(ExampleAddNameEvent(name: 'Teste')),
                            child: Text('Adicionar'),
                          ),
                        )
                      ],
                    );
                  }
                  return const Text('Nenhum nome cadastrado');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
