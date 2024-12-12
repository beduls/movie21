import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/products/cubit/product_cubit.dart';
import 'package:movie21/bloc/cubit/products/cubit/product_state.dart';
import 'package:movie21/utilities/helper.dart';
// import 'package:movie21/utilities/helper.dart';
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
      body: Stack(children: [
        BlocBuilder<ProductCubit, ProductState>(
          bloc: productCubit,
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: () async {
                await productCubit.loadData(1, 5);
              },
              child: ListView.separated(
                itemCount: state.products?.length ?? 0,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.products![index].name.toString()),
                  subtitle: Text(state.products![index].description.toString()),
                  trailing: Text(formatRupiah(state.products![index].price)),
                ),
                separatorBuilder: (context, idx) => const Divider(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
