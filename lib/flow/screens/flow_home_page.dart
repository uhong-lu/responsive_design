/// Flow home page file.
/// Flow 模組的總入口，負責依照畫面寬度切換手機版或大螢幕版首頁。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/fragments/home_view_large.dart'; // 大螢幕首頁版型。
import 'package:responsive_design/flow/fragments/home_view_small.dart'; // 小螢幕首頁版型。

/// Flow 首頁。
/// 使用 StatefulWidget，因為目前選中的分頁索引會隨使用者操作改變。
class FlowHomePage extends StatefulWidget {
  @override
  _FlowHomePageState createState() => _FlowHomePageState();
}

class _FlowHomePageState extends State<FlowHomePage> {
  int _currentIndex = 0; // 目前選中的頁籤索引，0 代表第一個分頁。

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        // LayoutBuilder：依照這個頁面實際拿到的寬度來決定顯示哪種版型。
        builder: (context, constraints) {
          // 小於 600px 視為手機版，顯示 bottom navigation 版型。
          if (constraints.maxWidth < 600) {
            return HomeViewSmall(_currentIndex, (index) {
              // 子頁點擊分頁後，透過 callback 把新 index 傳回父層。
              setState(() {
                _currentIndex = index;
              });
            });
          } else {
            // 600px 以上改用大螢幕版型，通常會顯示側邊選單。
            return HomeViewLarge(_currentIndex, (index) {
              setState(() {
                _currentIndex = index;
              });
            });
          }
        },
      ),
    );
  }
}
