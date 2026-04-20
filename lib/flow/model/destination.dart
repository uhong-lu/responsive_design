/// Destination model file.
/// 這個檔案定義 flow 頁面的導覽資料模型。
import 'package:flutter/material.dart'; // 提供 IconData 與內建圖示 Icons。

/// 導覽目的地資料模型。
/// 每個目的地都包含 id、標題、以及對應要顯示的 icon。
class Destination {
  const Destination(this.id, this.title, this.icon); // const 建構子代表這些資料可在編譯期固定。

  final int id; // 唯一識別碼，程式會依此判斷要顯示哪個頁面。
  final String title; // 顯示在選單或 BottomNavigationBar 上的文字。
  final IconData icon; // 對應的圖示。
}

// 所有可用的目的地資料。
// flow 畫面的小版與大版導覽都會共用這份清單。
const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Chats', Icons.chat),
  Destination(1, 'Bookmark', Icons.bookmark),
  Destination(2, 'Contacts', Icons.people),
];
