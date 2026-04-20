/// LayoutBuilder demo file.
/// 這個頁面拿來比較 MediaQuery 與 LayoutBuilder 讀到的尺寸差異。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/layouts/res/my_colors.dart'; // 共用顏色常數。

/// LayoutBuilder 示範頁。
/// MediaQuery 看的是整個螢幕，LayoutBuilder 看的是「這個 widget 被分到多少空間」。
class LayoutBuilderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 先拿到整個裝置的寬度，等等和區塊自身寬度做比較。
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        // Row：把畫面切成左右兩塊，方便觀察不同 flex 比例下的 constraints。
        children: [
          Expanded(
            flex: 2, // 左側區塊拿到 2 份空間。
            child: LayoutBuilder(
              // LayoutBuilder 會把「分配給自己」的 constraints 傳進 builder。
              builder: (context, constraints) => Container(
                color: MyColors.darkGreen,
                child: Center(
                  child: Text(
                    'View 1\n\n' +
                        '[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n' +
                        '[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3, // 右側區塊拿到 3 份空間，所以通常會比左邊更寬。
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'View 2\n\n' +
                        '[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n' +
                        '[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
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
