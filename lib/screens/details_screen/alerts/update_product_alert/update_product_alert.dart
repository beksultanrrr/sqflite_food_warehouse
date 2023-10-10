import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_food_warehouse/core/constants/constants.dart';
import 'package:sqflite_food_warehouse/core/models/product_model.dart';
import 'package:sqflite_food_warehouse/screens/details_screen/alerts/update_product_alert/bloc/update_product_alert_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UpdateProductAlert extends StatefulWidget {
  static show(BuildContext context, ProductModel product) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: ((context, setState) {
              return BlocProvider(
                create: (context) => UpdateProductAlertBloc(product),
                child: const UpdateProductAlert(),
              );
            }),
          );
        });
  }

  const UpdateProductAlert({super.key});

  @override
  State<UpdateProductAlert> createState() => _UpdateProductAlertState();
}

class _UpdateProductAlertState extends State<UpdateProductAlert> {
  late final TextEditingController _newTitle;
  late final TextEditingController _newDescription;
  late final TextEditingController _imagePath;
  late final TextEditingController _newPrice;
  late final TextEditingController _newCount;

  @override
  void initState() {
    super.initState();

    final state = context.read<UpdateProductAlertBloc>().state;

    _newTitle = TextEditingController(text: state.product.title);
    _newDescription = TextEditingController(text: state.product.description);
    _newPrice = TextEditingController(text: "${state.product.price}");
    _newCount = TextEditingController(text: "${state.product.count}");
    _imagePath = TextEditingController(text: state.product.imagePath);
  }

  final _formKey = GlobalKey<FormState>();

  void _submitUpadte(UpdateProductAlertBloc bloc) {
    if (_formKey.currentState!.validate()) {
      bloc.add(SubmitUpdateProductAlertEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductAlertBloc, UpdateProductAlertState>(
      listenWhen: (previous, current) {
        if (previous.isLoading && current.isSuccess) {
          Navigator.pop(context, current.product);
        }
        return true;
      },
      listener: (BuildContext context, UpdateProductAlertState state) {},
      builder: (BuildContext context, UpdateProductAlertState state) {
        final bloc = context.read<UpdateProductAlertBloc>();

        return AlertDialog(
          title: const Text(
            'Update Product Data',
            style: TextStyle(fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextFormField(
                    // MatchValidator(errorText: 'passwords do not match').validateMatch(val, password),
                    validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),

                    decoration: const InputDecoration(isDense: true, label: Text('Название товара')),
                    maxLines: 1,
                    controller: _newTitle,
                    onChanged: (value) => bloc.add(TitleUpdateProductAlertEvent(value)),
                  ),
                ),
                const SizedBox(height: InsetsConstants.small),
                Flexible(
                  child: TextFormField(
                    validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                    controller: _newDescription,
                    decoration: const InputDecoration(isDense: true, label: Text('Description')),
                    maxLines: 2,
                    onChanged: (value) => bloc.add(DescriptionUpdateProductAlertEvent(value)),
                  ),
                ),
                const SizedBox(height: InsetsConstants.small),
                Flexible(
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                    ]),
                    controller: _newPrice,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(isDense: true, label: Text('Цена')),
                    maxLines: 1,
                    onChanged: (value) => bloc.add(PriceUpdateProductAlertEvent(double.parse(value))),
                  ),
                ),
                const SizedBox(height: InsetsConstants.small),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _newCount,
                    decoration: const InputDecoration(isDense: true, label: Text('Количество')),
                    maxLines: 1,
                    onChanged: (value) => bloc.add(CountUpdateProductAlertEvent(int.parse(value))),
                  ),
                ),
                const SizedBox(height: InsetsConstants.small),
                Flexible(
                  child: TextFormField(
                    validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                    controller: _imagePath,
                    decoration: const InputDecoration(isDense: true, label: Text('Image url')),
                    maxLines: 1,
                    onChanged: (value) => bloc.add(ImgUrlUpdateProductAlertEvent(value)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: Constants.customButtonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Выйти'),
            ),
            ElevatedButton(
              style: Constants.customButtonStyle,
              onPressed: () {
                _submitUpadte(bloc);
              },
              child: const Text('Обновить'),
            ),
          ],
        );
      },
    );
  }
}
