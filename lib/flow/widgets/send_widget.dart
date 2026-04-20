/// Message input bar file.
/// 這個元件模擬聊天室底部的輸入列，包含表情按鈕、輸入框與送出按鈕。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/res/custom_colors.dart'; // Flow 主題色。

/// 聊天輸入列。
/// 目前主要是展示 UI 版型，尚未綁定真正的輸入與送出邏輯。
class SendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.blue_gray, // 讓輸入列和白色聊天區有明顯分隔。
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(
                Icons.emoji_emotions,
                color: CustomColors.neon_green,
              ),
              onPressed: null, // null 代表按鈕目前停用，只展示外觀。
            ),
            Expanded(
              // Expanded：讓中間輸入框撐滿剩餘空間。
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(16.0, 0.0, 10.0, 0.0),
                  filled: true, // 讓輸入框有底色。
                  hintStyle: TextStyle(color: CustomColors.blue_gray),
                  hintText: 'Enter your message', // 提示使用者可以輸入訊息。
                  fillColor: Colors.white70,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: CustomColors.neon_green,
              ),
              onPressed: null, // 真正專案中通常會在這裡觸發送訊息。
            ),
          ],
        ),
      ),
    );
  }
}
