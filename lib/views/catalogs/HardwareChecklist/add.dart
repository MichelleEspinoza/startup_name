import 'package:startup_name/views/catalogs/HardwareChecklist/list.dart';
import 'package:startup_name/views/text_box.dart';
import 'package:flutter/material.dart';

class AddHL extends StatefulWidget {
  const AddHL({super.key});

  @override
  State<StatefulWidget> createState() => _AddHL();
}

class _AddHL extends State<AddHL> {
  late TextEditingController controllerName;
  late TextEditingController controllerCode;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerCode = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registrar Hardware checklist"),
        ),
        body: ListView(
          children: [
            TextBox(controllerName, "Nombre"),
            TextBox(controllerCode, "Code"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                ),
                onPressed: () {
                  String name = controllerName.text;
                  String code = controllerCode.text;

                  if (name.isNotEmpty && code.isNotEmpty) {
                    Navigator.pop(context, Data(name: name, code: code));
                  }
                },
                child: const Text('Guardar')),
          ],
        ));
  }
}
