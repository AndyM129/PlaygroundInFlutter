import 'package:flutter/material.dart';
import 'package:playground_in_flutter/playground/hello_flutter/hello_flutter.dart';
import 'package:playground_in_flutter/playground/times_counter/times_counter_page.dart';
import 'package:playground_in_flutter/playground/text/text_page.dart';
import 'package:playground_in_flutter/playground/button/button_page.dart';
import 'package:playground_in_flutter/playground/image/image_page.dart';
import 'package:playground_in_flutter/playground/icon/icon_page.dart';
import 'package:playground_in_flutter/playground/check_box/check_box_page.dart';
import 'package:playground_in_flutter/playground/text_field/text_field_page.dart';
import 'package:playground_in_flutter/playground/form/form_page.dart';

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
    title: "Widget - Text",
		page: TextPage(),
  ),
	Entry(
    title: "Widget - Button",
		page: ButtonPage(),
  ),
	Entry(
    title: "Widget - Image",
		page: ImagePage(),
  ),
	Entry(
    title: "Widget - Icon",
		page: IconPage(),
  ),
	Entry(
    title: "Widget - CheckBox",
		page: CheckBoxPage(),
  ),
	Entry(
    title: "Widget - TextField",
		page: TextFieldPage(),
  ),
	Entry(
    title: "Widget - Form",
		page: FormPage(),
  ),
  Entry(
    title: "···",
  ),
];