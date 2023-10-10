import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sqflite_food_warehouse/screens/main_screen/bloc/product_bloc.dart';

import '../../../core/models/product_model.dart';
import '../details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductModel products;

  void _deleteProduct(BuildContext context) {
    context.read<ProductBloc>().add(DeleteProduct(products.id!));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(milliseconds: 500),
      content: Text("deleted product"),
    ));
  }

  void _toDetailsScreen(BuildContext context) {
    final bloc = context.read<ProductBloc>();
    Navigator.push(
        context,
        DetailsScreen.route(products, onUpdate: (product) {
          bloc.add(UpdateProductEvent(product));
        })).then((value) {
      if (value is bool && value == false) {
        context.read<ProductBloc>().add(DeleteProduct(products.id!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _toDetailsScreen(context);
      },
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  products.imagePath,
                  width: double.infinity,
                  height: 200,
                ),
                Text(
                  products.title.toUpperCase(),
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "${products.price}",
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            Positioned(
                right: 0,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    _deleteProduct(context);
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'item1',
                      child: Text('Удалить продукт'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
