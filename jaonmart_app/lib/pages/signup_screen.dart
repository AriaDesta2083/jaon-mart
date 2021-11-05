import 'package:flutter/material.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/sign_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Sign Up"),
          ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03), // 4%
                  Text("Register Account", style: myBoldStyle),
                  Text(
                    "Complete your details for register ",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  SignUpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//! FORM

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 28),
          buildPasswordFormField(),
          SizedBox(height: 28),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: 38),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: makeColor,
                fixedSize: Size(double.maxFinite, 56)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.of(context).pushNamed('/signin');
              }
            },
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: pwNull);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: pwFalse);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: pwNull);
          return "";
        } else if ((password != value)) {
          addError(error: pwFalse);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: Icon(
          Icons.lock,
          color: makeColor,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: pwNull);
        } else if (value.length >= 8) {
          removeError(error: pwInvalid);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: pwNull);
          return "";
        } else if (value.length < 5) {
          addError(error: pwInvalid);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: Icon(
          Icons.lock,
          color: makeColor,
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNulll);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: emailInvalid);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: emailNulll);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: emailInvalid);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: Icon(
          Icons.mail,
          color: makeColor,
        ),
      ),
    );
  }
}
