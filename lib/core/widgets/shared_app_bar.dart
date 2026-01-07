


import 'package:clean_architecture_idea_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';



class SharedAppBar extends StatelessWidget {
  const SharedAppBar({super.key,required this.title,this.hasBack=false});


  final String title;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: AppColors.c152256,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [

          hasBack?
          InkWell(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: AppColors.white,)):SizedBox.shrink(),
          Spacer(),
          Text(title,style: TextStyle(color: AppColors.white,fontSize: 25),),
          Spacer(),
        ],
      ),
    );
  }
}
