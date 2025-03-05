import 'package:flutter/material.dart';
import 'package:hajj_app/constants.dart';

class ListTileDrawer extends StatelessWidget {
   ListTileDrawer({super.key,required this.title,required this.icon, this.onTap});

  String? title;
  Icon? icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title!, style:const TextStyle(color: KPrimaryColor,fontSize: 20) ),
                    ),
                     icon!,
                    
                ],
              ),
              onTap: () {
                onTap!();
              },
            );
  }
}