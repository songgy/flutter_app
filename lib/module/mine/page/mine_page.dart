import 'package:flutter/material.dart';
import 'package:flutter_app/base/base.dart';
import 'package:flutter_app/module/increment/model/counter_model.dart';
import 'package:flutter_app/module/mine/model/mine_model.dart';
import 'package:flutter_app/widget/cus_appbar.dart';
import 'package:provider/provider.dart';

class MinePage extends BasePage<MineModel> {
  MinePage(MineModel mModel) : super(mModel);

  @override
  PreferredSizeWidget initAppBar(BuildContext context) {
    return CusAppBar(title: "个人资料",showLeading: false,);
  }

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Color(0x11cccccc),
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            child: Icon(Icons.satellite),
                            padding: EdgeInsets.only(right: 4),
                          ),
                          Expanded(
                            child: Text("联系电话"),
                            flex: 1,
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      Padding(
                        child: Text("请填写您的手机号码"),
                        padding: EdgeInsets.only(top: 8),
                      )
                    ],
                  ),
                ),
                onTap: mModel.touchPhone,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            child: Icon(Icons.add_location),
                            padding: EdgeInsets.only(right: 4),
                          ),
                          Expanded(
                            child: Text("我的地址"),
                            flex: 1,
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      Padding(
                        child: Text("请填写您的收件地址"),
                        padding: EdgeInsets.only(top: 8),
                      )
                    ],
                  ),
                ),
                onTap: mModel.touchAddress,
              ),
              Padding(
                child: Center(
                  child: Text(
                    "共享数据元素：${mModel.appModel == null ? "默认数据" : mModel.appModel.currentNum}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 36, horizontal: 18),
              ),
            ],
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: () {
                mModel.add();
              },
              child: Icon(Icons.add),
            ),
            bottom: 36,
            right: 18,
          )
        ],
      ),
    );
  }
}
