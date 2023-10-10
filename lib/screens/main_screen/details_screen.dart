// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sqflite_food_warehouse/core/models/product_model.dart';
import 'package:sqflite_food_warehouse/screens/details_screen/bloc/details_bloc.dart';
import 'package:sqflite_food_warehouse/screens/details_screen/widgets/details_page.dart';

class DetailsScreen extends StatefulWidget {
  static Route route(ProductModel product, {required Function(ProductModel) onUpdate}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => DetailsBloc(product),
        child: DetailsScreen(
          onUpdate: onUpdate,
        ),
      ),
    );
  }

  final Function(ProductModel product) onUpdate;

  const DetailsScreen({
    Key? key,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // _goBack(BuildContext context, ProductModel product) {
  // Navigator.pop(context, product);
  // }

  _goBack(BuildContext context, ProductModel product) {
    widget.onUpdate(product);
    Navigator.pop(context, product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
        listenWhen: (previous, current) {
          if (previous.isLoading && current.isSuccess) {
            Navigator.pop(context, current.product);
          }
          return true;
        },
        listener: (BuildContext context, DetailsState state) {},
        builder: (BuildContext context, DetailsState state) {
          final bloc = context.read<DetailsBloc>();

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () async {
                      _goBack(context, state.product);
                    })),
            body: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height,
                child: DetailsPage(
                  product: state.product,
                  onUpdate: (product) => bloc.add(UpdateDetailsEvent(product)),
                )),
          );
        });
  }
}
