import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PizzaMacro extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  const PizzaMacro({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2,2),
              blurRadius: 5
            )
          ]
        ),
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          FaIcon(icon, color: Colors.redAccent,),
          const SizedBox(height: 4,),
          Text(title == 'Calories'?'$value cals':'$value g')
        ],),
      ),
    );
  }
}