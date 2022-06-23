import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../data/model/form.dart';
import '../../../../../global/theme/my_text_style.dart';

class MyForm extends StatefulWidget {
  List<Golongans> golongan;
  MyForm(this.golongan, {Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
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
      child: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: widget.golongan.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.golongan[index].namaGolongan,
                              style: titleStyle),
                        ),
                        generateGolongan(widget.golongan[index]),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(_result)
          ],
        ),
      ),
    ));
  }

  ListView generateGolongan(Golongans golongan) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
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
    buttonOkPressed?.add(false);
    buttonNotOkPressed?.add(false);
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name + item.tag),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              okButton(index, name),
              notOkButton(index, name),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton okButton(int index, String name) {
    return ElevatedButton(
        onPressed: () {
          _onUpdate(index, name, "Ok");
          if (buttonOkPressed![index]) {
            buttonOkPressed![index] = true;
          } else {
            buttonOkPressed![index] = true;
            buttonNotOkPressed![index] = false;
          }
          setState(() {});
        },
        style: ButtonStyle(
          backgroundColor: (buttonOkPressed![index])
              ? MaterialStateProperty.all<Color>(Colors.pink)
              : MaterialStateProperty.all<Color>(Colors.black12),
        ),
        child: const Text('Ok'));
  }

  ElevatedButton notOkButton(int index, String name) {
    return ElevatedButton(
        onPressed: () {
          _onUpdate(index, name, "Not ok");
          if (buttonNotOkPressed![index]) {
            buttonNotOkPressed![index] = true;
          } else {
            buttonNotOkPressed![index] = true;
            buttonOkPressed![index] = false;
          }
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: (buttonNotOkPressed![index])
                ? MaterialStateProperty.all<Color>(Colors.pink)
                : MaterialStateProperty.all<Color>(Colors.black12),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        child: const Text('Not ok'));
  }

  _nilai(Items item, int index) {
    var name = item.namaItem;
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(labelText: name + item.tag),
            onChanged: ((value) => _onUpdate(index, name, value)),
          ),
        ),
      ],
    );
  }

  _onUpdate(int index, String? key, String val) async {
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

    Map<String, dynamic> json = {"item": key, "standar": "Tegas", "nilai": val};
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
