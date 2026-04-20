/// People list file.
/// 建立人物列表，並把目前是否可進聊天室的模式往下傳給每一筆項目。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/people_view/people_item.dart'; // 單筆人物列。

/// 人物清單。
/// 這個列表會出現在首頁與大螢幕聊天頁左欄。
class PeopleList extends StatelessWidget {
  final bool isNotInChatMode; // true 代表點擊人物時會開啟聊天室。

  PeopleList({this.isNotInChatMode = true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 30, // 示範用固定 30 筆人物資料。
      itemBuilder: (context, index) {
        return PeopleItem(
          isNotInChatMode: isNotInChatMode,
        );
      },
    );
  }
}
