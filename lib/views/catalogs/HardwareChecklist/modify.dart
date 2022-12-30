import 'package:startup_name/views/catalogs/HardwareChecklist/list.dart';
import 'package:flutter/material.dart';
import 'package:startup_name/views/text_box.dart';

class Modify extends StatefulWidget {
  final Data _data;
  const Modify(this._data, {super.key});
  @override
  State<StatefulWidget> createState() => _Modify();
}

class _Modify extends State<Modify> {
  late TextEditingController controllerName;
  late TextEditingController controllercode;

  @override
  void initState() {
    Data c = widget._data;
    controllerName = TextEditingController(text: c.name);
    controllercode = TextEditingController(text: c.code);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar Hardware checklist"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllercode, "Code"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String code = controllercode.text;

                if (name.isNotEmpty && code.isNotEmpty) {
                  Navigator.pop(context, Data(name: name, code: code));
                }
              },
              child: const Text("Guardar")), //editar
        ],
      ),
    );
  }
}
