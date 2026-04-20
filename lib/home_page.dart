/// Home page file.
/// 首頁頁面，負責列出所有 responsive layout demo 的入口按鈕。
import 'package:flutter/material.dart'; // Flutter Material 元件庫。

// 下面這些 import 都是本專案內各個 demo 頁面的入口。
import 'package:responsive_design/flow/screens/flow_home_page.dart'; // Flow 模組首頁。
import 'package:responsive_design/layouts/aspect_ratio_layout.dart'; // AspectRatio 示範頁。
import 'package:responsive_design/layouts/expanded_flexible_layout.dart'; // Expanded / Flexible 示範頁。
import 'package:responsive_design/layouts/fractionally_sized_box_layout.dart'; // FractionallySizedBox 示範頁。
import 'package:responsive_design/layouts/layout_builder_layout.dart'; // LayoutBuilder 示範頁。
import 'package:responsive_design/layouts/media_query_layout.dart'; // MediaQuery 示範頁。
import 'package:responsive_design/layouts/orientation_builder_layout.dart'; // OrientationBuilder 示範頁。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 版面 demo 共用顏色常數。

/// 首頁 Widget。
/// 這個頁面本身沒有內部狀態，所以使用 StatelessWidget 即可。
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold：Material 頁面的基本骨架。
    return Scaffold(
      body: SafeArea(
        // SafeArea：避免內容被狀態列、瀏海或底部手勢區遮住。
        child: Padding(
          padding: const EdgeInsets.all(16.0), // 讓按鈕不要直接貼齊螢幕邊緣。
          child: Column(
            // spaceEvenly：讓每個按鈕在垂直方向平均分散排列。
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 每個 LabelWidget 都是一列可點擊的大按鈕。
              LabelWidget('Flow', FlowHomePage()),
              // 注意：這個字串保留原專案中的拼字 MediaQeuryLayout。
              LabelWidget('MediaQeuryLayout', MediaQueryLayout()),
              LabelWidget('LayoutBuilderLayout', LayoutBuilderLayout()),
              LabelWidget(
                'OrientationBuilderLayout',
                OrientationBuilderLayout(),
              ),
              LabelWidget('ExpandedFlexibleLayout', ExpandedFlexibleLayout()),
              LabelWidget(
                'FractionallySizedBoxLayout',
                FractionallySizedBoxLayout(),
              ),
              LabelWidget('AspectRatioLayout', AspectRatioLayout()),
            ],
          ),
        ),
      ),
    );
  }
}

/// 可重用的導頁按鈕 Widget。
/// - label：按鈕上要顯示的文字。
/// - widget：點擊後要前往的目標頁面。
class LabelWidget extends StatelessWidget {
  final String label; // 按鈕文字，例如 Flow。
  final Widget widget; // 目標頁面 Widget。

  LabelWidget(this.label, this.widget); // 建立一個「文字 + 目標頁」的導頁按鈕。

  @override
  Widget build(BuildContext context) {
    // Row 搭配 Expanded 的常見寫法：讓按鈕可以撐滿整列寬度。
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            // styleFrom：快速設定按鈕外觀。
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.darkGreen, // 按鈕背景色。
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 讓按鈕有圓角。
              ),
            ),
            onPressed: () {
              // Navigator.push：把新頁面推到導航堆疊上。
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder 需要回傳使用者點擊後要看到的頁面。
                  builder: (context) => widget,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0), // 增加按鈕內距，讓點擊更舒服。
              child: Text(
                label, // 顯示建構子傳進來的標題文字。
                style: TextStyle(
                  color: MyColors.greenAccent, // 文字顏色。
                  fontSize: 20, // 字體大小。
                  fontFamily: 'GoogleSans', // 使用 pubspec.yaml 已註冊的字體。
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
