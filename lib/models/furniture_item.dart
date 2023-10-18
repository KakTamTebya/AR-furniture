class FurnitureItem {
  final String name;
  final String imageUrl;
  final String description;

  FurnitureItem({
    required this.name,
    required this.imageUrl,
    this.description = "Крутая вещь в твое уютное жилище."});
}
