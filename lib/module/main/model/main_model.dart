import 'package:flutter/material.dart';
import 'package:flutter_app/base/base.dart';
import 'package:flutter_app/module/increment/model/counter_model.dart';
import 'package:flutter_app/module/increment/page/increment_page.dart';
import 'package:flutter_app/module/mine/model/mine_model.dart';
import 'package:flutter_app/module/mine/page/mine_page.dart';
import 'package:flutter_app/module/setting/setting_page.dart';
import 'package:provider/provider.dart';

class MainModel extends BaseModel {
  int currentPosition = 0;

  PageController controller;

  List<Widget> children;

  MainModel() {
    children = [];
    controller = PageController(initialPage: 0);

    children.add(ChangeNotifierProvider.value(
        value: CounterModel(),
        child: BaseBuilder<CounterModel>(
          (model) {
            return IncrementPage(model);
          },
        )));
    children.add(ChangeNotifierProvider.value(
      value: MineModel(),
      child: BaseBuilder<MineModel>((model) {
        return MinePage(model);
      }),
    ));
    children.add(SettingWidget());
  }

  void change(int position) {
    LogUtils.println("位置变化 $position");
    currentPosition = position;
    controller.jumpToPage(currentPosition);
    notifyListeners();
  }

  void pageChange(int position) {
    LogUtils.println("位置变化 $position");
    currentPosition = position;
    notifyListeners();
  }
}
