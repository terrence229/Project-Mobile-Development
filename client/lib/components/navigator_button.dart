import 'package:flutter/material.dart';
import 'package:woosttogo/utilities/constants.dart';

/// Button used for navigating and sending HTTP requests
class NavigatorButton extends StatelessWidget {
  NavigatorButton({@required this.onPressed, @required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0, // elevation = shadows
      borderRadius: BorderRadius.circular(30.0),
      color: buttonColor,
      child: MaterialButton(
        // Makes buttons 75% width of any screen
        minWidth: MediaQuery.of(context).size.width * 0.75,
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: buttonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
