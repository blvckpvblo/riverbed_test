import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';

class Catalog extends StateNotifier<List<Item>> {
  Catalog()
      : super([
          const Item("Water", false),
          const Item("Fruits", false),
          const Item("Chips", false),
          const Item("Chocolat", false),
          const Item("Juice", false),
          const Item("Soda", false),
          const Item("Fish", false),
          const Item("Beef", false),
          const Item("Bread", false),
        ]);

  void updateItemValue(int index) {
    List<Item> tempState = List.from(state);
    tempState[index] = Item(tempState[index].label, !tempState[index].value);
    state = tempState;
  }
}
