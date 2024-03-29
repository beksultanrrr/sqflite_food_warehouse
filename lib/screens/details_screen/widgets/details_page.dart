// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sqflite_food_warehouse/core/constants/constants.dart';
import 'package:sqflite_food_warehouse/core/models/product_model.dart';
import 'package:sqflite_food_warehouse/screens/details_screen/alerts/update_product_alert/update_product_alert.dart';
import 'package:sqflite_food_warehouse/screens/details_screen/widgets/table_data.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.product,
    required this.onUpdate,
  }) : super(key: key);

  final ProductModel product;
  final Function(ProductModel product) onUpdate;
  _showEditAlert(BuildContext context) {
    UpdateProductAlert.show(context, product).then((value) {
      if (value is ProductModel) {
        onUpdate(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              product.imagePath,
              fit: BoxFit.contain,
              height: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: InsetsConstants.middle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const TableData(firstElement: "цена", secondELement: "количество"),
                    const SizedBox(
                      width: InsetsConstants.large,
                    ),
                    TableData(firstElement: "${product.price} тг", secondELement: "${product.count} шт"),
                  ],
                ),
                const SizedBox(
                  height: InsetsConstants.small,
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(onPressed: () => _showEditAlert(context), child: const Text('Обновить продукт')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                      // _deleteProduct(context, currentProduct.id);
                    },
                    child: const Text('Удалить продукт'))
              ],
            ),
          )
        ],
      ),
    );
  }
}


