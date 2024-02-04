import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/kelas_siswa.dart';
import 'package:hyper_ui/model/sub_tatibs.dart';

class TatibView extends StatefulWidget {
  const TatibView({Key? key}) : super(key: key);

  Widget build(context, TatibController controller) {
    String nis = "0";
    String? tanggal;
    String tatibId = "0";

    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Tatib"),
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
                onChanged: (KelasSiswa? data) {
                  if (data?.nis != null) {
                    nis = data!.nis.toString();
                  }
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Pilih Siswa"),
                ),
              ),
              const SizedBox(
                height: 20.0,
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
                onChanged: (SubTatibs? data) {
                  if (data?.id != null) {
                    tatibId = data!.id.toString();
                  }
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Pilih Tatib"),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              QDatePicker(
                label: "Tanggal Kejadian",
                validator: Validator.required,
                value: null,
                onChanged: (value) {
                  tanggal = value.toString();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  controller.simpTatib(tatibId, nis, tanggal);
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
