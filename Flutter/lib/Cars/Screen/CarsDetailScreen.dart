import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carapp/Cars/Bloc/bloc.dart';
import 'package:carapp/Cars/Model/Cars.dart';
import 'package:carapp/Cars/Screen/CarsCreateUpdateScreen.dart';
import 'package:carapp/Cars/Screen/screens.dart';

class CarsDetail extends StatelessWidget {
  static const routeName = 'carsDetail';
  final Cars cars;

  CarsDetail({required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.cars.carName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              CarsCreateUpdateService.routeName,
              arguments: CarsArguments(cars: this.cars, edit: true),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<CarsBloc>(context).add(CarsDelete(this.cars));
              Navigator.of(context).pushNamedAndRemoveUntil(
                  CarsMainScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Car Name: ${this.cars.carName}'),
              subtitle: Text('Car Model: ${this.cars.carModel}'),
            ),
            const Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Company',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Price',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Release Date',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 2),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Image(
              image: NetworkImage(this.cars.carImage),
              height: 300,
              width: 400,
            ),
          ],
        ),
      ),
    );
  }
}
