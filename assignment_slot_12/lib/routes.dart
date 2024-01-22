import 'package:flutter/cupertino.dart';

import 'custom_form.dart';
import 'custom_table.dart';


final Map <String, WidgetBuilder> routes = {
  CustomForm.routeName : (context) => const CustomForm(),
  CustomTable.routeName : (context) => const CustomTable(),
};