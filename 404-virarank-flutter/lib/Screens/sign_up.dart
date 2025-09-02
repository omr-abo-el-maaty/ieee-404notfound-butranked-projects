import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ieee/Screens/sign_in.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

var _formkey = GlobalKey<FormState>();

var _emailController = TextEditingController();

var _passwordController = TextEditingController();

var _usernameController = TextEditingController();

bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/signup_png.png',
                width: 80,
                fit: BoxFit.cover,)),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                              validator: (value) {
                                if(value == null || value.isEmpty)
                                return 'Please,enter your email';
                                if(!value.contains('@'))
                                return 'Please,enter valid email';
                              },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xff5893D4),
                              ),
                              hintText: 'Email address',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _usernameController,
                              validator: (value) {
                                if(value == null || value.isEmpty)
                                return 'Please,enter your username';
                                if(value.length < 4)
                                return 'User Name shouldn\'t be less than 4 characters';
                              },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_pin_outlined,
                            color: Color(0xff5893D4),
                          ),
                          hintText: 'User Name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if(value == null || value.isEmpty)
                            return 'Please,enter your password';
                            if(value.length < 8)
                            return 'Your password should be more than or equal to \n8 characters';
                          },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color(0xff5893D4),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      ],
                      ),
                    ),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if(_formkey.currentState!.validate()){
                              print('Valid Inputs');
                            }
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xff5893D4),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        social_icons('assets/images/google.png'),
                        social_icons('assets/images/facebook.png'),
                        social_icons('assets/images/apple.png'),
                      ],
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                                    },                                  
                                  text: 'sign in',
                                  style: TextStyle(color: Color(0xff5893D4)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 120,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


