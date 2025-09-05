import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const CardButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
