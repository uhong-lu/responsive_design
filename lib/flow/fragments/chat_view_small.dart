/// Small chat view file.
/// 手機版聊天室，使用單欄排列顯示訊息列表與輸入列。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/res/custom_colors.dart'; // Flow 主題色。
import 'package:responsive_design/flow/widgets/chat_view/chat_list.dart'; // 訊息列表。
import 'package:responsive_design/flow/widgets/send_widget.dart'; // 輸入列。

/// 小螢幕聊天室版型。
/// 單欄設計符合手機使用習慣，上方是 AppBar，下方是聊天內容。
class ChatViewSmall extends StatelessWidget {
  final Color profileIconColor; // 模擬聊天對象頭像的顏色。

  ChatViewSmall(this.profileIconColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue_gray,
        title: Text(
          'Chats',
          style: TextStyle(
            fontFamily: 'SansitaSwashed',
            fontSize: 28,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}, // 目前保留為 UI 示意。
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: ChatList(profileIconColor)), // 上方可捲動的聊天訊息區。
            SendWidget(), // 固定在底部的輸入列。
          ],
        ),
      ),
    );
  }
}
