import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';

class NotificationCell extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String date;
  const NotificationCell({Key? key,required this.date,required this.imageUrl,required this.title,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(ColorCode.white),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      height: 65,
                      width: 65,
                      errorBuilder: (_,err,trace) => Container(
                        width: 65,
                        height: 65 ,
                        color: const Color(ColorCode.background),
                      ),
                    )
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.textBold18.copyWith(
                            color: const Color(ColorCode.black)
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        subtitle,
                        style: TextStyles.textSmall.copyWith(
                          color: const Color(ColorCode.black).withOpacity(.5),
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyles.textSmall.copyWith(
              color: const Color(ColorCode.black).withOpacity(.5),
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}
