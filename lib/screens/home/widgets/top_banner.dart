import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:fansvideo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TopBanner extends StatelessWidget {
  final String bannerUrl;
  final String bannerHash;

  const TopBanner({Key key, this.bannerUrl, this.bannerHash})
      : assert(bannerUrl != '', bannerHash != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: _TopBannerDesktop(
        url: bannerUrl,
        hash: bannerHash,
      ),
      mobile: _TopBannerDesktop(
        url: bannerUrl,
        hash: bannerHash,
      ),
      tablet: _TopBannerDesktop(
        url: bannerUrl,
        hash: bannerHash,
      ),
    );
  }
}

class _TopBannerDesktop extends StatelessWidget {
  final String url;
  final String hash;

  const _TopBannerDesktop({Key key, this.url, this.hash}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        SynchronizedDisplay(
          hash: hash,
          uri: url,
        ),
        Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.black45, Colors.transparent],
              stops: [0, .1, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
