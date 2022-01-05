import 'package:flutter/material.dart';
import 'package:jsontoclass/constants.dart';
import 'package:jsontoclass/screens/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences logindata;
  String username;

  get kMediumHeading => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Choose your dashboard!",
                style: kLargeHeading.copyWith(
                    color: kBlackColor, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: getProportionateScreenHeight(250)),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'DashBoard1',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'DashBoard2',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.blue),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'DashBoard3',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.blue),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  logindata.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  width: getProportionateScreenWidth(140),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: kWhiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
