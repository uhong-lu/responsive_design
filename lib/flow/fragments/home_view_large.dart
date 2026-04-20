/// Large home view file.
/// 大螢幕首頁，使用左側常駐選單加右側內容區的雙欄版面。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/fragments/destination_view.dart'; // 依目的地切換內容。
import 'package:responsive_design/flow/model/destination.dart'; // 導覽資料。
import 'package:responsive_design/flow/widgets/menu_widget.dart'; // 左側選單元件。

/// 大螢幕首頁。
/// 由於側邊選單選中的項目會改變，因此仍需要 StatefulWidget。
class HomeViewLarge extends StatefulWidget {
  final int currentIndex; // 父層傳下來的預設選中索引。
  final Function(int selectedIndex) onTapped; // 使用者換頁後回傳給父層的 callback。

  HomeViewLarge(this.currentIndex, this.onTapped);

  @override
  _HomeViewLargeState createState() => _HomeViewLargeState();
}

class _HomeViewLargeState extends State<HomeViewLarge> {
  int _index = 0; // 右側內容區目前要顯示哪個頁面。

  @override
  void initState() {
    super.initState();
    // 一開始先同步父層傳下來的索引值。
    _index = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    // 大螢幕版型只回傳內容區本身，外層 Scaffold 由父層 FlowHomePage 提供。
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2, // 左側選單拿 2 份空間。
            child: MenuWidget(
              selectedIndex: _index,
              onTapped: (selectedIndex) {
                setState(() {
                  _index = selectedIndex; // 更新本地狀態。
                  widget.onTapped(_index); // 同步通知父層。
                });
              },
            ),
          ),
          Expanded(
            flex: 3, // 右側主內容拿 3 份空間，因此視覺上比左側更寬。
            child: IndexedStack(
              index: _index,
              children: allDestinations.map<Widget>((Destination destination) {
                return DestinationView(destination);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
