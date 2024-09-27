import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../../ui_lib/widgets/category_card.dart';
import '../../ui_lib/widgets/product_card.dart';
import '../provider/app_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     Provider.of<AppProvider>(context, listen: false).generateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, notifier, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black),
                  onPressed: () {},
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: CarouselSlider(
                options: CarouselOptions(height: 180.0, autoPlay: true),
                items: notifier.productImages.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.network(e.imageUrl!, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Most Popular Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Most Popular",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View all", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 4,),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16), // Added vertical padding
                scrollDirection: Axis.horizontal,
                itemCount: notifier.mostPopularItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final contentItem = notifier.mostPopularItems.elementAt(index);
                  return ProductCard(
                    imageUrl: contentItem.productImage  ?? 'https://example.com/placeholder.jpg',
                    title:  contentItem.sku ?? 'No Name',
                    sale: contentItem.discount ?? 'Sale 65% Off',
                    price: contentItem.offerPrice ?? 'N/A',
                    originalPrice: contentItem.actualPrice ?? 'N/A',
                    rating: 4,
                  );
                },
              ),
            ),

            //single banner
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: notifier.generateData,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.network(notifier.singleProduct ??'',fit: BoxFit.cover,)),
                  
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View all", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(notifier.topCategoryItems.length, (index) {
                return Container(

                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CategoryCard(
                    categoryName: notifier.topCategoryItems[index].title.toString(),
                    iconUrl: notifier.topCategoryItems[index].imageUrl.toString(),
                  ),
                );
              }),
            ),

            // Featured Products Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View all", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            Container(
              height: 250,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16), // Added vertical padding
                scrollDirection: Axis.horizontal,
                itemCount: notifier.mostPopularItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final contentItem = notifier.featuredItems.elementAt(index);
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: ProductCard(
                      imageUrl: contentItem.productImage  ?? 'https://example.com/placeholder.jpg',
                      title:  contentItem.sku ?? 'No Name',
                      sale: contentItem.discount ?? 'Sale 65% Off',
                      price: contentItem.offerPrice ?? 'N/A',
                      originalPrice: contentItem.actualPrice ?? 'N/A',
                      rating: 4,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}