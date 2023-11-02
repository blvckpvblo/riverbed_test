import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart.dart';
import 'catalog.dart';
import 'item.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final catalogProvider = StateNotifierProvider<Catalog, List<Item>>((ref) {
  return Catalog();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Item> list = ref.watch(catalogProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod Demo"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Cart()));
            },
            icon: const Icon(Icons.shopping_bag),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return SwitchListTile(
            title: Text(list[index].label),
            value: list[index].value,
            onChanged: (bool value) {
              ref.read(catalogProvider.notifier).updateItemValue(index);
            },
          );
        },
      ),
    );
  }
}
