import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/kelas_siswa.dart';
import 'package:hyper_ui/model/sub_tatibs.dart';
import 'package:hyper_ui/service/auth_services/auth_services.dart';
import 'package:hyper_ui/service/kelas_siswa/kelas_siswa.dart';

class TatibView extends StatefulWidget {
  const TatibView({Key? key}) : super(key: key);

  Widget build(context, TatibController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tatib"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DropdownSearch<KelasSiswa>(
                selectedItem: null,
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                clearButtonProps: const ClearButtonProps(
                  isVisible: true,
                ),
                asyncItems: (String filter) => controller.doGetKelasSiswa(),
                itemAsString: (KelasSiswa u) => u.users.name,
                onChanged: (KelasSiswa? data) {},
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Pilih Siswa"),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownSearch<SubTatibs>(
                selectedItem: null,
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                clearButtonProps: const ClearButtonProps(
                  isVisible: true,
                ),
                asyncItems: (String filter) => controller.getTatibs(),
                itemAsString: (SubTatibs u) => u.subTatib + '->' + u.poin,
                onChanged: (SubTatibs? data) {},
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Pilih Tatib"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  snackbarDanger(
                    message: "maaf masih belum bisa di simpan",
                    duration: 2,
                  );
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<TatibView> createState() => TatibController();
}
