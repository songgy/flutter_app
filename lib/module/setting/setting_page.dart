import 'package:flutter/material.dart';

///设置页面
class SettingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

///状态类
class _SettingState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text("退出登录"),
          leading: Icon(Icons.all_out),
          onTap: () {
            _onTap(context);
          },
        )
      ],
    );
  }

  void _onTap(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            backgroundColor: Color(0x66cccccc),
            body: SizedBox(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.amber,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 36),
                      child: Text("我是弹框"),
                    )
                  ],
                ),
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height: double.infinity,
              width: double.infinity,
            ),
          );
        });
  }
}
