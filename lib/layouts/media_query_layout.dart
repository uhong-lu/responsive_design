/// MediaQuery demo file.
/// 示範如何透過 MediaQuery 讀取整個螢幕尺寸與裝置方向。
import 'package:flutter/material.dart'; // Flutter 基本 Material 元件。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 這個 demo 使用的顏色常數。

/// MediaQuery 範例頁。
/// 適合拿來理解「從 context 取得目前裝置資訊」這個概念。
class MediaQueryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size：取得整個螢幕可用大小。
    Size screenSize = MediaQuery.of(context).size;
    // MediaQuery.of(context).orientation：取得目前螢幕方向。
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: MyColors.darkGreen, // 用深色背景讓文字更醒目。
        child: Center(
          child: Text(
            // 直接把 MediaQuery 讀到的資訊顯示在畫面上。
            'View\n\n' +
                '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n' +
                '[MediaQuery orientation]: $orientation',
            style: TextStyle(color: Colors.white, fontSize: 18), // 設定顯示文字樣式。
          ),
        ),
      ),
    );
  }
}
