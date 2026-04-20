/// Contact list file.
/// 聯絡人列表的職責很單純：建立可捲動的多筆 ContactItem。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/contact_view/contact_item.dart'; // 單筆聯絡人列。

/// 聯絡人清單。
/// 當資料很多時，ListView.builder 是最常見的建立方式。
class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(), // 加入 iOS 風格的回彈捲動感。
      itemCount: 20, // 這個 demo 固定建立 20 筆聯絡人。
      itemBuilder: (context, index) {
        return ContactItem();
      },
    );
  }
}
