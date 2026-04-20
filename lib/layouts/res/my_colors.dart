/// Layout color constants file.
/// 這個檔案集中管理 layouts/ 目錄會用到的顏色常數。
import 'package:flutter/material.dart'; // 提供 Color 類別。

/// 版面 demo 專用顏色集合。
/// 用 static const 的好處是可以直接用類別名稱存取，而且編譯期就固定不變。
class MyColors {
  static const Color darkGreen = Color(0xFF092f42); // 深色主色，用在背景或主視覺區塊。
  static const Color greenAccent = Color(0xFF4cf186); // 亮綠色強調色，用在文字或點綴。
}
