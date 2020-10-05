import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class XGRecommendBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: _buildBanner(),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 220,
      child: Swiper(
        autoplay: true,
        loop: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658",
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: FractionPaginationBuilder(
            activeFontSize: 14,
            fontSize: 14,
            activeColor: Colors.orange,
            color: Colors.grey,
          ),
        ),
        onTap: (index) {
          print(" 点击 " + index.toString());
        },
      ),
    );
  }
}
