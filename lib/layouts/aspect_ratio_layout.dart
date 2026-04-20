/// AspectRatio demo file.
/// 這個頁面示範如何讓元件在不同螢幕尺寸下仍維持固定比例。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:fraction/fraction.dart'; // 把像 16 / 9 這種字串轉成真正比例值。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 共用顏色常數。

/// AspectRatio 示範頁。
/// 常見用途包含影片播放器、圖片容器、卡片縮圖等。
class AspectRatioLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 16:9 是很常見的橫向媒體比例。
            AspectRatioWidget(ratio: '16 / 9'),
            // 3:2 也是常見的圖片或卡片比例。
            AspectRatioWidget(ratio: '3 / 2'),
          ],
        ),
      ),
    );
  }
}

/// 單一比例示範元件。
/// ratio 先用字串寫法，方便使用者直接閱讀目前示範的比例。
class AspectRatioWidget extends StatelessWidget {
  final String ratio; // 例如 16 / 9、3 / 2 這種比例文字。

  AspectRatioWidget({required this.ratio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // AspectRatio 需要 double，所以先用 Fraction 套件把字串轉成數值。
      aspectRatio: Fraction.fromString(ratio).toDouble(),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'AspectRatio - $ratio', // 顯示目前正在示範的比例。
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
