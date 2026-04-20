/// FractionallySizedBox demo file.
/// 這個頁面示範 child 可以佔父層寬度的幾成。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 共用顏色常數。

/// FractionallySizedBox 示範頁。
/// 畫面會依序顯示 40%、60%、80%、100% 寬度的區塊。
class FractionallySizedBoxLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 每一列只放一個示範元件，方便觀察不同寬度比例。
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 0.4),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 0.6),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 0.8),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 1.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 單一寬度比例示範元件。
/// widthFactor = 0.4 代表 child 會佔父層 40% 的寬度。
class FractionallySizedWidget extends StatelessWidget {
  final double widthFactor; // 佔父層寬度的比例。

  FractionallySizedWidget({required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    // 先用 Expanded 讓這一列擁有完整寬度，再由 FractionallySizedBox 去切比例。
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft, // 讓縮小後的區塊靠左對齊。
        widthFactor: widthFactor, // 真正控制寬度比例的關鍵參數。
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.darkGreen,
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${widthFactor * 100}%', // 直接把比例顯示成百分比，方便學習。
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
