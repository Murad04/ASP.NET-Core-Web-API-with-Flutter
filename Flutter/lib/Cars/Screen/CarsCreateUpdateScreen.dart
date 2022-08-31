import 'package:carapp/Cars/Screen/CarsMainScreen.dart';
import 'package:carapp/Cars/Screen/Screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carapp/Cars/Bloc/bloc.dart';
import 'package:carapp/Cars/Cars.dart';

import '../Model/Cars.dart';

class CarsCreateUpdateService extends StatefulWidget {
  static const routeName = 'carsAddUpdate';
  final CarsArguments args;

  const CarsCreateUpdateService({required this.args});
  @override
  // ignore: library_private_types_in_public_api
  _CarsCreateUpdateState createState() => _CarsCreateUpdateState();
}

class _CarsCreateUpdateState extends State<CarsCreateUpdateService> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _cars = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Car" : "Add new Car"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.args.edit ? widget.args.cars.carName : '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the car name';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Car name'),
                onSaved: (value) {
                  setState(() {
                    _cars["CarName"] = value;
                  });
                },
              ),
              TextFormField(
                initialValue: widget.args.edit ? widget.args.cars.carModel : '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the car model';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Car model'),
                onSaved: (value) {
                  setState(() {
                    _cars["CarModel"] = value;
                  });
                },
              ),
              TextFormField(
                initialValue:
                    widget.args.edit ? widget.args.cars.carCompany : '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the company name of the car';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Car Company'),
                onSaved: (value) {
                  setState(() {
                    _cars["CarCompany"] = value;
                  });
                },
              ),
              TextFormField(
                initialValue: widget.args.edit
                    ? widget.args.cars.carReleaseDate.toString()
                    : '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the year of the car';
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(labelText: 'Car release year'),
                onSaved: (value) {
                  setState(() {
                    _cars["CarReleaseDate"] = value;
                  });
                },
              ),
              TextFormField(
                initialValue: widget.args.edit
                    ? widget.args.cars.carPrice.toString()
                    : '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the price of the car';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Car price'),
                onSaved: (value) {
                  setState(() {
                    _cars["CarPrice"] = value;
                  });
                },
              ),
              TextFormField(
                initialValue: widget.args.edit ? widget.args.cars.carImage : '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the image of the car';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Car price'),
                onSaved: (value) {
                  setState(() {
                    _cars["CarImage"] = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      final CarsEvent event = widget.args.edit
                          ? CarsUpdate(
                              Cars(
                                carID: widget.args.cars.carID,
                                carName: _cars["CarName"],
                                carModel: _cars["CarModel"],
                                carCompany: _cars["CarCompany"],
                                carPrice: _cars["CarPrice"],
                                carImage: _cars["CarImage"],
                                carReleaseDate: _cars["CarReleaseDate"],
                              ),
                            )
                          : CarsCreate(
                              Cars(
                                carID: widget.args.cars.carID,
                                carName: _cars["CarName"],
                                carModel: _cars["CarModel"],
                                carCompany: _cars["CarCompany"],
                                carPrice: _cars["CarPrice"],
                                carImage: _cars["CarImage"],
                                carReleaseDate: _cars["CarReleaseDate"],
                              ),
                            );
                      BlocProvider.of<CarsBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          CarsMainScreen.routeName, (route) => false);
                    }
                  },
                  label: const Text('SAVE'),
                  icon: const Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
