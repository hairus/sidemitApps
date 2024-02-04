import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/point_siswa.dart';

class PointdayView extends StatefulWidget {
  const PointdayView({Key? key}) : super(key: key);

  Widget build(context, PointdayController controller) {
    controller.view = this;
    return Scaffold(
        appBar: AppBar(
          title: const Text("POIN HARI INI"),
          actions: [
            IconButton(
              onPressed: () {
                Get.offAll(MainNavigationView());
              },
              icon: const Icon(
                Icons.home,
                size: 24.0,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(TatibView());
              },
              icon: const Icon(
                Icons.add,
                size: 35.0,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: controller.getPointTodays(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    PointSiswa ps = snapshot.data[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            "https://i.ibb.co/QrTHd59/woman.jpg",
                          ),
                        ),
                        title: Text(ps.users.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ps.ket),
                            Text(ps.point.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              );
            }));
  }

  @override
  State<PointdayView> createState() => PointdayController();
}
