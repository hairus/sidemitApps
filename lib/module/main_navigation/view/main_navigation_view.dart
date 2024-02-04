import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraint) {
                      List menus = [
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/878/878052.png",
                          "label": "tatib",
                          "onTap": () {
                            Get.to(TatibView());
                          },
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/3595/3595455.png",
                          "label": "Pizza",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/2718/2718224.png",
                          "label": "Noodles",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/8060/8060549.png",
                          "label": "Meat",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/454/454570.png",
                          "label": "Soup",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/2965/2965567.png",
                          "label": "Dessert",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/2769/2769608.png",
                          "label": "Drink",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/1037/1037855.png",
                          "label": "Others",
                          "onTap": () {},
                        },
                      ];
                      return Wrap(
                        children: List.generate(
                          menus.length,
                          (index) {
                            var item = menus[index];

                            var size = constraint.biggest.width / 4;

                            return SizedBox(
                              width: size,
                              height: size,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blueGrey,
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  backgroundColor: Colors.transparent,
                                  splashFactory: InkSplash.splashFactory,
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                ),
                                onPressed: () => item["onTap"](),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      item["icon"],
                                      width: 30.0,
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      "${item["label"]}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 11.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      controller.doLogout();
                    },
                    child: const Text("logout"),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.viewDashboard,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(MdiIcons.table),
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.favorite),
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
