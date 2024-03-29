import 'package:diwe_flutter/pages/auth/sign_up_page.dart';
import 'package:diwe_flutter/pages/auth/widget/classes/user_data.dart';
import 'package:diwe_flutter/pages/auth/widget/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'colors.dart';
import 'meal_page.dart';
import 'connection_page.dart';
import 'emergency/emergency_page.dart';
import 'report_page.dart';
import 'prescription/prescription_page.dart';
import 'bolus_page.dart';
import 'profile/profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserModel user = UserModel();
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  child: Text(
                    'Bonjour, ${user.nom}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: AppColors.primaryColor,
              onPressed: () {
                // UserServices userServices = UserServices();
                // userServices.getUser();
                // print("kekw , ${FirebaseAuth.instance.currentUser?.email}");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: -1,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        spreadRadius: -1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Insuline',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '5.80 Unité',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Moyenne : 3.61',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            _buildDropdown(),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: _buildChart(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: _buildButtonsGrid(),
                ),
              ],
            ),
            _buildFloatingActionButton(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        items: <Widget>[
          _buildIcon(Icons.home, AppColors.primaryColor, 30),
          _buildIcon(Icons.local_dining, Color(0xFFD7D4D4), 30),
          _buildIcon(Icons.settings, Color(0xFFD7D4D4), 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            switch (_page) {
              case 0:
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
                break;
            }
          });
        },
      ),
    );
  }

  Widget _buildChart() {
    List<charts.Series<LinearSales, int>> seriesList = [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFFFC5577)),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
          LinearSales(0, 5),
          LinearSales(1, 25),
          LinearSales(2, 100),
          LinearSales(3, 75),
        ],
      )
    ];

    return charts.LineChart(
      seriesList,
      animate: true,
    );
  }

  Widget _buildDropdown() {
    List<String> dropdownItems = ['Aujourd\'hui'];
    String selectedValue = dropdownItems.first;

    return Container(
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: AppColors.primaryColor, width: 2.0),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              if (newValue != null) {
                selectedValue = newValue;
              }
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color color, double size) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }

  Widget _buildButtonsGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return _buildButton(index);
      },
    );
  }

  Widget _buildButton(int index) {
    IconData icon;
    String title;
    Function()? onTap;
    List<Color> gradientColors = [];

    switch (index) {
      case 0:
        icon = Icons.local_dining;
        title = 'Repas';
        gradientColors = [Color(0xFFFC5577), Color(0xFFD43C5E)];
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MealPage()),
          );
        };
        break;
      case 1:
        icon = Icons.bluetooth;
        title = 'Connexion';
        gradientColors = [Color(0xFF6389F3), Color(0xFF4E74E1)];
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConnectionPage()),
          );
        };
        break;
      case 2:
        icon = Icons.local_hospital;
        title = 'Urgence';
        gradientColors = [Color(0xFF52C8FA), Color(0xFF3FABE5)];
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmergencyPage()),
          );
        };
        break;
      case 3:
        icon = Icons.bar_chart;
        title = 'Bilan';
        gradientColors = [Color(0xFFFEBF96), Color(0xFFE29B6E)];
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportPage()),
          );
        };
        break;
      case 4:
        icon = Icons.receipt_long;
        title = 'Ordonnance';
        gradientColors = [Color(0xFF7BA6FF), Color(0xFF5D86FF)];
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrescriptionPage()),
          );
        };
        break;
      default:
        icon = Icons.local_pharmacy;
        title = 'Bolus';
        gradientColors = [Color(0xFF5BDEB4), Color(0xFF42B493)];
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BolusPage()),
          );
        };
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: Offset(0, 3),
              blurRadius: 5,
              spreadRadius: -1,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: -1,
            ),
          ],
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.0,
              child: Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
              backgroundColor: Colors.transparent,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

Widget _buildFloatingActionButton() {
  return Container(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ],
    ),
  );
}
