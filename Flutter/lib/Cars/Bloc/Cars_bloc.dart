import 'package:carapp/Cars/Bloc/Cars_event.dart';
import 'package:carapp/Cars/Bloc/Cars_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carapp/Cars/Bloc/bloc.dart';
import 'package:carapp/Cars/Repository/Cars_repository.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final CarsRepository carsRepository;

  CarsBloc({required this.carsRepository}) : super(CarsLoading());

  @override
  Stream<CarsState> mapEventToState(CarsEvent event) async* {
    if (event is CarsLoad) {
      yield CarsLoading();

      try {
        final cars = await carsRepository.getCars();
        yield CarsLoadSuccess(cars);
      } catch (_) {
        yield CarsOperationFailure();
      }
    }

    if (event is CarsCreate) {
      try {
        await carsRepository.updateCar(event.cars);
        final cars = await carsRepository.getCars();
        yield CarsLoadSuccess(cars);
      } catch (_) {
        yield CarsOperationFailure();
      }
    }

    if (event is CarsUpdate) {
      try {
        await carsRepository.updateCar(event.cars);
        final cars = await carsRepository.getCars();
        yield CarsLoadSuccess(cars);
      } catch (_) {
        yield CarsOperationFailure();
      }
    }

    if (event is CarsDelete) {
      try {
        await carsRepository.deleteCar(event.cars.carID);
        final cars = await carsRepository.getCars();
        yield CarsLoadSuccess(cars);
      } catch (_) {
        yield CarsOperationFailure();
      }
    }
  }
}
