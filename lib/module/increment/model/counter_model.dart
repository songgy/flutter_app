import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/base/base_builder.dart';
import 'package:flutter_app/base/base_model.dart';
import 'package:flutter_app/model/app_model.dart';
import 'package:flutter_app/module/mine/model/mine_model.dart';
import 'package:flutter_app/module/mine/page/mine_page.dart';
import 'package:flutter_app/utils/log_utils.dart';
import 'package:provider/provider.dart';

class CounterModel extends BaseModel {
  int _num = 0;

  int get num => _num;

  AppModel appModel;

  int get appNum => appModel == null ? 0 : appModel.currentNum;

  @override
  void init() {
    appModel = Provider.of<AppModel>(mContext);
    LogUtils.println("创建wenjian");
  }

  void increment() {
    _num++;
    appModel.currentNum++;
    notifyListeners();
  }

  void navigator(BuildContext context) async {
    String result =
        await Navigator.push(context, CupertinoPageRoute(builder: (b) {
      return ChangeNotifierProvider.value(
        value: MineModel(),
        child: BaseBuilder<MineModel>((model) {
          return MinePage(model);
        }),
      );
    }));
    if (result != null) {
      showToast(result);
    }
  }
}
