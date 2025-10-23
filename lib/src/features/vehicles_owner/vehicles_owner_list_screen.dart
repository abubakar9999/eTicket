import 'package:eticket/src/core/utils/color_utils.dart';
import 'package:eticket/src/features/vehicles_owner/vehicles_owner_screen.dart';
import 'package:flutter/material.dart';


class VehiclesOwnerListScreen extends StatefulWidget {
  @override
  State<VehiclesOwnerListScreen> createState() => _VehiclesOwnerListScreenState();
}

class _VehiclesOwnerListScreenState extends State<VehiclesOwnerListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: ColorUtils.getPrimaryGradientColor(),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change drawer icon color to white
        ),
        title: Text(
          'Vehicles Owner',
          style: TextStyle(color: ColorUtils.getBackgroundColor()),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Vehicles owner data not found!\n Please Add Data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VehiclesOwnerCreate(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
