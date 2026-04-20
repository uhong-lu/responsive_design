/// Flow color constants file.
/// 這個檔案集中管理 flow 模組使用的顏色，避免顏色值散落各處。
import 'package:flutter/material.dart'; // 提供 Color 類別。

/// Flow 模組的主題色集合。
/// 這些顏色會在聊天頁、側欄、按鈕與頭部區塊反覆使用。
class CustomColors {
  static const Color neon_green = Color(0xFF51ca98); // 明亮綠色，常拿來做強調與互動元素。
  static const Color blue_gray = Color(0xFF1a3045); // 主要深藍灰色背景。
  static const Color blue_gray_dark =
      Color(0xFF142637); // 比 blue_gray 更深，適合當 header 或分區背景。
}
