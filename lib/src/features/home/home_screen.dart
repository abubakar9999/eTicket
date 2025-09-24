

import 'package:eticket/src/core/utils/color_utils.dart';
import 'package:eticket/src/features/home/widgets/home_screen_custom_button.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Column(
                children: [

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [

                        Expanded(
                          child: CustomButton(
                            text: "Test",
                            icon: Icons.sailing_outlined,
                            onPressed: () {},
                            iconColor: Colors.white,
                            //backgroundColor: Colors.green, // ✅ custom background
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [

                        Expanded(
                          child: CustomButton(
                            text: "Test",
                            icon: Icons.account_balance_wallet,
                            onPressed: () {},
                            iconColor: Colors.white,
                            //backgroundColor: Colors.green, // ✅ custom background
                          ),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: CustomButton(
                            text: 'Test11',
                            icon: Icons.adb,
                            iconColor: Colors.white,
                            onPressed: () async {
                            },
                          ),
                        ),

                        const SizedBox(width: 2),
                        Expanded(
                          child: CustomButton(
                            text: 'Test11',
                            icon: Icons.add_alarm_sharp,
                            iconColor: Colors.white,
                            onPressed: () async {
                            },
                          ),
                        )

                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [

                        Expanded(
                          child: CustomButton(
                            text: "Test",
                            icon: Icons.tips_and_updates,
                            onPressed: () {},
                            iconColor: Colors.white,
                            //backgroundColor: Colors.green, // ✅ custom background
                          ),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: CustomButton(
                            text: 'Test11',
                            icon: Icons.backup_table,
                            iconColor: Colors.white,
                            onPressed: () async {
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



