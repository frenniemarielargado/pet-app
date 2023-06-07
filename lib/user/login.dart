import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thesis_app/home/home_screen.dart';
import 'package:thesis_app/user/signup.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //password Visibility
  bool _isPasswordVisible = false;

  //form
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;



  @override
  Widget build(BuildContext context) {


    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value)
      {
        if(value!.isEmpty) {
          return ('Please enter your email');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return ('Please enter a valid email ');
        }
        return null;
      },
      onSaved: (value)
        {
          emailEditingController.text = value!;

        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          hintText: 'Email',
            hintStyle: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Poppins',
              color: Colors.grey,
            ),
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFF5A2BAF), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFF5A2BAF), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: !_isPasswordVisible,
      controller: passwordEditingController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if(!regex.hasMatch(value))
          {
            return("Enter a valid password, minimum of 6 characters");
          }
        return null;
      },
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          hintText: 'Password',

          hintStyle: const TextStyle(
            fontSize: 17.0,
            fontFamily: 'Poppins',
            color: Colors.grey,
          ),

          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFF5A2BAF),  width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFF5A2BAF),  width: 1),
          ),
          errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          child: Icon(
            _isPasswordVisible ? Icons.visibility_rounded: Icons.visibility_off_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );


    final loginButton = SizedBox(
      height: 50,
      child: Material(
        color: const Color(0xFF8057BF) ,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          minWidth: 250,
          onPressed: () {
                  signIn(emailEditingController.text, passwordEditingController.text);
          },

          child: const Text('Log In', style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40,
                      child: Text('Log in to your Account', style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    const SizedBox(height: 35),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 40),
                    loginButton,
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          const Text("Don't have an account?", style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Colors.black,
                          ),),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: const Text(' Sign Up', style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5A2BAF),
                          ),),
                        )
                      ],
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

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be invalid.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        (error.code);
      }
    }
  }
}
