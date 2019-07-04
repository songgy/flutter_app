import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MaskModel>.value(
      value: maskModel,
      child: Consumer<MaskModel>(builder: (context, model, child) {
        return _MaskWidget(model);
      }),
    );
  }
}

class _MaskWidget extends StatelessWidget {
  MaskModel model;

  _MaskWidget(this.model);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    ///如果需要显示toast
    if (model.isShowToast) {
      widgets.add(Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16),
        alignment: Alignment.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Color(0xeecccccc),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  model.text ?? "默认",
                  softWrap: true,
                )
              ],
            ),
          ),
        ),
      ));
    }

    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: widgets,
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}

///浮层数据
class MaskModel with ChangeNotifier {
  String text;
  bool isShowToast = false;
  final int toastTime = 2;
  final String toastText = "默认文本";
  Timer _timer;

  ///显示
  void showToast(String msg) {
    text = msg ?? toastText;
    isShowToast = true;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(seconds: toastTime), () {
      _hideToast();
    });
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  ///隐藏
  void _hideToast() {
    isShowToast = false;
    text = toastText;
    _timer = null;
    notifyListeners();
  }
}
