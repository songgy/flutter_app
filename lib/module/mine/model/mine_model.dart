import 'package:flutter/material.dart';
import 'package:flutter_app/base/base.dart';
import 'package:flutter_app/base/base_resposity.dart';
import 'package:flutter_app/model/app_model.dart';
import 'package:provider/provider.dart';

class MineModel extends BaseModel {
  AppModel appModel;

  @override
  void init() {
    appModel = Provider.of<AppModel>(mContext);
  }

  void touchPhone() async {
    showLoading();
    String msg = await BaseResposity.getHttp();
    showToast(msg);
    hideLoading();
  }

  void add() {
    appModel.currentNum++;
    notifyListeners();
  }

  void pop() {
    if (Navigator.canPop(mContext)) {
      Navigator.pop(mContext, "我是上一个页面的结果数据");
    }else{
      showToast("当前页面不可以返回");
    }
  }

  void touchAddress() {
    showLoading();
    Future.delayed(Duration(seconds: 2), () {
      hideLoading();
      showToast("选择地址");
    });
  }
}
