/// OrientationBuilder demo file.
/// 這個範例示範如何比較 MediaQuery 與 OrientationBuilder 得到的方向資訊。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 共用顏色常數。

/// OrientationBuilder 示範頁。
/// 畫面切成上下兩區，兩區都會顯示目前看到的 orientation 結果。
class OrientationBuilderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery 先讀一次整個裝置方向，等等和 OrientationBuilder 的結果對照。
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2, // 上半部拿 2 份空間。
            child: Container(
              color: MyColors.darkGreen,
              child: OrientationBuilder(
                // OrientationBuilder 的 orientation 代表此區塊判定的方向。
                builder: (context, orientation) => Center(
                  child: Text(
                    'View 1\n\n' +
                        '[MediaQuery orientation]:\n$deviceOrientation\n\n' +
                        '[OrientationBuilder]:\n$orientation',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3, // 下半部拿 3 份空間。
            child: OrientationBuilder(
              builder: (context, orientation) => Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'View 2\n\n' +
                        '[MediaQuery orientation]:\n$deviceOrientation\n\n' +
                        '[OrientationBuilder]:\n$orientation',
                    style: TextStyle(color: MyColors.darkGreen, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
