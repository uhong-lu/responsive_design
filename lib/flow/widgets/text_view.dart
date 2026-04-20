/// Text placeholder widgets file.
/// 這個檔案提供一組假文字骨架元件，方便在沒有真實資料時先測試版面。
import 'package:flutter/material.dart'; // Flutter Material 元件。

/// 小尺寸假文字。
/// 透過 FractionallySizedBox 把寬度限制在父層的 40%。
class TextViewSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, // 讓假文字靠左排，看起來更像真實段落。
      widthFactor: 0.4,
      child: TextView(),
    );
  }
}

/// 中尺寸假文字。
/// 寬度設定為父層的 80%，適合模擬一般標題或較長文字。
class TextViewMedium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.8,
      child: TextView(),
    );
  }
}

/// 大尺寸假文字。
/// 寬度是 100%，代表整行都被填滿。
class TextViewLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      child: TextView(),
    );
  }
}

/// 基礎假文字元件。
/// 前面三個尺寸版本其實都只是包裝這個共用元件而已。
class TextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16, // 高度固定，模擬一行文字的視覺厚度。
      decoration: BoxDecoration(
        color: Colors.grey[300], // 淺灰色通常用來表示 loading skeleton。
        borderRadius: BorderRadius.all(
          Radius.circular(5), // 小圓角讓骨架看起來更柔和。
        ),
      ),
    );
  }
}
