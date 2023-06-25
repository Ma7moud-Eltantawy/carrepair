class CarModel {
  final String carName;
  final String kilometers;
  final String oilKilometers;
  final String checkKilometers;
  final String note;
  final String id;
  final String? lastOilChangeDate;
  final String? lastCheckDate;
  String? newKilometersDate;
  String? maxOilKM;
  String? maxCheckKM;

  CarModel({
    required this.id,
    required this.oilKilometers,
    required this.note,
    required this.carName,
    required this.checkKilometers,
    required this.kilometers,
    this.lastCheckDate,
    this.lastOilChangeDate,
    this.newKilometersDate,
    this.maxCheckKM,
    this.maxOilKM,
  });

  @override
  String toString() {
    return 'carName: $carName';
  }

  factory CarModel.fromJson(
      {required String id, required Map<String, dynamic> json}) {
    return CarModel(
      id: id,
      oilKilometers: json['oil_kilometers'],
      note: json['note'],
      carName: json['car_name'],
      checkKilometers: json['check_kilometers'],
      kilometers: json['kilometers'],
      newKilometersDate: json['new_kilometers_date'],
      lastOilChangeDate: json['last_oil_change_date'],
      lastCheckDate: json['last_check_date'],
      maxCheckKM: json['max_check_km'] ?? "50000",
      maxOilKM: json['max_oil_km'] ?? "10000",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'car_name': carName,
      'kilometers': kilometers,
      'oil_kilometers': oilKilometers,
      'check_kilometers': checkKilometers,
      'note': note,
      'id': id,
    };
    if (newKilometersDate != null) {
      data['new_kilometers_date'] = newKilometersDate;
    }
    if (lastOilChangeDate != null) {
      data['last_oil_change_date'] = lastOilChangeDate;
    }
    if (lastCheckDate != null) {
      data['last_check_date'] = lastCheckDate;
    }
    if (maxOilKM != null) {
      data['max_oil_km'] = maxOilKM;
    }
    if (maxCheckKM != null) {
      data['max_check_km'] = maxCheckKM;
    }

    return data;
  }
}
