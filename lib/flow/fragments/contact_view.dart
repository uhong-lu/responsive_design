/// Contact view file.
/// 聯絡人頁的包裝層，負責提供背景與承載 ContactList。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/contact_view/contact_list.dart'; // 聯絡人清單元件。

/// 聯絡人頁。
/// 真正的清單內容在 ContactList，這裡只保留畫面骨架。
class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ContactList(),
    );
  }
}
