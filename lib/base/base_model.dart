import 'package:flutter/material.dart';
import 'package:flutter_app/widget/mask_widget.dart';

import '../main.dart';
import 'base.dart';

///model基础类
class BaseModel with ChangeNotifier {
  BuildContext mContext;
  bool isShowLoading = false;

  ///加载
  void init() {}

  ///执行耗时初始化
  void initLoad() {}

  ///销毁
  void onDispose() {}

  void showToast(String msg) {
    maskModel.showToast(msg);
  }

  void showLoading() {
    isShowLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isShowLoading = false;
    notifyListeners();
  }
}
