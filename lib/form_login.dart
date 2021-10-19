import 'package:flutter/material.dart';

  class FormLogin extends StatefulWidget {
    @override
    _FormLoginState createState() => _FormLoginState();
  }

  class _FormLoginState extends State<FormLogin> {
    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _buildBody(),
      );
    }
    _buildBody() {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 40,right: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150.0,),
                Text("Welcome",style: TextStyle(fontSize: 34,color: Colors.blueGrey,fontFamily: "Roboto-Medium"),),
                Text("Num Academy",style: TextStyle(fontSize: 34,color: Colors.blueGrey,fontFamily: "Roboto-Medium"),),
                SizedBox(height: 20,),
                TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator:(value) {
                        if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            return "Enter your correct name";
                        }else {
                            return null;
                        }
                    }
                ),
                SizedBox(height: 20,),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter email",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator:(value) {
                      if(value!.isEmpty || RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value!)) {
                        return "Enter your correct email";
                      }else {
                        return null;
                      }
                    }
                ),
                SizedBox(height: 20,),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator:(value) {
                      if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        return "Enter your correct password";
                      }else {
                        return null;
                      }
                    }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wait..')),
                        );
                      }
                    },
                    child: const Text('Login',style: TextStyle(fontFamily: "Roboto-Medium"),),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
  }
