/// Small home view file.
/// 手機版首頁，包含 AppBar、Drawer、BottomNavigationBar 與分頁內容區。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/fragments/destination_view.dart'; // 依照 destination 顯示對應內容。
import 'package:responsive_design/flow/model/destination.dart'; // 導覽資料模型與清單。
import 'package:responsive_design/flow/res/custom_colors.dart'; // Flow 模組主題色。
import 'package:responsive_design/flow/widgets/text_view.dart'; // 假文字骨架元件。

/// 小螢幕首頁。
/// 這裡要管理目前選中哪一個分頁，所以使用 StatefulWidget。
class HomeViewSmall extends StatefulWidget {
  final int currentIndex; // 父層目前傳進來的選中分頁索引。
  final Function(int selectedIndex) onTapped; // 點擊分頁後，要回傳給父層的 callback。

  HomeViewSmall(this.currentIndex, this.onTapped);

  @override
  _HomeViewSmallState createState() => _HomeViewSmallState();
}

class _HomeViewSmallState extends State<HomeViewSmall> {
  int _currentIndex = 0; // 這個頁面自己正在顯示的分頁索引。

  @override
  void initState() {
    super.initState();
    // 一進頁面先和父層同步，避免畫面顯示錯誤分頁。
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue_gray,
        title: Text(
          'Flow',
          style: TextStyle(
            fontFamily: 'SansitaSwashed', // 使用自訂字體營造品牌感。
            fontSize: 28,
            letterSpacing: 1,
          ),
        ),
        actions: [
          // 右上角搜尋按鈕，目前示範 UI，尚未串接實際功能。
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              // 用 CircleAvatar 模擬使用者頭像入口。
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: CustomColors.neon_green,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Drawer：從左側滑出的側邊選單。
        child: Container(
          color: CustomColors.blue_gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Drawer 頂部品牌區。
              Container(
                width: double.maxFinite,
                height: 150,
                color: CustomColors.blue_gray_dark,
                child: Center(
                  child: Text(
                    'Flow',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SansitaSwashed',
                      fontSize: 32,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              // 粗一點的分隔線，將品牌區和功能區分開。
              Container(
                height: 5,
                width: double.maxFinite,
                color: Colors.white60,
              ),
              // 以下三列是示意型選單項目，用圖示 + 假文字表示版型。
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 24,
                      color: CustomColors.neon_green,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: TextViewMedium(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                width: double.maxFinite,
                color: Colors.white24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 24,
                      color: CustomColors.neon_green,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: TextViewMedium(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                width: double.maxFinite,
                color: Colors.white24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 24,
                      color: CustomColors.neon_green,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: TextViewMedium(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                width: double.maxFinite,
                color: Colors.white24,
              ),
              // Expanded + Align：把版權文字推到 Drawer 底部。
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Copyright © 2020 | Flow',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 小螢幕時用 BottomNavigationBar 當主要導覽工具。
        backgroundColor: CustomColors.blue_gray,
        selectedIconTheme: IconThemeData(size: 30), // 被選中的 icon 大一點。
        unselectedIconTheme: IconThemeData(size: 20), // 未選中 icon 小一點。
        selectedItemColor: CustomColors.neon_green,
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: false, // 未選中的項目不顯示文字，畫面更簡潔。
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // 先更新本地畫面。
            widget.onTapped(_currentIndex); // 再通知父層同步狀態。
          });
        },
        items: allDestinations.map((Destination destination) {
          // 根據資料模型自動產生每個底部導覽項目。
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            label: destination.title,
          );
        }).toList(),
      ),
      body: IndexedStack(
        // IndexedStack 只顯示目前 index 的 child，但會保留其他 child 的狀態。
        index: _currentIndex,
        children: allDestinations.map<Widget>((Destination destination) {
          return DestinationView(destination);
        }).toList(),
      ),
      // PeopleView(), // 這是早期直接測試單一頁面時留下的示意寫法。
    );
  }
}
