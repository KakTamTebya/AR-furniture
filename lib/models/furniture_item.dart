class FurnitureItem {
  final String name;
  final String menuImageUrl;
  final String description;
  final List<String>? _imageUrls;

  FurnitureItem({
    required this.name,
    required this.menuImageUrl,
    this.description = "Крутая вещь в твое уютное жилище.",
    List<String>? imageUrls}) : _imageUrls = imageUrls;

  List<String> get imageUrls => [menuImageUrl, ...?_imageUrls];
}
