// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_food_warehouse/core/constants/constants.dart';
import 'package:sqflite_food_warehouse/screens/statistics_screen/bloc/statistics_bloc.dart';

class StatisticsProduct extends StatelessWidget {
  const StatisticsProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<StatisticsBloc, StatisticsState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: InsetsConstants.large,
                ),
                Text("Статистика", style: theme.textTheme.displaySmall),
                const SizedBox(
                  height: InsetsConstants.small,
                ),
                Row(
                  children: [const Text("Общее количество товаров:"), Text("${state.countProduct}")],
                ),
                const SizedBox(
                  height: InsetsConstants.small,
                ),
                Row(
                  children: [const Text("Общая цена товаров:"), Text("${state.priceProduct}")],
                ),
                const SizedBox(
                  height: InsetsConstants.large,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Общее количество товара на складе ${product.}"),
                  ],
                ),
                const SizedBox(
                  height: InsetsConstants.large,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
