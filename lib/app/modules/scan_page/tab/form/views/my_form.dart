// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
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
  List<String>? dropdownValue;
  late final Map<int, String> _leftValue = {};
  late final Map<String, bool> _buttonValue = {};

  final List<String> optionItems = ['1 mm', '2 mm', '3 mm'];

  @override
  void initState() {
    super.initState();
    _result = '';
    _values = [];
    dropdownValue = [];
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
          dropdownValue?.add("");

          if (golongan.items[index].tag == 'checklist') {
            if (index == 2) {
              if (_buttonValue["2ok$index"] == null) {
                _buttonValue["1ok$index"] = false;
                _buttonValue[("1notok$index")] = false;
                _buttonValue["2ok$index"] = false;
                _buttonValue[("2notok$index")] = false;
              }
              return _checklist2(golongan.items[index], index);
            } else {
              if (_buttonValue["ok$index"] == null) {
                _buttonValue["ok$index"] = false;
                _buttonValue[("notok$index")] = false;
              }
              return _checklist(golongan.items[index], index);
            }
          } else if (golongan.items[index].tag == 'option') {
            return _option(golongan.items[index], index);
          } else {
            if (index == 4) {
              return _nilai2(golongan.items[index], index);
            } else {
              return _nilai(golongan.items[index], index);
            }
          }
        });
  }

  _option(Items item, int index) {
    var name = item.namaItem;
    var standar = item.standar;
    dropdownValue![index] = "1 mm";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        isExpanded: true,
        hint: Text(
          name,
          style: const TextStyle(fontSize: 14),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        items: optionItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _onUpdate(name, standar, value.toString());
            dropdownValue![index] = value.toString();
          });
        },
      ),
    );
  }

  _checklist(Items item, int index) {
    var name = item.namaItem;
    var standar = item.standar;
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
                okButton(index, name, standar, false),
                notOkButton(index, name, standar, false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _checklist2(Items item, int index) {
    var name = item.namaItem;
    var standar = item.standar;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                okButton(index, name, standar, true),
                notOkButton(index, name, standar, true),
              ],
            ),
            Text(name),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                okButton2(index, name, standar, false),
                notOkButton2(index, name, standar, false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton okButton(int index, String name, String standar, bool isLeft) {
    return ElevatedButton(
        onPressed: () {
          if (isLeft) {
            if (_buttonValue['1ok$index'] as bool) {
              _buttonValue['1ok$index'] = true;
            } else {
              _buttonValue['1ok$index'] = true;
              _buttonValue['1notok$index'] = false;
            }
            _leftValue[index] = "OK;";
          } else {
            if (_buttonValue['ok$index'] as bool) {
              _buttonValue['ok$index'] = true;
            } else {
              _buttonValue['ok$index'] = true;
              _buttonValue['notok$index'] = false;
            }
            _onUpdate(name, standar, "OK");
          }
          setState(() {});
        },
        style: ((isLeft)
                ? _buttonValue['1ok$index'] as bool
                : _buttonValue['ok$index'] as bool)
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
        child: const Text('Ok'));
  }

  ElevatedButton notOkButton(
      int index, String name, String standar, bool isLeft) {
    return ElevatedButton(
        onPressed: () {
          if (isLeft) {
            if (_buttonValue['1notok$index'] as bool) {
              _buttonValue['1notok$index'] = true;
            } else {
              _buttonValue['1notok$index'] = true;
              _buttonValue['1ok$index'] = false;
            }
            _leftValue[index] = "NOT OK;";
          } else {
            if (_buttonValue['notok$index'] as bool) {
              _buttonValue['notok$index'] = true;
            } else {
              _buttonValue['notok$index'] = true;
              _buttonValue['ok$index'] = false;
            }
            _onUpdate(name, standar, "NOT OK");
          }
          setState(() {});
        },
        style: ((isLeft)
                ? _buttonValue['1notok$index'] as bool
                : _buttonValue['notok$index'] as bool)
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red))
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
        child: const Text('Not ok'));
  }

  ElevatedButton okButton2(
      int index, String name, String standar, bool isLeft) {
    return ElevatedButton(
        onPressed: () {
          if (_buttonValue['2ok$index'] as bool) {
            _buttonValue['2ok$index'] = true;
          } else {
            _buttonValue['2ok$index'] = true;
            _buttonValue['2notok$index'] = false;
          }

          if (_leftValue[index] != null) {
            _onUpdate(name, standar, "${_leftValue[index]}OK");
          }

          setState(() {});
        },
        style: (_buttonValue['2ok$index'] as bool)
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
        child: const Text('Ok'));
  }

  ElevatedButton notOkButton2(
      int index, String name, String standar, bool isLeft) {
    return ElevatedButton(
        onPressed: () {
          if (_buttonValue['2notok$index'] as bool) {
            _buttonValue['2notok$index'] = true;
          } else {
            _buttonValue['2notok$index'] = true;
            _buttonValue['2ok$index'] = false;
          }
          if (_leftValue[index] != null) {
            _onUpdate(name, standar, "${_leftValue[index]}NOT OK");
          }
          setState(() {});
        },
        style: (_buttonValue['2notok$index'] as bool)
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red))
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

  //input 2 nilai kiri & kanan
  _nilai2(Items item, int index) {
    var name = item.namaItem;
    var standar = item.standar;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "$name (kiri)",
                  hintText: "0",
                  fillColor: Colors.white),
              onChanged: ((value) => _leftValue[index] = value),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "$name (kanan)",
                  hintText: "0",
                  fillColor: Colors.white),
              onChanged: ((value) {
                String newValue = "$value;${_leftValue[index]}";
                _onUpdate(name, standar, newValue);
              }),
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
