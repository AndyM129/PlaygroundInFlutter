import 'package:flutter/material.dart';
import 'package:playground_in_flutter/playground/hello_flutter/hello_flutter.dart';
import 'package:playground_in_flutter/playground/times_counter/times_counter_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/text/text_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/button/button_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/image/image_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/icon/icon_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/check_box/check_box_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/text_field/text_field_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/form/form_page.dart';
import 'package:playground_in_flutter/playground/basic_weight/progress_indicator/progress_indicator_page.dart';

/// 实例
class Entry {
  final String title;
	final Widget page;
  // const Entry({this.title});
  Entry({this.title, this.page});
}

/// 实例数组
List<Entry> entries = [
  Entry(
    title: "Hello Flutter",
		page: HelloPage(),
  ),
  Entry(
    title: "Times Counter",
		page: TimesCounterPage(),
  ),
	Entry(
    title: "Basic Widget - Text",
		page: TextPage(),
  ),
	Entry(
    title: "Basic Widget - Button",
		page: ButtonPage(),
  ),
	Entry(
    title: "Basic Widget - Image",
		page: ImagePage(),
  ),
	Entry(
    title: "Basic Widget - Icon",
		page: IconPage(),
  ),
	Entry(
    title: "Basic Widget - CheckBox",
		page: CheckBoxPage(),
  ),
	Entry(
    title: "Basic Widget - TextField",
		page: TextFieldPage(),
  ),
	Entry(
    title: "Basic Widget - Form",
		page: FormPage(),
  ),
	Entry(
    title: "Basic Widget - ProgressIndicator",
		page: ProgressIndicatorPage(),
  ),
  Entry(
    title: "···",
  ),
];