/// People view file.
/// 這是一個很薄的包裝層，單純把 PeopleList 放進白色背景容器中。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/people_view/people_list.dart'; // 真正建立人物清單的元件。

/// 人物清單頁。
/// isNotInChatMode 用來控制點擊人物後要不要進聊天室。
class PeopleView extends StatelessWidget {
  final bool isNotInChatMode; // true：點擊人物可跳到聊天室；false：僅顯示名單。

  PeopleView({this.isNotInChatMode = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: PeopleList(isNotInChatMode: isNotInChatMode),
    );
  }
}
