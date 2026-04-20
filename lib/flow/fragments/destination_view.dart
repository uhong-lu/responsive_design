/// Destination router file.
/// 這個檔案會依照 destination.id 決定右側內容區真正要顯示哪個頁面。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/fragments/bookmark_view.dart'; // 收藏頁內容。
import 'package:responsive_design/flow/fragments/contact_view.dart'; // 聯絡人頁內容。
import 'package:responsive_design/flow/fragments/people_view.dart'; // 聊天名單頁內容。
import 'package:responsive_design/flow/model/destination.dart'; // 目的地資料模型。

/// 導頁內容切換器。
/// 它本身不負責管理資料，只根據傳進來的 destination 做顯示分流。
class DestinationView extends StatelessWidget {
  final Destination destination; // 目前選中的目的地資料。

  DestinationView(this.destination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: destination.id == 0
            // Chats 分頁先顯示人物清單，點人後再進聊天室。
            ? PeopleView()
            : destination.id == 1
                ? BookmarkView() // id = 1 顯示收藏頁。
                : ContactView(), // 其他情況在這個專案中就是聯絡人頁。
      ),
    );
  }
}
