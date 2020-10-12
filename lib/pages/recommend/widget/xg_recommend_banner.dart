import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiguamanhua/common/model/xg_comics_model.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/pages/detail/page/xg_detail_page.dart';
import 'package:xiguamanhua/pages/recommend/request/xg_recommend_banner_requset.dart';

class XGRecommendBanner extends StatefulWidget {
  @override
  _XGRecommendBannerState createState() => _XGRecommendBannerState();
}

class _XGRecommendBannerState extends State<XGRecommendBanner> {
  static const double _bannerHeight = 330.0;
  List<XGComicsModel> _bannerList = [];

  /// 点击事件
  void _onGoToDetailPage(XGComicsModel model) {
    Navigator.of(context).pushNamed(XGDetailPage.routeName, arguments: model);
  }

  @override
  void initState() {
    super.initState();
    XGRecommendBannerRequest.requestBannerList().then((rsp) {
      setState(() {
        _bannerList = rsp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: _buildBanner(),
    );
  }

  Widget _buildBanner() {
    if (_bannerList == null || _bannerList.length <= 0) {
      return Container(
        height: _bannerHeight,
        child: Image.asset('assets/images/other/xg_placeholder_img.png'),
      );
    }
    return Stack(
      children: [
        _buildBlur(),
        _buildSwiper(),
      ],
    );
  }

  Widget _buildBlur() {
    return Container(
      height: _bannerHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [XGAppTheme.normalColor, Colors.orangeAccent], // 要弄成毛玻璃效果
        ),
      ),
    );
  }

  Widget _buildSwiper() {
    return Container(
      height: _bannerHeight,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
      child: Swiper(
        autoplay: true,
        loop: true,
        scale: 0.8,
        viewportFraction: 0.58,
        itemCount: _bannerList.length,
        itemBuilder: (BuildContext context, int index) => _buildItemBuilder(context, index),
        pagination: _buildSwiperPagination(),
        onTap: (index) => _onGoToDetailPage(_bannerList[index]),
      ),
    );
  }

  Widget _buildItemBuilder(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        placeholder: (ctx, url) {
          return Image.asset('assets/images/other/xg_placeholder_img.png');
        },
        imageUrl: _bannerList[index].comicsCover,
        fit: BoxFit.fill,
      ),
    );
  }

  SwiperPagination _buildSwiperPagination() {
    return SwiperPagination(
      builder: FractionPaginationBuilder(
        activeFontSize: 16,
        fontSize: 16,
        activeColor: Colors.orange,
        color: Colors.black87,
      ),
    );
  }
}
