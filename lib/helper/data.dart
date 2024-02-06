import 'package:news/module/catagory_module.dart';

List<category_module> getCategories() {
  List<category_module> catagory =[];
  category_module categoryodule = new category_module();
  //1
  categoryodule.categoryName = "Business";
  categoryodule.imageUrl =
      "https://c.pxhere.com/images/66/b8/fb80e3fc401511ff8d9c38eb0bdb-1573331.jpg!d";
  catagory.add(categoryodule);
  categoryodule = new category_module();
  //2 entertainment
  categoryodule.categoryName = "Entertainment";
  categoryodule.imageUrl =
      "http://images6.fanpop.com/image/photos/35500000/20th-Century-Fox-Home-Entertainment-2013-logo-twentieth-century-fox-film-corporation-35558979-1280-550.png";
  catagory.add(categoryodule);
  categoryodule = new category_module();
  //3
  categoryodule.categoryName = "Sports";
  categoryodule.imageUrl =
      "https://tse3.mm.bing.net/th?id=OIP.J2RorHvH5rXyRZpJkQSkeAHaEK&pid=Api&P=0&h=180";
  catagory.add(categoryodule);
  categoryodule = new category_module();
  //4 Science
  categoryodule.categoryName = "Science";
  categoryodule.imageUrl =
      "https://www.susla.edu/assets/susla/images/ChemistryImage.jpg";
  catagory.add(categoryodule);
  categoryodule = new category_module();
  //5 Health
  categoryodule.categoryName = "Health";
  categoryodule.imageUrl =
      "https://eclinknews.com/wp-content/uploads/2020/05/Health-Care-Services-at-Home-1100x580.jpg";
  catagory.add(categoryodule);
  categoryodule = new category_module();
  //6 Technology
  categoryodule.categoryName = "Technology";
  categoryodule.imageUrl =
      "https://wallpaperaccess.com/full/210938.jpg";
  catagory.add(categoryodule);
  categoryodule = new category_module();
  //7 general
  categoryodule.categoryName = "General";
  categoryodule.imageUrl =
      "https://chessdailynews.com/wp-content/uploads/2015/03/general_news1.jpg";
  catagory.add(categoryodule);

  return catagory;
}
