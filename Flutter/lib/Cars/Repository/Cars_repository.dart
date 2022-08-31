import 'package:carapp/Cars/Model/Cars.dart';
import 'package:meta/meta.dart';
import '../Cars.dart';

class CarsRepository {
  final CarsDataProvider dataProvider;

  CarsRepository({required this.dataProvider});

  Future<Cars> createCars(Cars cars) async {
    return await dataProvider.createCar(cars);
  }

  Future<List<Cars>> getCars() async {
    return await dataProvider.getCars();
  }

  Future<void> updateCar(Cars car) async {
    await dataProvider.updateCar(car);
  }

  Future<void> deleteCar(int carID) async {
    await dataProvider.deleteCar(carID);
  }
}
