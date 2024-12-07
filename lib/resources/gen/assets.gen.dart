/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/FiraSans-Bold.ttf
  String get firaSansBold => 'assets/fonts/FiraSans-Bold.ttf';

  /// File path: assets/fonts/FiraSans-ExtraBold.ttf
  String get firaSansExtraBold => 'assets/fonts/FiraSans-ExtraBold.ttf';

  /// File path: assets/fonts/FiraSans-Medium.ttf
  String get firaSansMedium => 'assets/fonts/FiraSans-Medium.ttf';

  /// File path: assets/fonts/FiraSans-Regular.ttf
  String get firaSansRegular => 'assets/fonts/FiraSans-Regular.ttf';

  /// File path: assets/fonts/FiraSans-SemiBold.ttf
  String get firaSansSemiBold => 'assets/fonts/FiraSans-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        firaSansBold,
        firaSansExtraBold,
        firaSansMedium,
        firaSansRegular,
        firaSansSemiBold
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/angry.svg
  SvgGenImage get angry => const SvgGenImage('assets/icons/angry.svg');

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/comment.svg
  SvgGenImage get comment => const SvgGenImage('assets/icons/comment.svg');

  /// File path: assets/icons/haha.svg
  SvgGenImage get haha => const SvgGenImage('assets/icons/haha.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/home_on.svg
  SvgGenImage get homeOn => const SvgGenImage('assets/icons/home_on.svg');

  /// File path: assets/icons/like.svg
  SvgGenImage get like => const SvgGenImage('assets/icons/like.svg');

  /// File path: assets/icons/like_outline.svg
  SvgGenImage get likeOutline =>
      const SvgGenImage('assets/icons/like_outline.svg');

  /// File path: assets/icons/love.svg
  SvgGenImage get love => const SvgGenImage('assets/icons/love.svg');

  /// File path: assets/icons/love_on.svg
  SvgGenImage get loveOn => const SvgGenImage('assets/icons/love_on.svg');

  /// File path: assets/icons/lover-favorite.svg
  SvgGenImage get loverFavorite =>
      const SvgGenImage('assets/icons/lover-favorite.svg');

  /// File path: assets/icons/market.svg
  SvgGenImage get market => const SvgGenImage('assets/icons/market.svg');

  /// File path: assets/icons/market_on.svg
  SvgGenImage get marketOn => const SvgGenImage('assets/icons/market_on.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/messenger.svg
  SvgGenImage get messenger => const SvgGenImage('assets/icons/messenger.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/notification_on.svg
  SvgGenImage get notificationOn =>
      const SvgGenImage('assets/icons/notification_on.svg');

  /// File path: assets/icons/photo.svg
  SvgGenImage get photo => const SvgGenImage('assets/icons/photo.svg');

  /// File path: assets/icons/sad.svg
  SvgGenImage get sad => const SvgGenImage('assets/icons/sad.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/share.svg');

  /// File path: assets/icons/smiling-face.svg
  SvgGenImage get smilingFace =>
      const SvgGenImage('assets/icons/smiling-face.svg');

  /// File path: assets/icons/video.svg
  SvgGenImage get video => const SvgGenImage('assets/icons/video.svg');

  /// File path: assets/icons/video_on.svg
  SvgGenImage get videoOn => const SvgGenImage('assets/icons/video_on.svg');

  /// File path: assets/icons/wow.svg
  SvgGenImage get wow => const SvgGenImage('assets/icons/wow.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add,
        angry,
        back,
        comment,
        haha,
        home,
        homeOn,
        like,
        likeOutline,
        love,
        loveOn,
        loverFavorite,
        market,
        marketOn,
        menu,
        messenger,
        notification,
        notificationOn,
        photo,
        sad,
        search,
        share,
        smilingFace,
        video,
        videoOn,
        wow
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar_default.png
  AssetGenImage get avatarDefault =>
      const AssetGenImage('assets/images/avatar_default.png');

  /// File path: assets/images/facebook_logo.png
  AssetGenImage get facebookLogo =>
      const AssetGenImage('assets/images/facebook_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [avatarDefault, facebookLogo];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
