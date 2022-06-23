import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_component_style.dart';
import 'package:maintenance_app/app/modules/scan_page/tab/form/views/my_form.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  List<String> _status = ["Pending", "Released", "Blocked"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FormView'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => MyForm(state ?? []),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onError: (e) => Text(e.toString()),
        )
        // body: Obx(() {
        //   return Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       children: <Widget>[
        //         FormBuilder(
        //           key: _formKey,
        //           autovalidateMode: AutovalidateMode.disabled,
        //           child: Column(
        //             children: <Widget>[
        //               verticalSpace(20),
        //               FormBuilderChoiceChip(
        //                 name: controller.count.string,

        //                 decoration: const InputDecoration(
        //                   labelText: 'Wesel',
        //                 ),
        //                 // backgroundColor: Colors.white,
        //                 alignment: WrapAlignment.center,
        //                 options: const [
        //                   FormBuilderFieldOption(
        //                       value: 'Test', child: Text('Ok')),
        //                   FormBuilderFieldOption(
        //                       value: 'Test 1', child: Text('Not ok')),
        //                   FormBuilderFieldOption(
        //                       value: 'Test 2', child: Text('-')),
        //                 ],
        //               ),
        //               verticalSpace(20),
        //               FormBuilderChoiceChip(
        //                 name: controller.count.string,
        //                 decoration: const InputDecoration(
        //                   labelText: 'Wesel',
        //                 ),
        //                 alignment: WrapAlignment.center,
        //                 options: const [
        //                   FormBuilderFieldOption(
        //                       value: 'Test', child: Text('Ok')),
        //                   FormBuilderFieldOption(
        //                       value: 'Test 1', child: Text('Not ok')),
        //                   FormBuilderFieldOption(
        //                       value: 'Test 2', child: Text('-')),
        //                 ],
        //               ),
        //               verticalSpace(20),
        //             ],
        //           ),
        //         ),
        //         Row(
        //           children: <Widget>[
        //             Expanded(
        //               child: MaterialButton(
        //                 color: Theme.of(context).colorScheme.secondary,
        //                 child: const Text(
        //                   "Submit",
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 onPressed: () {
        //                   _formKey.currentState!.save();
        //                   if (_formKey.currentState!.validate()) {
        //                     print(_formKey.currentState!.value);
        //                   } else {
        //                     print("validation failed");
        //                   }
        //                 },
        //               ),
        //             ),
        //             const SizedBox(width: 20),
        //             Expanded(
        //               child: MaterialButton(
        //                 color: Theme.of(context).colorScheme.secondary,
        //                 child: const Text(
        //                   "Reset",
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 onPressed: () {
        //                   _formKey.currentState!.reset();
        //                 },
        //               ),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //   );
        // }),
        );
  }
}
