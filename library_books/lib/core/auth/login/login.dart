import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:library_books/core/auth/signup/signup.dart';
import 'package:library_books/core/auth/controller/loginController.dart';
import 'package:library_books/core/presentation/views/home_page.dart';
import 'package:library_books/core/presentation/widgets/forgot_password.dart';
import 'package:library_books/core/presentation/widgets/otp_view_screen.dart';
import 'package:library_books/helper/image.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  bool _obscureText = true;
  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.deepOrangeAccent,
    Colors.black,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            ColorizeAnimatedText('Log In_',
                                textStyle: colorizeTextStyle,
                                speed: const Duration(milliseconds: 500),
                                colors: colorizeColors,
                                textAlign: TextAlign.center),
                            ColorizeAnimatedText('Sign In yourself_',
                                textStyle: colorizeTextStyle,
                                speed: const Duration(milliseconds: 500),
                                colors: colorizeColors,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "Looks like you don't have an account. Let's create your ",
                                          ),
                                          TextSpan(
                                            text: "new account ",
                                            style: TextStyle(
                                              color: Colors.amber[200],
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.to(SignupScreen());
                                              },
                                          ),
                                          TextSpan(
                                            text: "here.",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(OtpViewScreen());
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.amber[200]),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                Text('or'),
                                Expanded(
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(google),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(facebook),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(linkdin),
                                      iconSize: 50,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(x),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: ElevatedButton(
                                onPressed: () => Get.to(MyHomePage(
                                  key: formGlobalKey,
                                )),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 70),
                                  backgroundColor: Colors.amber[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Continue to Log in ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
