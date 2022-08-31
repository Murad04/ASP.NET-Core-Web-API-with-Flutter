import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Cars extends Equatable {
  final int carID;
  final String carName;
  final String carCompany;
  final String carImage;
  final DateTime carReleaseDate;
  final int carPrice;
  final String carModel;

  const Cars(
      {required this.carID,
      required this.carName,
      required this.carCompany,
      required this.carImage,
      required this.carModel,
      required this.carPrice,
      required this.carReleaseDate});

  @override
  List<Object> get props => [
        carID,
        carName,
        carModel,
        carCompany,
        carImage,
        carPrice,
        carReleaseDate
      ];

  factory Cars.fromJson(Map<String, dynamic> json) {
    return Cars(
      carID: json['CarID'],
      carCompany: json['CarCompany'],
      carImage: json['CarImage'],
      carModel: json['CarModel'],
      carName: json['CarName'],
      carPrice: json['CarPrice'],
      carReleaseDate: json['CarReleaseDate'],
    );
  }

  @override
  String toString() =>
      'Car {carID:$carID, carName:$carName, carModel:$carModel. carCompany:$carCompany, carImage:$carImage, carPrice:$carPrice, carReleaseDate:$carReleaseDate}';
}
