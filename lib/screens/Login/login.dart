import 'package:flutter/material.dart';
import 'package:jsontoclass/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../size_config.dart';
import 'home.dart';

List users = ['user', 'admin', 'host'];
List passwords = ['system', 'password', '123456789'];

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  SharedPreferences logindata;
  bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFF232F3E),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                  height: getProportionateScreenHeight(
                      SizeConfig.screenHeight * 0.30)),
              Text('LogIn',
                  style:
                      kLargeHeading.copyWith(color: kWhiteColor, fontSize: 28)),
              TextInputField(
                obscureText: false,
                hinttext: 'Enter your username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
                controller: nameController,
              ),
              TextInputField(
                hinttext: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be atleast 6 characters';
                  }
                  return null;
                },
                controller: passController,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //listCheck();
                  String username = nameController.text;
                  String password = passController.text;
                  if (_formKey.currentState.validate()) {
                    if ((users.contains(username) &&
                            passwords.contains(password)) ==
                        true) {
                      logindata.setBool('login', false);
                      logindata.setString('username', username);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User not found')),
                      );
                    }
                  }
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
                      'Log In',
                      style: kMediumHeading,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  final String hinttext;
  final Function validator;
  final TextEditingController controller;
  final bool obscureText;

  const TextInputField({
    Key key,
    this.hinttext,
    this.validator,
    this.controller,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(40)),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: Colors.white60, style: BorderStyle.solid)),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: TextStyle(color: Colors.white60),
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none),
            onChanged: (value) {},
            validator: validator,
            controller: controller,
            obscureText: obscureText,
          ),
        ),
      ),
    );
  }
}
