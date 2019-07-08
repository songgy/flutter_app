import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_page.dart';
import 'package:flutter_app/module/increment/model/counter_model.dart';
import 'package:flutter_app/widget/cus_appbar.dart';
import 'package:provider/provider.dart';

class IncrementPage extends BasePage<CounterModel> {
  IncrementPage(CounterModel mModel) : super(mModel);

  @override
  PreferredSizeWidget initAppBar(BuildContext context) {
    return CusAppBar(
      title: "首页",
      showLeading: false,
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return Container(
      child: ListView(
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "页面内部数据：${mModel.num}\n全局共享数据：${mModel.appNum}",
            style: TextStyle(fontSize: 20),
          ),
          MaterialButton(
            onPressed: () {
              mModel.increment();
            },
            child: Text(
              "增加",
              style: TextStyle(fontSize: 20),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Center(
              child: Text(
                "自定义点击事件",
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              mModel.showToast("点击");
            },
          ),
          FlatButton(
              onPressed: () {
                mModel.navigator(context);
              },
              child: Text(
                "跳转到下一页",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            color: Colors.amber,
            height: 1000,
            width: 400,
            alignment: Alignment.center,
            child: Text(
                "文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位\n文字站位"),
          )
        ],
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }

}
