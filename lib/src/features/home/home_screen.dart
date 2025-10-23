
import 'package:eticket/home_drawer.dart';
import 'package:eticket/src/core/utils/color_utils.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        appBar: AppBar(
           backgroundColor: ColorUtils.getPrimaryGradientColor(),
          iconTheme: const IconThemeData(
            color: Colors.white, // Change drawer icon color to white
          ),
           title: Text('Home Screen', style: TextStyle(color: ColorUtils.getBackgroundColor()),),
        ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Column(
                children: [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



