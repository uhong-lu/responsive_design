/// People item file.
/// 建立單筆人物列，點擊後可依模式決定是否進入聊天室。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:random_color/random_color.dart'; // 用隨機顏色模擬不同人物頭像。
import 'package:responsive_design/flow/screens/chat_page.dart'; // 點擊人物後要前往的聊天頁。
import 'package:responsive_design/flow/widgets/text_view.dart'; // 假文字骨架元件。

/// 單筆人物項目。
/// 這個元件同時被首頁人物清單與大螢幕聊天左欄共用。
class PeopleItem extends StatelessWidget {
  final RandomColor _randomColor = RandomColor(); // 幫每筆人物生成不同頭像色。
  final bool isNotInChatMode; // true：允許點擊後打開聊天室。

  PeopleItem({this.isNotInChatMode = true});

  @override
  Widget build(BuildContext context) {
    Color profileColor = _randomColor.randomColor(); // 本人物列的頭像顏色。

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 16.0,
          right: 40.0,
        ),
        child: InkWell(
          // InkWell：讓整列都可以被點擊，並帶有觸控波紋效果。
          onTap: () {
            if (isNotInChatMode) {
              // 只有在「不在聊天室模式」時，點人名才會進入聊天頁。
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatPage(profileColor),
                ),
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: profileColor,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextViewSmall(), // 上面一行較短，模擬姓名。
                    SizedBox(height: 8.0),
                    TextViewMedium(), // 下面一行較長，模擬最後訊息摘要。
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
