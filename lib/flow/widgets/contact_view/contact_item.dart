/// Contact item file.
/// 建立單筆聯絡人列，包含頭像、名稱占位文字，以及邀請按鈕。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:random_color/random_color.dart'; // 產生隨機顏色，模擬不同使用者頭像。
import 'package:responsive_design/flow/res/custom_colors.dart'; // Flow 主題色。
import 'package:responsive_design/flow/widgets/text_view.dart'; // 假文字骨架元件。

/// 單筆聯絡人項目。
/// 因為沒有後端資料，所以頭像顏色和名字都用 mock 畫面呈現。
class ContactItem extends StatelessWidget {
  final RandomColor _randomColor = RandomColor(); // 每次建立項目時隨機給一個頭像顏色。

  @override
  Widget build(BuildContext context) {
    Color profileColor = _randomColor.randomColor(); // 產生本列專屬頭像色。

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: profileColor,
            ),
            Expanded(
              // Expanded 讓中間的名稱區可以吃到剩餘空間。
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextViewMedium(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.neon_green,
              ),
              onPressed: () {}, // 真實專案中可改成邀請聯絡人加入的行為。
              child: Text(
                'invite',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
