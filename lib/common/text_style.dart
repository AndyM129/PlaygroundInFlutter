import 'package:flutter/material.dart';

class AppTextStyle extends TextStyle {
	// 标题文本字体样式
	static final TextStyle titleBaseTextStyle = TextStyle(
    color: Colors.black,
  );
	static final TextStyle titleTextStyle1 = titleBaseTextStyle.copyWith(
    fontSize: 20.0,
  );
	static final TextStyle titleTextStyle2 = titleBaseTextStyle.copyWith(
    fontSize: 18.0,
  );
	static final TextStyle titleTextStyle3 = titleBaseTextStyle.copyWith(
    fontSize: 16.0,
  );
	static final TextStyle titleTextStyle4 = titleBaseTextStyle.copyWith(
    fontSize: 14.0,
  );
	static final TextStyle titleTextStyle5 = titleBaseTextStyle.copyWith(
    fontSize: 12.0,
  );
	static final TextStyle titleTextStyle6 = titleBaseTextStyle.copyWith(
    fontSize: 10.0,
  );

	// 提示文本字体样式
	static final TextStyle tipsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10.0,
  );

  static final baseTextStyle = const TextStyle(
    fontFamily: 'Poppins'
  );
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
    color: const Color(0xffb6b2df),
    fontSize: 14.0,
    fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w400
  );
}