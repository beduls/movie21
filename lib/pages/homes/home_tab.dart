import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/products/cubit/product_cubit.dart';
import 'package:movie21/bloc/cubit/products/cubit/product_state.dart';
import 'package:movie21/utilities/helper.dart';
import 'package:movie21/utilities/injector.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final productCubit = ProductCubit(getIt.get());

  @override
  void initState() {
    productCubit.loadData(1, 10);
    super.initState();
  }

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
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: productCubit,
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text('title2 $index'),
                    subtitle: Text(state.products![index].name.toString()),
                    trailing: Text(formatRupiah(state.products![index].price)),
                  ),
              separatorBuilder: (context, idx) => const Divider(),
              itemCount: 10);
        },
      ),
    );
  }
}
