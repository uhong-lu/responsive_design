/// Bookmark list file.
/// 收藏清單負責建立多筆 BookmarkItem，形成可捲動的列表。
import 'package:flutter/material.dart'; // Flutter Material 元件。
import 'package:responsive_design/flow/widgets/bookmark_view/bookmark_item.dart'; // 單筆收藏項目。

/// 收藏清單。
/// 這裡固定建立 10 筆示範資料，方便觀察版面。
class BookmarkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return BookmarkItem();
      },
    );
  }
}
