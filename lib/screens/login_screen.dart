import 'package:appsocialz/screens/home_screen.dart';
import 'package:appsocialz/widgets/login/curve_clipper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          child: Column(
            children: <Widget>[
                ClipPath(
                    clipper: CurveClipper(),
                    child: Image(
                    image: AssetImage("assets/images/login_background.jpg"),
                    height: deviceHeight / 2.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "FRENZY",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24.0,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Username",
                      prefixIcon: Icon(Icons.account_box),
                      contentPadding: EdgeInsets.only(top: 16.0),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.only(top: 16.0)
                    ),
                  ),
                ),
                SizedBox(height: 18.0),
                GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen())),
                    child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor
                    ),
                    child: Text(
                      "Login",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 18.0,
                         fontWeight: FontWeight.w600
                       ),
                    ),
                  ),
                ),
                Expanded(
                    child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
                          onTap: (){},
                          child: Container(
                          height: 45.0,
                         alignment: Alignment.center,
                         child: Text(
                           "Don't have an account? Signup",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 16.0,
                           )),
                         color: Theme.of(context).primaryColor,
                      ),
                    )
                  ),
                )
            ],
          ),
        )
      ),
    );
  }
}