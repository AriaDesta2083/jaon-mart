import 'package:flutter/material.dart';
import 'package:jaonmart_app/theme.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(
          Icons.error,
          size: 16,
          color: makeColor,
        ),
        Text(error),
      ],
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/signup'),
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: makeColor),
          ),
        ),
      ],
    );
  }
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[A-Za-z0-9._]+@[A-Za-z0-9]+\.[a-zA-Z]+");

const String emailNulll = "Masukkan Email";
const String emailInvalid = "Masukkan Email dengan benar";
const String pwNull = "Masukkan Password";
const String pwInvalid = "Password terlalu pendek";
const String pwFalse = "Passwords Salah";

const String nameNull = "Masukkan nama degan benar ";
const String numberNull = "Masukkan nomor telefon";
const String adrdresNull = "Masukkan alamat";

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
