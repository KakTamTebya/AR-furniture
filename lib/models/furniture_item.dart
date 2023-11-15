class FurnitureItem {
  final String name;
  final String menuImageUrl;
  final String description;
  final String modelUrl;
  final List<String>? _imageUrls;

  FurnitureItem({
    required this.name,
    required this.menuImageUrl,
    required this.modelUrl,
    this.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    List<String>? imageUrls}) : _imageUrls = imageUrls;

  List<String> get imageUrls => [menuImageUrl, ...?_imageUrls];
}
