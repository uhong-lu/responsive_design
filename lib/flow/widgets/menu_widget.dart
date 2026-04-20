/// Sidebar menu widget file.
/// 這個檔案定義大螢幕版的左側選單，包含品牌區、主要導覽項目與其他示意列。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/res/custom_colors.dart'; // Flow 主題色。
import 'package:responsive_design/flow/widgets/text_view.dart'; // 假文字骨架元件。

/// 左側選單 Widget。
/// 需要記住目前哪個項目被選中，因此使用 StatefulWidget。
class MenuWidget extends StatefulWidget {
  final int selectedIndex; // 父層傳入的預設選中項目。
  final Function(int selectedIndex) onTapped; // 點擊選單後回傳給父層的 callback。

  MenuWidget({required this.onTapped, this.selectedIndex = 0});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  int _selectedItem = 0; // 目前高亮顯示的選單項目。

  @override
  void initState() {
    super.initState();
    // 初始化時先同步父層狀態。
    _selectedItem = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 如果視窗高度較小，讓整個側欄可以捲動。
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // 頂部品牌區。
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
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.white60,
          ),
          // InkWell：讓整列項目具有可點擊的觸控回饋。
          InkWell(
            onTap: () {
              setState(() {
                _selectedItem = 0; // 更新當前選中項目。
                widget.onTapped(_selectedItem); // 同步通知父層切頁。
              });
            },
            child: Item(0, 'Chats', _selectedItem, Icons.chat),
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.white60,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedItem = 1;
                widget.onTapped(_selectedItem);
              });
            },
            child: Item(1, 'Bookmark', _selectedItem, Icons.bookmark),
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.white60,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedItem = 2;
                widget.onTapped(_selectedItem);
              });
            },
            child: Item(2, 'Contacts', _selectedItem, Icons.people),
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.white60,
          ),
          // 以下三列是次要功能的示意項目，目前沒有互動行為。
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: 24,
                  color: CustomColors.neon_green,
                ),
                SizedBox(width: 16.0),
                Expanded(child: TextViewMedium()),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: Colors.white24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Icon(Icons.settings, size: 24, color: CustomColors.neon_green),
                SizedBox(width: 16.0),
                Expanded(child: TextViewMedium()),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: Colors.white24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Icon(Icons.info, size: 24, color: CustomColors.neon_green),
                SizedBox(width: 16.0),
                Expanded(child: TextViewMedium()),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: Colors.white24,
          ),
        ],
      ),
    );
  }
}

/// 單一選單列元件。
/// 雖然這個元件內部沒有額外 state，但原專案用 StatefulWidget 包住它；
/// 對新手來說可以把它視為「根據外部 selected 值改變外觀」的列項目元件。
class Item extends StatefulWidget {
  final int id; // 這一列自己的編號。
  final String title; // 顯示在列上的標題文字。
  final int selected; // 目前全域被選中的項目編號。
  final IconData icon; // 這一列要顯示的圖示。

  Item(this.id, this.title, this.selected, this.icon);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // 如果目前這列就是選中項目，就畫出外框作為高亮提示。
        border: widget.selected == widget.id
            ? Border.all(width: 2.0, color: CustomColors.blue_gray)
            : null,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
        child: Row(
          children: [
            Icon(widget.icon, size: 24, color: CustomColors.neon_green),
            SizedBox(width: 16.0),
            Text(
              widget.title,
              style: TextStyle(color: CustomColors.neon_green),
            ),
          ],
        ),
      ),
    );
  }
}
