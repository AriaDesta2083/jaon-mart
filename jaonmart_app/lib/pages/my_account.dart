import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/services/wrapper.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/form_widgets.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("My Acoount", style: myBoldStyle),
                  Text(
                    "Complete your details for  \ncomplete your accounts",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ProfileForm(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

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
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference profile = firestore.collection('profile');
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: 30),
          buildLastNameFormField(),
          SizedBox(height: 30),
          buildPhoneNumberFormField(),
          SizedBox(height: 30),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: 40),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: makeColor,
                  fixedSize: Size(double.maxFinite, 56)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  profile.add({
                    'id': user.uid,
                    'firstName': _firstName.text,
                    'lastName': _lastName.text,
                    'phoneNumber': _phoneNumber.text,
                    'address': _address.text
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WProfile()));
                }
              },
              child: Text('Save'))
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: _address,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: adrdresNull);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: adrdresNull);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Address",
          hintText: "Enter your phone address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.location_on_rounded,
            color: makeColor,
          )),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneNumber,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: numberNull);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: numberNull);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.phone_rounded,
          color: makeColor,
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: _lastName,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
          labelText: "Last Name",
          hintText: "Enter your last name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.account_circle_rounded,
            color: makeColor,
          )),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: _firstName,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: nameNull);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: nameNull);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "First Name",
          hintText: "Enter your first name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.account_circle_rounded,
            color: makeColor,
          )),
    );
  }
}
