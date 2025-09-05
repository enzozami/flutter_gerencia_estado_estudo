import 'package:flutter/material.dart';
import 'package:flutter_gerencia_de_estado_example/home/widgets/card_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardButton(
                  label: 'Example',
                  onTap: () => Navigator.pushNamed(context, '/example/bloc/'),
                ),
                CardButton(
                  label: 'Example Freezed',
                  onTap: () => Navigator.pushNamed(context, ''),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardButton(
                  label: 'Contact',
                  onTap: () => Navigator.pushNamed(context, ''),
                ),
                CardButton(
                  label: 'Contact Cubit',
                  onTap: () => Navigator.pushNamed(context, ''),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
