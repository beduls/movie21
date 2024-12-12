import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('home'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text('title $index'),
                subtitle: const Text('subtitle'),
              ),
          separatorBuilder: (context, idx) => const Divider(),
          itemCount: 10),
    );
  }
}
