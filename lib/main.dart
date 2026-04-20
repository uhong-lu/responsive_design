/// Main app entry file.
/// 這個檔案是整個 Flutter App 的進入點，負責把根 Widget 啟動起來。
import 'package:flutter/material.dart'; // Flutter 的 Material 元件庫。
import 'package:responsive_design/home_page.dart'; // 專案首頁畫面。

void main() {
  // runApp：Flutter 程式一開始最重要的函式，用來把 Widget 顯示到螢幕上。
  runApp(MyResponsiveApp());
}

/// App 根 Widget。
/// 這裡集中設定整體主題、首頁，以及 MaterialApp 的基本屬性。
class MyResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp：Material Design 風格 App 的最外層容器。
    return MaterialApp(
      title: 'Responsive Design', // App 標題，某些平台會拿來顯示在視窗資訊中。
      theme: ThemeData(
        // visualDensity：讓不同平台上的元件間距看起來更自然。
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // 移除右上角的 DEBUG 標籤。
      home: HomePage(), // App 啟動後第一個看到的頁面。
    );
  }
}
