import 'package:flutter/material.dart';

class CusAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading;

  CusAppBar({this.title, this.showLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: showLeading
          ? GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              behavior: HitTestBehavior.opaque,
            )
          : Container(),
      title: Text(
        title ?? "默认标题",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
