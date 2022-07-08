// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_component_style.dart';
import 'package:maintenance_app/app/modules/scan_page/tab/form/controllers/form_controller.dart';

import '../../../../../data/model/form.dart';
import '../../../../../global/theme/my_text_style.dart';

class MyForm extends StatefulWidget {
  List<Golongans> golongan;
  MyForm(this.golongan, {Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formC = Get.put(FormController());
  late String _result;
  late List<Map<String, dynamic>> _values;
  String okNotOk = "";
  List<bool>? buttonOkPressed;
  List<bool>? buttonNotOkPressed;

  @override
  void initState() {
    super.initState();
    _result = '';
    _values = [];
    buttonOkPressed = [];
    buttonNotOkPressed = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Flexible(
            child: generateForm(),
          ),
        ],
      ),
    ));
  }

  ListView generateForm() {
    return ListView.builder(
        itemCount: widget.golongan.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.golongan.length) {
            return SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                            labelText: "Keterangan", fillColor: Colors.white),
                        onChanged: ((value) =>
                            _formC.hasilPenilaian.value = value)),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            _formC.submitForm(_result);
                          },
                          child: const Text('Submit')),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.golongan[index].namaGolongan,
                      style: titleStyle),
                ),
                generateGolongan(widget.golongan[index]),
                verticalSpace(28),
              ],
            );
          }
        });
  }

  ListView generateGolongan(Golongans golongan) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: golongan.items.length,
        itemBuilder: (context, index) {
          //branch for selecting type of item filled by nilai or checklist
          if (golongan.items[index].tag == 'checklist') {
            return _checklist(golongan.items[index], index);
          } else {
            return _nilai(golongan.items[index], index);
          }
        });
  }

  _checklist(Items item, int index) {
    var name = item.namaItem;
    var standar = item.standar;
    buttonOkPressed?.add(false);
    buttonNotOkPressed?.add(false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                okButton(index, name, standar),
                notOkButton(index, name, standar),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton okButton(int index, String name, String standar) {
    return ElevatedButton(
        onPressed: () {
          _onUpdate(name, standar, "Ok");
          if (buttonOkPressed![index]) {
            buttonOkPressed![index] = true;
          } else {
            buttonOkPressed![index] = true;
            buttonNotOkPressed![index] = false;
          }
          setState(() {});
        },
        style: (buttonOkPressed![index])
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
        child: const Text('Ok'));
  }

  ElevatedButton notOkButton(int index, String name, String standar) {
    return ElevatedButton(
        onPressed: () {
          _onUpdate(name, standar, "Not ok");
          if (buttonNotOkPressed![index]) {
            buttonNotOkPressed![index] = true;
          } else {
            buttonNotOkPressed![index] = true;
            buttonOkPressed![index] = false;
          }
          setState(() {});
        },
        style: (buttonNotOkPressed![index])
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
        child: const Text('Not ok'));
  }

  _nilai(Items item, int index) {
    var name = item.namaItem;
    var standar = item.standar;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: name, hintText: "0", fillColor: Colors.white),
              onChanged: ((value) => _onUpdate(name, standar, value)),
            ),
          ),
        ],
      ),
    );
  }

  _onUpdate(String? key, String? standar, String val) async {
    String? foundKey = "null";
    for (var map in _values) {
      if (map.containsKey("item")) {
        if (map["item"] == key) {
          foundKey = key;
          break;
        }
      }
    }
    if ("null" != foundKey) {
      _values.removeWhere((map) {
        return map["item"] == foundKey;
      });
    }

    Map<String, dynamic> json = {"item": key, "standar": standar, "nilai": val};
    _values.add(json);

    setState(() {
      _result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(jsonObject);
  }
}
