import 'package:flutter/material.dart';

ThemeData themeDefault = ThemeData(
  platform: TargetPlatform.iOS,
  appBarTheme: const AppBarTheme(
    elevation: 1,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.8,
    ),
  ),
  //fontFamily: GoogleFonts.robotoSlab().fontFamily,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey.withOpacity(0.38),
      disabledBackgroundColor: Colors.grey.withOpacity(0.12),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(),
  ),
  checkboxTheme: CheckboxThemeData(
    // The color that fills the checkbox
    fillColor: MaterialStateProperty.all(Colors.blue),
    //The color to use for the check icon when this checkbox is checked
    checkColor: MaterialStateProperty.all(Colors.white),
    //shape: CircleBorder(), // diplay checkbox with circle shape
    // shape: RoundedRectangleBorder(
    //   borderRadius:
    //       BorderRadius.circular(5), // or make the border slightly rounded
    // ),
    side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.3, color: Colors.grey.shade400),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    fillColor: Colors.grey.shade100,
    focusColor: Colors.grey.shade200,
    filled: true,
    // this.errorBorder,
    // this.focusedBorder,
    // this.focusedErrorBorder,
    // this.disabledBorder,
    // this.enabledBorder,
    // this.border,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.white70,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: Colors.grey.shade400,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade300,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    // floatingLabelStyle: TextStyle(
    //   color: Colors.grey.shade300,
    // ),
  ),
);

class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final bool isDisabled;
  final Function() onPressed;
  MyButton({
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.green,
    this.textColor = Colors.white,
    this.isDisabled = false,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      onPressed: isDisabled ? null : onPressed,
      disabledColor: Colors.blue[100],
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}

TextStyle buttonTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.8,
);
