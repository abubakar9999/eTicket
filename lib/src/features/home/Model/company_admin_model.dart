class CompanyAdminModel {
  List<Company>? companies;
  List<Owner>? owners;
  List<Vehicle>? vehicles;

  CompanyAdminModel({
    this.companies,
    this.owners,
    this.vehicles,
  });

  factory CompanyAdminModel.fromJson(Map<String, dynamic> json) {
    return CompanyAdminModel(
      companies: (json['companies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e))
          .toList(),
      owners: (json['owners'] as List<dynamic>?)
          ?.map((e) => Owner.fromJson(e))
          .toList(),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => Vehicle.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companies': companies?.map((e) => e.toJson()).toList(),
      'owners': owners?.map((e) => e.toJson()).toList(),
      'vehicles': vehicles?.map((e) => e.toJson()).toList(),
    };
  }
}

class Company {
  int? id;
  String? name;
  String? address;
  String? email;
  String? phone;
  bool? isActive;

  Company({
    this.id,
    this.name,
    this.address,
    this.email,
    this.phone,
    this.isActive,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
      'isActive': isActive,
    };
  }
}

class Owner {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isActive;
  int? numOfVehicle;

  Owner({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isActive,
    this.numOfVehicle,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      isActive: json['isActive'],
      numOfVehicle: json['numOfVehicle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'isActive': isActive,
      'numOfVehicle': numOfVehicle,
    };
  }
}

class Vehicle {
  int? id;
  String? name;
  String? temporaryName;
  String? licenseNumber;
  int? type;
  int? capacity;
  bool? isActive;
  String? ownerName;
  String? companyName;

  Vehicle({
    this.id,
    this.name,
    this.temporaryName,
    this.licenseNumber,
    this.type,
    this.capacity,
    this.isActive,
    this.ownerName,
    this.companyName,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      name: json['name'],
      temporaryName: json['temporaryName'],
      licenseNumber: json['licenseNumber'],
      type: json['type'],
      capacity: json['capacity'],
      isActive: json['isActive'],
      ownerName: json['ownerName'],
      companyName: json['companyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'temporaryName': temporaryName,
      'licenseNumber': licenseNumber,
      'type': type,
      'capacity': capacity,
      'isActive': isActive,
      'ownerName': ownerName,
      'companyName': companyName,
    };
  }
}
