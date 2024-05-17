
part of 'app.assets.dart';

class _LightAssets extends _CommonAssets implements AppAssetsContract {
  static const String _assetsPath = 'assets/graphics/light';
  final AppAssetsIconsContract icons = _LightIcons();

  @override
  final String logo = '$_assetsPath/logo.png';

  @override
  final String placeholder = '$_assetsPath/placeholder.png';
}