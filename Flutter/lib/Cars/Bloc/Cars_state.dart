import 'package:equatable/equatable.dart';
import 'package:carapp/Cars/Cars.dart';

import '../Model/Cars.dart';

class CarsState extends Equatable {
  const CarsState();

  @override
  List<Object> get props => [];
}

class CarsLoading extends CarsState {}

class CarsLoadSuccess extends CarsState {
  final List<Cars> cars;

  const CarsLoadSuccess([this.cars = const []]);

  @override
  List<Object> get props => [cars];
}

class CarsOperationFailure extends CarsState {}
