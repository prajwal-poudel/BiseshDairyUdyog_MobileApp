import 'package:bisesh_dairy_udyog_app/Pages/Home.dart';
import 'package:bisesh_dairy_udyog_app/SelectPage.dart';
import 'package:bisesh_dairy_udyog_app/utils/customPageRoute.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: deviceWidth * 0.5,
              child: ClipRRect(
                child: Image.asset("assets/images/Amul.png"),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome back!",
                    style: TextStyle(fontSize: deviceWidth * 0.05),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Login to your account",
                      style: TextStyle(fontSize: deviceWidth * 0.03),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.04),
              child: Container(
                width: deviceWidth * 0.8,
                child: Form(
                  child: Column(
                    children: [
                      Material(
                          elevation: 5,
                          type: MaterialType.canvas,
                          borderRadius:
                              BorderRadius.circular(deviceHeight * 0.04),
                          shadowColor: Theme.of(context).primaryColor,
                          child: Container(
                              height: deviceHeight * 0.07,
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    prefixIcon: Icon(Icons.phone_android),
                                    border: InputBorder.none),
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: deviceHeight * 0.04),
                        child: Material(
                            elevation: 5,
                            type: MaterialType.canvas,
                            borderRadius:
                                BorderRadius.circular(deviceHeight * 0.04),
                            shadowColor: Theme.of(context).primaryColor,
                            child: Container(
                                height: deviceHeight * 0.07,
                                decoration: BoxDecoration(),
                                child: TextFormField(
                                  obscuringCharacter: "*",
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                      border: InputBorder.none),
                                ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: deviceHeight * 0.04),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  CustomPageRoute(child: Home()),
                                  (route) => false);
                            },
                            child: Text("Sign in")),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
