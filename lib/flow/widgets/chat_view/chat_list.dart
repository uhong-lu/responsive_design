/// Chat list file.
/// 這個檔案負責建立可捲動的聊天訊息列表。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/chat_view/chat_item.dart'; // 單筆聊天訊息元件。

/// 聊天訊息清單。
/// 使用 ListView.builder 代表項目很多時，畫面只會建立目前可見的那幾筆。
class ChatList extends StatelessWidget {
  final Color profileIconColor; // 傳給每則訊息，模擬對方頭像顏色。

  ChatList(this.profileIconColor);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // 讓列表在需要時依內容收縮高度。
      reverse: true, // 聊天畫面常把最新訊息放在底部，因此反轉列表方向。
      physics: BouncingScrollPhysics(), // 滾動到底時帶一點彈性效果。
      itemCount: 30, // 示範用固定 30 筆假資料。
      itemBuilder: (context, index) {
        return ChatItem(profileIconColor);
      },
    );
  }
}
