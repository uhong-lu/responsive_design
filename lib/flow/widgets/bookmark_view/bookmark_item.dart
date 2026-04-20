/// Bookmark item file.
/// 建立單筆收藏項目，包含頭像、標題占位、內容區塊與收藏 icon。
import 'dart:math'; // 用 Random 產生不同高度，模擬內容長短差異。

import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:random_color/random_color.dart'; // 產生隨機頭像顏色。
import 'package:responsive_design/flow/widgets/text_view.dart'; // 假文字骨架元件。

/// 單筆收藏項目。
/// 這個版型很像社群貼文摘要：左邊頭像，中間內容，右邊收藏圖示。
class BookmarkItem extends StatelessWidget {
  final RandomColor _randomColor = RandomColor(); // 模擬不同作者或來源的頭像色。
  final _randomHeight = new Random(); // 模擬收藏內容長短不同。

  static const int minHeight = 60; // 內容區最小高度。
  static const int maxHeight = 250; // 內容區最大高度。
  static const double bubbleRoundedRadius = 20; // 內容卡片圓角半徑。

  int getBubbleHeight() =>
      minHeight + _randomHeight.nextInt(maxHeight - minHeight);

  @override
  Widget build(BuildContext context) {
    Color profileColor = _randomColor.randomColor(); // 為這筆收藏項目產生頭像色。

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 8.0,
          left: 16.0,
          right: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: profileColor,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextViewMedium(), // 模擬標題或來源名稱。
                  SizedBox(height: 16.0),
                  Container(
                    height: getBubbleHeight().toDouble(),
                    decoration: BoxDecoration(
                      color: profileColor.withValues(
                          alpha: 0.3), // 使用頭像色的淡色版本當內容底色。
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(bubbleRoundedRadius),
                        bottomRight: Radius.circular(bubbleRoundedRadius),
                        topRight: Radius.circular(bubbleRoundedRadius),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 8.0),
              child: Icon(Icons.bookmark), // 右側圖示表示這是一筆收藏內容。
            ),
          ],
        ),
      ),
    );
  }
}
