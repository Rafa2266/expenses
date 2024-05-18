import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double price;
  final double percentage;
  final String label;
  const ChartBar(
      {super.key,
      required this.price,
      required this.label,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('${price.toStringAsFixed(2)}')),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
