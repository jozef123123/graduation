import 'package:flutter/material.dart';
import 'package:graduation/layout/layout_screen.dart';

import '../../shared/components/components.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool active = true, visible = false, check = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var usernameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 40.0,
            end: 40.0,
            top: 60.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo/Full.png',
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  color: Colors.grey[100],
                ),
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(10.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 215, 0, 1),
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20.0)),
                      ),
                      padding: EdgeInsetsDirectional.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    active = !active;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      active
                                          ? Colors.white
                                          : Color.fromRGBO(255, 215, 0, 1)),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: active ? Colors.black : Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    active = !active;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      !active
                                          ? Colors.white
                                          : Color.fromRGBO(255, 215, 0, 1)),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Text(
                                  "Registration",
                                  style: TextStyle(
                                    color:
                                        !active ? Colors.black : Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: active,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: 'Write your email address',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Add Email Address Please'
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  obscureText: !visible,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: 'Write Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.key),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                      icon: !visible
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility_outlined),
                                    ),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Add Password Please'
                                      : null,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password ?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 1.0,
                                  color: Colors.grey[600],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 10.0),
                                  child: Text(
                                    'Or with',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80.0,
                                  height: 1.0,
                                  color: Colors.grey[600],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ImageIcon(
                                      AssetImage(
                                          'assets/images/logo/google.png'),
                                      size: 22.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 50.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Colors.green[800],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      if (formKey.currentState!.validate()) {
                                        print(emailController.text);
                                        print(passwordController.text);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LayoutScreen(),
                                          ),
                                        );
                                      }
                                    });
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !active,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: usernameController,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: 'Write your email address',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.account_circle),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Add Username Please'
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: 'Write your email address',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Add Email Address Please'
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone number',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: 'Write your number address',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.numbers),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Add phone number Please'
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  obscureText: !visible,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: 'Write Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.key),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                      icon: !visible
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility_outlined),
                                    ),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Add Password Please'
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: check,
                                  onChanged: (value) {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  checkColor: Colors.green,
                                  shape: ContinuousRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                Text(
                                  'Once you check this box you agree with \n our Terms and Conditions',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 1.0,
                                  color: Colors.grey[600],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 10.0),
                                  child: Text(
                                    'Or with',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80.0,
                                  height: 1.0,
                                  color: Colors.grey[600],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ImageIcon(
                                      AssetImage(
                                          'assets/images/logo/google.png'),
                                      size: 22.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.green[800],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (formKey.currentState!.validate()) {
                                      print(emailController.text);
                                      print(passwordController.text);
                                    }
                                  });
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
