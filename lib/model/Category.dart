class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/images/responsive.png",
    title: "Electronics",
  ),
  Category(
    icon: "assets/images/rings.png",
    title: "Jewelery",
  ),
  Category(
    icon: "assets/images/man.png",
    title: "Men's Clothing",
  ),
  Category(
    icon: "assets/images/woman.png",
    title: "Women's Clothing",
  ),
];
