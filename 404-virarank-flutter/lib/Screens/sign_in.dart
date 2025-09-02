// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ieee/Screens/sign_up.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});

var _formkey = GlobalKey<FormState>();

var _emailController = TextEditingController();

var _passwordController = TextEditingController();

bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
             Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/signin_png1.png',
                width: 140,
                fit: BoxFit.cover,
              ),
            ),            
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/images/signin_png2.png',
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text('Welcome',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                    Text('Back!',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Form(
                      key: _formkey,
                      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox( width: 160,
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if(value == null || value.isEmpty)
                                return 'Please,enter your email';
                                if(!value.contains('@'))
                                return 'Please,enter valid email';
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined,color: Color(0xff5893D4),),
                                hintText: 'Email address',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                      SizedBox(height: 30,),
                      SizedBox( width: 220,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if(value == null || value.isEmpty)
                            return 'Please,enter your password';
                            if(value.length < 8)
                            return 'Your password should be more than \nor equal to 8 characters';
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline,color: Color(0xff5893D4),),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign in',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                        GestureDetector(
                          onTap: () {
                            if(_formkey.currentState!.validate()){
                             print('Valid Inputs');
                            }
                          },
                          child: Container(
                            width: 45, height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xff5893D4),
                              shape: BoxShape.circle
                            ),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        social_icons('assets/images/google.png'),
                        social_icons('assets/images/facebook.png'),
                        social_icons('assets/images/apple.png'),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                          },
                          child: Text('Sign up',style: TextStyle(color: Colors.black,),)),
                        SizedBox(width: 20,),
                        Text('Forget Password?',style: TextStyle(color: Colors.black,))
                      ],
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: Container(
                            width: 120,height: 3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                    ),
                    SizedBox(height: 65,),
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

Widget social_icons(String img){
  return Container(
            width: 45,height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey)
            ),
            child: Center(child: Image.asset('$img',width: 25,height: 25,)),
          );
}