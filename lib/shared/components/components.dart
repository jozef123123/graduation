import 'package:flutter/material.dart';

Widget defaultButton({
  double widthButton = double.infinity,
  Color bgButton = Colors.blue,
  @required String? textButton,
  @required Function()? actionButton,
  bool isUpperCase = true,
}) =>
    Container(
      width: widthButton,
      height: 45.0,
      decoration: BoxDecoration(
        color: bgButton,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
          child: Text(
            isUpperCase ? textButton!.toUpperCase() : textButton!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: actionButton),
    );

// Form
Widget defaultForm({
  @required TextEditingController? controller,
  @required TextInputType? type,
  Function(String)? onSub,
  Function(String)? onChange,
  @required String? Function(String?)? validate,
  @required String? label,
  @required IconData? prefix,
  @required IconData? suffix,
  InputBorder? border,
  bool isPassword = false,
  Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
        border: border,
      ),
      onFieldSubmitted: onSub,
      onChanged: onChange,
      validator: validate,
      
    );

Widget iconLink({
  @required Function()? onPressed,
  @required IconData? icon,
  MaterialStateProperty<double?>? elevation,
  MaterialStateProperty<double?>? sizeIcon,
}) =>
    IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      style: ButtonStyle(
        elevation: elevation,
        iconSize: sizeIcon,
      ),
    );
