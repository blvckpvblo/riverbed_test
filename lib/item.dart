import 'package:flutter/material.dart';

@immutable
class Item {
  final String label;
  final bool value;

  const Item(this.label, this.value);
}
