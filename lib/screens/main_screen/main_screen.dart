import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_food_warehouse/screens/main_screen/widgets/add_product.dart';
import 'package:sqflite_food_warehouse/screens/main_screen/bloc/main_bloc.dart';
import 'package:sqflite_food_warehouse/screens/main_screen/widgets/product_item.dart';
import 'package:sqflite_food_warehouse/screens/statistics_screen/bloc/statistics_bloc.dart';
import 'package:sqflite_food_warehouse/screens/statistics_screen/statistics.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<void> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => StatisticsBloc()..add(InitialStatisticsEvent())),
          ],
          child: const StatisticsProduct(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: BlocBuilder<MainScreenBloc, ProductState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isFailure) {
              return const Center(child: Text('Ошибка при загрузке данных'));
            } else if (state.isSuccess) {
              final products = state.products;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Поиск продуктов',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (query) {
                        context.read<MainScreenBloc>().add(SearchProductsEvent(query));
                        print(query);
                      },
                    ),
                    PopupMenuButton<String>(
                      padding: const EdgeInsets.only(right: 380),
                      icon: const Icon(Icons.sort),
                      onSelected: (value) {
                        if (value == "item1") {
                          context.read<MainScreenBloc>().add(OrderByDate());
                        } else {
                          context.read<MainScreenBloc>().add(OrderByPrice());
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'item1',
                          child: Text('по дате'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'item2',
                          child: Text('по цене'),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 8.0, mainAxisSpacing: 3, mainAxisExtent: 300),
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8),
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          final products = state.products[i];
                          return ProductItem(products: products);
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Нет доступных продуктов'));
            }
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddProduct(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                _showModalBottomSheet(context);
              },
              child: const Icon(Icons.stacked_bar_chart),
            ),
          ],
        ));
  }
}
