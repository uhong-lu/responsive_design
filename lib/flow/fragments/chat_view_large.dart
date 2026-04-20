/// Large chat view file.
/// 大螢幕聊天室，左邊顯示聯絡人列表，右邊顯示目前聊天內容。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/fragments/people_view.dart'; // 左側人物列表。
import 'package:responsive_design/flow/res/custom_colors.dart'; // Flow 主題色。
import 'package:responsive_design/flow/widgets/chat_view/chat_list.dart'; // 聊天訊息列表。
import 'package:responsive_design/flow/widgets/send_widget.dart'; // 輸入列。

/// 大螢幕聊天室版型。
/// 雙欄設計讓使用者同時看到人物列表與目前聊天內容。
class ChatViewLarge extends StatelessWidget {
  final Color profileIconColor; // 目前聊天對象的頭像顏色。

  ChatViewLarge(this.profileIconColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2, // 左欄拿 2 份空間，放人物列表。
            child: SingleChildScrollView(
              // 讓左欄內容在高度不足時可以捲動。
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    color: CustomColors.blue_gray_dark,
                    child: SafeArea(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BackButton(color: Colors.white), // 返回上一頁。
                        ),
                      ),
                    ),
                  ),
                  // 在聊天模式下顯示人物列表，但點擊人物時不再重複 push 新聊天室。
                  PeopleView(isNotInChatMode: false),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3, // 右欄拿 3 份空間，主體是聊天區。
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child: ChatList(profileIconColor)),
                  SendWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
