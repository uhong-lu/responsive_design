/// Chat item file.
/// 這個檔案建立單筆聊天列，並用隨機高度與左右排列模擬真實對話畫面。
import 'dart:math'; // 提供 Random，讓 demo 每則訊息長得不一樣。

import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/res/custom_colors.dart'; // 聊天泡泡使用的主題色。

/// 單筆聊天訊息列。
/// 這裡沒有真實資料，所以用 Random 產生不同高度、不同數量的泡泡來模擬聊天內容。
class ChatItem extends StatelessWidget {
  final Color profileIconColor; // 對方頭像顏色，由上一層傳進來。

  ChatItem(this.profileIconColor);

  static const int minHeight = 50; // 單個訊息泡泡最小高度。
  static const int maxHeight = 100; // 單個訊息泡泡最大高度。
  static const double bubbleRoundedRadius = 20; // 泡泡圓角半徑。

  static const int minCount = 1; // 一列最少顯示幾個泡泡。
  static const int maxCount = 4; // 一列最多顯示幾個泡泡。

  final _randomHeight = new Random(); // 負責隨機決定泡泡高度。
  final _randomCount = new Random(); // 負責隨機決定泡泡數量。
  final _randomSide = new Random(); // 負責隨機決定訊息在左邊或右邊。

  int getBubbleHeight() =>
      minHeight + _randomHeight.nextInt(maxHeight - minHeight);

  int getListItemCount() =>
      minCount + _randomCount.nextInt(maxCount - minCount);

  int decideSide() => 0 + _randomSide.nextInt(2); // 0 代表左側訊息，1 代表右側訊息。

  @override
  Widget build(BuildContext context) {
    int side = decideSide(); // 每次 build 都先決定這則訊息靠哪一側。

    return Container(
      color: Colors.white,
      child: side == 0
          ? Padding(
              // 左側訊息通常代表對方發出的內容，所以頭像在左邊。
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 8.0,
                right: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: profileIconColor,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true, // 讓內層列表依內容高度展開。
                      physics: NeverScrollableScrollPhysics(), // 避免和外層聊天列表搶捲動。
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.0),
                      itemCount: getListItemCount(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: getBubbleHeight().toDouble(),
                          decoration: BoxDecoration(
                            color:
                                CustomColors.blue_gray.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.only(
                              // 左側泡泡通常左上角較平，右上角與底部較圓。
                              bottomLeft: Radius.circular(bubbleRoundedRadius),
                              bottomRight: Radius.circular(bubbleRoundedRadius),
                              topRight: Radius.circular(bubbleRoundedRadius),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              // 右側訊息通常代表自己發出的內容，所以頭像在右邊。
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 16.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.0),
                      itemCount: getListItemCount(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: getBubbleHeight().toDouble(),
                          decoration: BoxDecoration(
                            color:
                                CustomColors.neon_green.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(bubbleRoundedRadius),
                              bottomRight: Radius.circular(bubbleRoundedRadius),
                              topLeft: Radius.circular(bubbleRoundedRadius),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8.0),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: CustomColors.neon_green,
                  ),
                ],
              ),
            ),
    );
  }
}
