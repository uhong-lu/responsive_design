/// Expanded and Flexible demo file.
/// 這個頁面用 4 列範例對照 Expanded 與 Flexible 的版面行為。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 版面示範共用顏色。

/// Expanded / Flexible 教學頁。
/// 透過不同排列組合，觀察兩者在 Row 中如何分配空間。
class ExpandedFlexibleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 第一列：左邊 Expanded，右邊 Flexible。
            Row(
              children: [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            // 第二列：兩個都用 Expanded，表示平均撐滿剩餘空間。
            Row(
              children: [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            // 第三列：兩個都用 Flexible，空間使用會比較彈性。
            Row(
              children: [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            // 第四列：先 Flexible 再 Expanded，方便比較前後差異。
            Row(
              children: [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 用來示範 Expanded 的小元件。
/// Expanded 會要求自己把可用的剩餘空間盡量填滿。
class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          border: Border.all(color: Colors.white), // 白框讓每個區塊邊界更清楚。
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

/// 用來示範 Flexible 的小元件。
/// Flexible 同樣參與彈性排版，但不一定會像 Expanded 那樣強制撐滿。
class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.greenAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(color: MyColors.darkGreen, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
