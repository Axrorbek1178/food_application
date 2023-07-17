import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/NetworkService.dart';
import 'package:food_application/screens/splash_page.dart';

import 'Food.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Food> foods;
  bool isSearch = false;

  @override
  void initState() {
    foods = NetworkService().loadFoodRecipe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                });
              },
              icon: const Icon(
                Icons.search,
                size: 28,
              ))
        ],
        title: isSearch
            ? TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "hey type something...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
                onSubmitted: (value) {
                  setState(() {
                    foods = NetworkService().searchFood(value);
                  });
                },
              )
            : const Text(
                "Search",
                style: TextStyle(fontSize: 24),
              ),
      ),
      body: FutureBuilder(
          future: foods,
          builder: (BuildContext context, AsyncSnapshot<Food> asyncSnapshot) {
            return ListView.builder(
                itemCount: asyncSnapshot.data!.results!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black),
                          color: Colors.lightGreen),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Image.network(
                                asyncSnapshot.data!.results![index].image
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 150,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text(asyncSnapshot.data!.results![index].title
                                    .toString()),
                                const Text(
                                    "What kind of food do you want to eat?"),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text("124"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.watch_later,
                                          color: Colors.yellowAccent,
                                        ),
                                        Text("45"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.energy_savings_leaf,
                                          color: Colors.blue,
                                        ),
                                        Text("Vegan"),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.fastfood,
          color: Colors.amber,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: const Color(0xFF4C53A5),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
