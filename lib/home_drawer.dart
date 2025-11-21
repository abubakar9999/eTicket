import 'package:eticket/src/core/utils/context.dart';
import 'package:eticket/src/features/user/users.dart';
import 'package:eticket/src/features/vehicles_owner/vehicles_owner_list_screen.dart';
import 'package:flutter/material.dart';




class AppDrawer extends StatefulWidget {
  //final List<AllNotification>? notification;

  const AppDrawer({super.key,
    //required this.notification
  });
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Color(0xff36B7B3),
        child:
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff36B7B3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/noData.png', // Replace with your logo asset
                    height: 80,
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Text('Vehicles Owner'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  VehiclesOwnerListScreen()));
              },
            ),
            ListTile(
              title: Text('Vehicles'),
              leading: const Icon(Icons.directions_car),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Users'),
              leading: const Icon(Icons.directions_car),
              onTap: () {
                context.push(CreateUserScreen());
              },
            ),
            ExpansionTile(
              title: Text('vehicles route'),
              leading: const Icon(Icons.people),
              children: [
                ListTile(
                  leading: const Icon(Icons.double_arrow),
                  title: Text('route list'),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.double_arrow),
                  title: Text('add route'),
                  onTap: () {
                  },
                ),
              ],
            ),

            ExpansionTile(
              title: Text('settings'),
              leading: const Icon(Icons.settings),
              children: [
                ListTile(
                  leading: const Icon(Icons.double_arrow),
                  title: Text('change_password'),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePasswordScreen(),));
                  },
                ),

              ],
            ),

            ListTile(
              leading: const Icon(Icons.language),
              title: Text('language'), // Use .tr for translation support
              onTap: () {
                //LanguageSelector().builddialog(context); // ✅ FIXED: Call the dialog function
              },
            ),

          ],
        )
    );
  }
}
