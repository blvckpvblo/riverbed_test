import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';
import 'main.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Item> list = ref.watch(catalogProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod Demo"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return list[index].value
              ? ListTile(
                  title: Text(list[index].label),
                  trailing: IconButton(
                    onPressed: () {
                      ref.read(catalogProvider.notifier).updateItemValue(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
