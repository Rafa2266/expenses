import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function() onSubmitted;
  final String label;
  const AdaptativeTextField(
      this.controller, this.keyboardType, this.onSubmitted, this.label,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              placeholder: label,
              onSubmitted: (_) => onSubmitted,
              controller: controller,
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            onSubmitted: (_) => onSubmitted,
            controller: controller,
            keyboardType: keyboardType,
          );
  }
}
