/// Bookmark view file.
/// 收藏頁的包裝層，主要把 BookmarkList 放進畫面中。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/bookmark_view/bookmark_list.dart'; // 收藏清單元件。

/// 收藏頁。
/// 和 ContactView、PeopleView 一樣，這裡刻意保持簡單，讓責任分工清楚。
class BookmarkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BookmarkList(),
    );
  }
}
