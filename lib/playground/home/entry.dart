import 'package:flutter/material.dart';
import 'package:playground_in_flutter/playground/hello_flutter/hello_flutter.dart';
import 'package:playground_in_flutter/playground/times_counter/times_counter_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/text/text_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/button/button_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/image/image_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/icon/icon_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/check_box/check_box_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/text_field/text_field_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/form/form_page.dart';
import 'package:playground_in_flutter/playground/basic_widget/progress_indicator/progress_indicator_page.dart';
import 'package:playground_in_flutter/playground/layout_widget/linear_layout_widget/linear_layout_widget_page.dart';
import 'package:playground_in_flutter/playground/layout_widget/flex_layout_widget/flex_layout_widget_page.dart';
import 'package:playground_in_flutter/playground/layout_widget/flow_layout_widget/flow_layout_widget_page.dart';
import 'package:playground_in_flutter/playground/layout_widget/stack_layout_widget/stack_layout_widget_page.dart';
import 'package:playground_in_flutter/playground/layout_widget/align_layout_widget/align_layout_widget_page.dart';
import 'package:playground_in_flutter/playground/container_widget/scaffold_widget/scaffold_widget_page.dart';
import 'package:playground_in_flutter/playground/container_widget/tabbar_widget/tabbar_widget_page.dart';
import 'package:playground_in_flutter/playground/container_widget/drawer_widget/drawer_widget_page.dart';
import 'package:playground_in_flutter/playground/container_widget/clip_widget/clip_page.dart';
import 'package:playground_in_flutter/playground/scrollable_widget/single_child_scroll_view/single_child_scroll_view_page.dart';
import 'package:playground_in_flutter/playground/scrollable_widget/list_view/list_view_page.dart';

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
    title: "Layout Widget - Row、Column",
		page: LinearLayoutPage(),
  ),
	Entry(
    title: "Layout Widget - Flex、Expanded",
		page: FlexLayoutPage(),
  ),
	Entry(
    title: "Layout Widget - Wrap、Flow",
		page: FlowLayoutPage(),
  ),
	Entry(
    title: "Layout Widget - Stack、Positioned",
		page: StackLayoutPage(),
  ),
	Entry(
    title: "Layout Widget - Align",
		page: AlignLayoutPage(),
  ),
	Entry(
    title: "Container Widget - Scaffold",
		page: ScaffoldPage(),
  ),
	Entry(
    title: "Container Widget - TabBar",
		page: TabBarPage(),
  ),
	Entry(
    title: "Container Widget - Drawer",
		page: DrawerPage(),
  ),
	Entry(
    title: "Container Widget - Clip",
		page: ClipPage(),
  ),
	Entry(
    title: "Scrollable Widget - SingleChildScrollView",
		page: SingleChildScrollViewPage(),
  ),
	Entry(
    title: "Scrollable Widget - ListView",
		page: ListViewPage(),
  ),
  Entry(
    title: "···",
  ),
];