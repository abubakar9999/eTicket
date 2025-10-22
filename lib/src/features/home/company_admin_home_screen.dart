import 'dart:convert';
import 'package:eticket/src/core/utils/color_utils.dart';
import 'package:eticket/src/features/home/Model/company_admin_model.dart';
import 'package:flutter/material.dart';


class CompanyAdminHomeScreen extends StatefulWidget {
  CompanyAdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompanyAdminHomeScreen> createState() => _CompanyAdminHomeScreenState();
}

class _CompanyAdminHomeScreenState extends State<CompanyAdminHomeScreen> {
  // 🔹 Static JSON data
  final String jsonData = '''
  {
    "companies": [
      {
        "id": 1,
        "name": "MH Travels",
        "address": "Bus Depo, Natore",
        "email": "mh@eticket.com",
        "phone": "55556765456",
        "isActive": true
      }
    ],
    "owners": [
      {
        "id": 1,
        "firstName": "Mahadi",
        "lastName": "Hassan",
        "email": "mithun.2121@yahoo.com",
        "phone": "01751001003",
        "isActive": true,
        "numOfVehicle": 2
      },
      {
        "id": 2,
        "firstName": "Bob",
        "lastName": "T",
        "email": "sarowar@gmail.com",
        "phone": "01000000000",
        "isActive": true,
        "numOfVehicle": 1
      }
    ],
    "vehicles": [
      {
        "id": 1,
        "name": "Bus A",
        "temporary_name": null,
        "license_number": "L000A",
        "type": 1,
        "capacity": 52,
        "isActive": true,
        "ownerName": "Mahadi Hassan",
        "companyName": "MH Travels"
      },
      {
        "id": 2,
        "name": "Bus B",
        "temporary_name": null,
        "license_number": "L000B",
        "type": 2,
        "capacity": 52,
        "isActive": true,
        "ownerName": "Mahadi Hassan",
        "companyName": "MH Travels"
      },
      {
        "id": 3,
        "name": "Bus C",
        "temporary_name": null,
        "license_number": "L000C",
        "type": 2,
        "capacity": 52,
        "isActive": true,
        "ownerName": "Bob",
        "companyName": "MH Travels"
      }
    ]
  }
  ''';

  @override
  Widget build(BuildContext context) {
    // Parse JSON into model
    final Map<String, dynamic> data = jsonDecode(jsonData);
    final companyAdminModel = CompanyAdminModel.fromJson(data);

    final company = companyAdminModel.companies?.first;
    final owners = companyAdminModel.owners ?? [];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: ColorUtils.getPrimaryGradientColor(),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change drawer icon color to white
        ),
        title: Text('Home Screen', style: TextStyle(color: ColorUtils.getBackgroundColor()),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Company Info
                  Text(
                    company?.name ?? "",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text("Address: ${company?.address ?? ""}"),
                  Text("Email: ${company?.email ?? ""}"),
                  Text("Phone: ${company?.phone ?? ""}"),
                  const Divider(height: 20, thickness: 1),

                  // 🔹 Owners Info (Horizontal Scroll)
                  const Text("Owners:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: owners.length,
                      itemBuilder: (context, index) {
                        final owner = owners[index];
                        return Container(
                          width: 220,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueGrey.shade100),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${owner.firstName ?? ""} ${owner.lastName ?? ""}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(owner.email ?? "N/A"),
                              Text(owner.phone ?? ""),
                              Text("Vehicles: ${owner.numOfVehicle ?? 0}"),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
