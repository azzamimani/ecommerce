import 'package:ecommerce/db/users.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _key = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  bool loading = false;
  bool hidePassword = true;
  String gender;
  String groupValue = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/loginpage.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.deepPurpleAccent.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                  key: _key,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/nogizaka.png',
                          width: 125,
                          height: 125,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  icon: Icon(Icons.sort_by_alpha,
                                      color: Colors.deepPurpleAccent)),
                              controller: _nameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Insert Your Name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  icon: Icon(Icons.email,
                                      color: Colors.deepPurpleAccent)),
                              controller: _emailController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Insert Your Email";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          color: Colors.white.withOpacity(0.4),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                title: Radio(
                                  value: "Male",
                                  groupValue: groupValue,
                                  onChanged: (e) => valueChanged(e),
                                ),
                                trailing: Text(
                                  "Male",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: Radio(
                                  value: "Female",
                                  groupValue: groupValue,
                                  onChanged: (e) => valueChanged(e),
                                ),
                                trailing: Text(
                                  "Female",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ListTile(
                              title: TextFormField(
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    icon: Icon(Icons.vpn_key,
                                        color: Colors.deepPurpleAccent)),
                                controller: _passwordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Insert Your Password";
                                  } else if (value.length < 6) {
                                    return "Your Password should be at least 6 character long";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = false;
                                  });
                                },
                                icon: Icon(Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ListTile(
                              title: TextFormField(
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm Password",
                                    icon: Icon(Icons.lock_outline,
                                        color: Colors.deepPurpleAccent)),
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Insert Your Password";
                                  } else if (value.length < 6) {
                                    return "Your Password should be at least 6 character long";
                                  } else if (_passwordController.text !=
                                      value) {
                                    return "Password does not match";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = false;
                                  });
                                },
                                icon: Icon(Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MaterialButton(
                          color: Colors.blueAccent,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          onPressed: () {
                            validateForm();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already have an Account? ",
                                  style: TextStyle(color: Colors.white)),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text("Sign In",
                                    style: TextStyle(color: Colors.redAccent)),
                              )
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.8),
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
              ),
            ),
          )
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "Male") {
        groupValue = e;
      } else if (e == "Female") {
        groupValue = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _key.currentState;
    
    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((user) => {
              _userServices.createUser(
            {
            "username": _nameController.text,
            "email": _emailController.text,
            "userId": user,
            "gender": gender,
            }
        )
        }).catchError((err) => {print(err.toString())});

    Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => HomePage()));

      }
    }
  }
}
