import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/mask_widget.dart';
import 'package:provider/provider.dart';

import 'base.dart';
import 'base_builder.dart';
import 'base_model.dart';

abstract class BasePage<T extends BaseModel> extends StatefulWidget {
  T mModel;

  BasePage(this.mModel);

  ///定义appbar
  PreferredSizeWidget initAppBar(BuildContext context) {
    return null;
  }

  ///定义body
  Widget initBody(BuildContext context);

  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }

  bool isSupportMask() => true;
}

class _BasePageState extends State<BasePage>
    with AutomaticKeepAliveClientMixin {
  bool isFirstStart = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (isFirstStart) {
      init(context);
      widget.mModel.init();

      ///延迟初始化
      Future.delayed(Duration(milliseconds: 400), () {
        widget.mModel.initLoad();
      });
      isFirstStart = false;
    }
    return Scaffold(
      appBar: _createAppBar(context),
      body: createBody(context),
    );
  }

  void init(BuildContext context) {
    widget.mModel.mContext = context;
  }

  ///创建AppBar
  PreferredSizeWidget _createAppBar(BuildContext context) {
    PreferredSizeWidget appBar = widget.initAppBar(context);
    return appBar ??
        PreferredSize(
            child: AppBar(
              elevation: 0,
              title: Text("默认标题"),
            ),
            preferredSize: Size.fromHeight(0.0));
  }

  @override
  void dispose() {
    super.dispose();
    widget.mModel.onDispose();
  }

  ///创建布局
  Widget createBody(BuildContext context) {
    Widget body = widget.initBody(context);

    return SizedBox(
      child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Stack(
            children: <Widget>[
              body ?? Container(),
              widget.mModel.isShowLoading ? _createLoading() : Container(),
              widget.isSupportMask() ? MaskWidget() : Container(),
            ],
          )),
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _createLoading() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Color(0x88cccccc)),
              child: SizedBox(
                height: 128,
                width: 128,
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            )
          ],
        ),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
