import 'package:flutter_app/base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/module/main/model/main_model.dart';

class MainPage extends BasePage<MainModel> {
  MainPage(MainModel mModel) : super(mModel);

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            children: mModel.children,
            controller: mModel.controller,
            onPageChanged:(position) {
              mModel.pageChange(position);
            },
          ),
          flex: 1,
        ),
        CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.satellite), title: Text("主页")),
            BottomNavigationBarItem(icon: Icon(Icons.print), title: Text("中心")),
            BottomNavigationBarItem(
                icon: Icon(Icons.indeterminate_check_box), title: Text("我的")),
          ],
          currentIndex: mModel.currentPosition,
          onTap: (position) {
            mModel.change(position);
          },
        )
      ],
    );
  }

  @override
  bool isSupportMask() => false;
}
