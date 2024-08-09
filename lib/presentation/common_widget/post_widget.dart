import 'package:emotee/data/models/post.dart';
import 'package:emotee/generated/assets.dart';
import 'package:emotee/presentation/common_widget/box_color.dart';
import 'package:emotee/presentation/common_widget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({
    super.key,
    this.post = const Post(),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BoxColor(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImageWrapper.avatar(
            url: post.avatarUrl ?? '',
            width: 48.r,
            height: 48.r,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.username ?? 'hehe',
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        'now',
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  post.content ?? '--',
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 6.h),
                Row(children: [
                  _buildPostAction(
                    icon: Assets.svg.icHeart,
                    number: post.heartNumber ?? 0,
                  ),
                  SizedBox(width: 32.w),
                  _buildPostAction(
                    icon: Assets.svg.icComment,
                    number: post.commentNumber ?? 0,
                  ),
                  SizedBox(width: 32.w),
                  _buildPostAction(
                    icon: Assets.svg.icQuote,
                    number: post.quoteNumber ?? 0,
                  ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPostAction({required String icon, int? number}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 18.r,
          height: 18.r,
        ),
        SizedBox(width: 6.w),
        Text(number.toString())
      ],
    );
  }
}
