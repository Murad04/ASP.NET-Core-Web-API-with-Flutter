import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:carapp/Cars/Model/Cars.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as HTTP;

class CarsDataProvider {
  final _baseUrl = 'http://localhost:5139/api/cars';
  final HTTP.Client httpClient;
  CarsDataProvider({required this.httpClient});

  Future<Cars> createCar(Cars cars) async {
    final response = await httpClient.post(
      Uri.http('http://192.168.0.1:5139', 'api/cars'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "CarName": cars.carName,
        "CarCompany": cars.carCompany,
        "CarModel": cars.carModel,
        "CarImage": cars.carImage,
        "CarPrice": cars.carPrice,
        "CarReleaseDate": cars.carReleaseDate
      }),
    );
    if (response.statusCode == 200) {
      return Cars.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<List<Cars>> getCars() async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      final response = await HTTP.get(Uri.parse('${_baseUrl}/cars'));
      if (response.statusCode == 200) {
        final cars = jsonDecode(response.body) as List;
        return cars.map((car) => Cars.fromJson(car)).toList();
      } else {
        throw Exception('Failed to load cars');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception throwned');
      List<Cars> cars;
      cars = [];
      return cars;
    }
  }

  Future<void> deleteCar(int carID) async {
    final HTTP.Response response = await HTTP.delete(
      Uri.parse('http://localhost:5139/api/cars/$carID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete car');
    }
  }

  Future<void> updateCar(Cars car) async {
    final HTTP.Response response = await httpClient.put(
      Uri.parse('http://localhost:5139/api/cars/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "CarName": car.carName,
        "CarCompany": car.carCompany,
        "CarModel": car.carModel,
        "CarImage": car.carImage,
        "CarPrice": car.carPrice,
        "CarReleaseDate": car.carReleaseDate
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload car');
    }
  }
}
