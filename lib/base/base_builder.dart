import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_model.dart';

typedef BuilderFunction = Widget Function<T>(T t);

///baseBuilder 基础类
class BaseBuilder<T extends BaseModel> extends StatelessWidget {
  final Function builder;

  BaseBuilder(this.builder);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model, child) {
        return builder(model);
      },
    );
  }
}
