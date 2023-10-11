import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sqflite_food_warehouse/core/models/product_model.dart';
import 'package:sqflite_food_warehouse/screens/main_screen/bloc/main_bloc.dart';

class AddProduct extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();

  AddProduct({super.key});

  final _formKey = GlobalKey<FormState>();

  void _addProduct(BuildContext context, MainScreenBloc bloc) {
    if (_formKey.currentState!.validate()) {
      final newProduct = ProductModel(
        title: titleController.text,
        description: descriptionController.text,
        price: double.tryParse(priceController.text) ?? 0.0,
        count: int.tryParse(countController.text) ?? 0,
        imagePath: imagePathController.text,
      );

      // Отправляем событие AddProduct с новым продуктом.
      bloc.add(AddProductEvent(newProduct));

      // Возвращаемся на предыдущий экран.
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainScreenBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              TextFormField(
                validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
              ),
              TextFormField(
                validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Цена'),
              ),
              TextFormField(
                validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Количество'),
              ),
              TextFormField(
                validator: RequiredValidator(errorText: 'Это поле обязательно для заполнения'),
                controller: imagePathController,
                decoration: const InputDecoration(labelText: 'Ссылка на img'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _addProduct(context, bloc);
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
