

import 'package:flutter/material.dart';

abstract class TextStyles
{

  static TextStyle regular14({required BuildContext context})
  {
    return TextStyle(
      fontSize: _getResponsiveFontSize(fontSize: 14,context: context),
      fontWeight: FontWeight.normal
    );

  }



  static double _getResponsiveFontSize({required BuildContext context,required double fontSize})
  {
    double scaleFactor= MediaQuery.sizeOf(context).width/400;
    double responsiveFontSize=scaleFactor*fontSize;
    double minSize = .8 * fontSize;
    double maxSize = 1.2 * fontSize ;
    return responsiveFontSize.clamp(minSize,maxSize);
  }

}