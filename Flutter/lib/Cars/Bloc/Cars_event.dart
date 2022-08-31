import 'package:equatable/equatable.dart';
import 'package:carapp/Cars/Model/Cars.dart';
import '';

abstract class CarsEvent extends Equatable {
  const CarsEvent();
}

class CarsLoad extends CarsEvent {
  const CarsLoad();

  @override
  List<Object> get props => [];
}

class CarsCreate extends CarsEvent {
  final Cars cars;

  const CarsCreate(this.cars);

  @override
  List<Object> get props => [cars];

  @override
  String toString() => 'Cars created {cars: $cars}';
}

class CarsUpdate extends CarsEvent {
  final Cars cars;

  const CarsUpdate(this.cars);

  @override
  List<Object> get props => [cars];

  @override
  String toString() => 'Cars updated {cars: $cars}';
}

class CarsDelete extends CarsEvent {
  final Cars cars;

  const CarsDelete(this.cars);

  @override
  List<Object> get props => [cars];

  @override
  toString() => 'Cars deleted{cars:$cars}';
}
