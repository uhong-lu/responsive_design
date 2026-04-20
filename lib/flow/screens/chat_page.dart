/// Chat page file.
/// 聊天頁入口，會根據裝置方向與寬度切換小版或大版聊天室版面。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/fragments/chat_view_large.dart'; // 大螢幕聊天版型。
import 'package:responsive_design/flow/fragments/chat_view_small.dart'; // 小螢幕聊天版型。

/// 聊天頁。
/// 這裡本身沒有內部狀態，但需要根據條件選擇要回傳哪個版型 Widget。
class ChatPage extends StatelessWidget {
  final Color profileIconColor; // 用來模擬目前聊天對象頭像顏色。

  ChatPage(this.profileIconColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        // OrientationBuilder：先取得目前畫面被判定為直向或橫向。
        builder: (context, orientation) => LayoutBuilder(
          // LayoutBuilder：再看這個聊天頁實際可用寬度。
          builder: (context, constraints) {
            // 直向時版面較窄，所以 600px 就切版；橫向時放寬到 800px。
            double breakpointWidth =
                orientation == Orientation.portrait ? 600 : 800;

            if (constraints.maxWidth < breakpointWidth) {
              // 小於 breakpoint：使用單欄聊天版型。
              return ChatViewSmall(profileIconColor);
            } else {
              // 大於等於 breakpoint：使用雙欄聊天版型。
              return ChatViewLarge(profileIconColor);
            }
          },
        ),
      ),
    );
  }
}
