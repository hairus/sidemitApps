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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[200],
                              minimumSize: Size(100, 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Get.to(TatibView());
                            },
                            child: const ImageIcon(
                              AssetImage(
                                "assets/icon/1.png",
                              ),
                              size: 50.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "TATIB",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[200],
                              minimumSize: Size(100, 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Get.to(PointdayView());
                            },
                            child: const ImageIcon(
                              AssetImage(
                                "assets/icon/2.png",
                              ),
                              size: 50.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "POINT DAYS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
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
                Icons.exit_to_app,
              ),
              label: "logout",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.exit_to_app),
          onPressed: () {
            controller.doLogout();
          },
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
