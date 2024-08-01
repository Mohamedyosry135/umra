import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umra/resources/common_assets.dart';

import '../../../../../../consts/colors.dart';



class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
    required this.height,required this.child
  }) : super(key: key);

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.navbar(),),fit: BoxFit.fill)


         ),
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}