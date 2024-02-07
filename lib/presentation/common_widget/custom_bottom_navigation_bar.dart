import 'package:emotee/common/utils/extensions.dart';
import 'package:emotee/presentation/common_widget/box_color.dart';
import 'package:emotee/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItemData {
  final String iconPath;

  final String selectedIconPath;
  final bool? isOver;
  final int? badgeCount;
  final String label;

  BottomBarItemData({
    required this.iconPath,
    required this.selectedIconPath,
    required this.label,
    this.isOver,
    this.badgeCount,
  });
}

class CustomBottomNavigationBar extends StatefulWidget {
  final Future<bool> Function(int)? onItemSelection;
  final int? selectedIdx;
  final List<BottomBarItemData>? items;

  const CustomBottomNavigationBar({
    Key? key,
    this.onItemSelection,
    this.selectedIdx = 0,
    this.items,
  }) : super(key: key);
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late ValueNotifier<int?> idxNotifier;

  @override
  void initState() {
    idxNotifier = ValueNotifier(widget.selectedIdx);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    idxNotifier.value = widget.selectedIdx;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    idxNotifier.value = widget.selectedIdx;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    idxNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: idxNotifier,
      builder: (ctx, value, w) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: themeColor.color1B1C26,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: themeColor.colorF2F2F6,
                  ),
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                    top: 11.h,
                    left: 32.w,
                    right: 32.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items!.mapIndex<Widget>((item, idx) {
                      return SizedBox(
                        width: 80.w,
                        child: BottomItem(
                          item: item,
                          onPressed: () async {
                            if (idx != value &&
                                await widget.onItemSelection?.call(idx) ==
                                    true) {
                              idxNotifier.value = idx;
                            }
                          },
                          selected: idx == value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              left: value == 0
                  ? 31.5.w
                  : value == 1
                      ? 146.5.w
                      : 261.5.w,
              curve: Curves.easeInOutCubicEmphasized,
              duration: const Duration(milliseconds: 200),
              child: BoxColor(
                margin: EdgeInsets.only(top: 1.h),
                height: 3.w,
                width: 80.w,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24.r)),
                color: themeColor.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}

class BottomItem extends StatelessWidget {
  final BottomBarItemData item;
  final void Function()? onPressed;
  final bool selected;
  final double iconSize;

  const BottomItem({
    Key? key,
    required this.item,
    this.onPressed,
    this.selected = false,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            selected
                ? SvgPicture.asset(
                    item.selectedIconPath,
                    color: themeColor.primaryColor,
                    width: 24.r,
                    height: 24.r,
                  )
                : SvgPicture.asset(
                    item.iconPath,
                    height: 24.r,
                    width: 24.r,
                  ),
            SizedBox(height: 2.h),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 10.sp,
                color:
                    selected ? themeColor.primaryColor : themeColor.colorB6BEC9,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
