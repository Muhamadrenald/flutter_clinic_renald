/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Log Out.svg
  String get logOut => 'assets/icons/Log Out.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/chart-pie.svg
  String get chartPie => 'assets/icons/chart-pie.svg';

  /// File path: assets/icons/delete.svg
  String get delete => 'assets/icons/delete.svg';

  /// File path: assets/icons/filter.svg
  String get filter => 'assets/icons/filter.svg';

  /// File path: assets/icons/folder-open.svg
  String get folderOpen => 'assets/icons/folder-open.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/setting.svg
  String get setting => 'assets/icons/setting.svg';

  /// File path: assets/icons/shopping-bag-product.svg
  String get shoppingBagProduct => 'assets/icons/shopping-bag-product.svg';

  /// File path: assets/icons/sort.svg
  String get sort => 'assets/icons/sort.svg';

  /// File path: assets/icons/success.svg
  String get success => 'assets/icons/success.svg';

  /// List of all assets
  List<String> get values => [
        logOut,
        calendar,
        chartPie,
        delete,
        filter,
        folderOpen,
        logo,
        setting,
        shoppingBagProduct,
        sort,
        success
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Splash Screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/Splash Screen.png');

  /// File path: assets/images/dokterku.png
  AssetGenImage get dokterku =>
      const AssetGenImage('assets/images/dokterku.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  $AssetsImagesMenuGen get menu => const $AssetsImagesMenuGen();
  $AssetsImagesProductsGen get products => const $AssetsImagesProductsGen();

  /// List of all assets
  List<AssetGenImage> get values => [splashScreen, dokterku, google];
}

class $AssetsImagesMenuGen {
  const $AssetsImagesMenuGen();

  /// File path: assets/images/menu/data.png
  AssetGenImage get data => const AssetGenImage('assets/images/menu/data.png');

  /// File path: assets/images/menu/jadwal.png
  AssetGenImage get jadwal =>
      const AssetGenImage('assets/images/menu/jadwal.png');

  /// File path: assets/images/menu/layanan.png
  AssetGenImage get layanan =>
      const AssetGenImage('assets/images/menu/layanan.png');

  /// List of all assets
  List<AssetGenImage> get values => [data, jadwal, layanan];
}

class $AssetsImagesProductsGen {
  const $AssetsImagesProductsGen();

  /// File path: assets/images/products/paracetamol.jpg
  AssetGenImage get paracetamol =>
      const AssetGenImage('assets/images/products/paracetamol.jpg');

  /// File path: assets/images/products/sarung tangan medis.jpg
  AssetGenImage get sarungTanganMedis =>
      const AssetGenImage('assets/images/products/sarung tangan medis.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [paracetamol, sarungTanganMedis];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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
