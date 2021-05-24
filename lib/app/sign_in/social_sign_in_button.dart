import 'package:besklet/common_widget/custom_raised_button.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class SocialsignInButton extends CustomRaisedButton {
  SocialsignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(assetName),
                  Text(text,
                       style: TextStyle(color: textColor, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset(assetName),
                  ),
                ],
              ),
          color: color,
          onPressed: onPressed,
  );

}