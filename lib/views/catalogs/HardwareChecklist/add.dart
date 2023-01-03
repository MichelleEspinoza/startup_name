import 'package:startup_name/views/catalogs/HardwareChecklist/list.dart';
import 'package:flutter/material.dart';

class AddHL extends StatefulWidget {
  final Data? data;
  const AddHL({this.data, super.key});

  @override
  State createState() {
    return _AddHL();
  }
}

class _AddHL extends State<AddHL> {
  late TextEditingController controllerName;
  late TextEditingController controllercode;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    Data? c = widget.data;
    controllerName = TextEditingController(text: c?.name);
    controllercode = TextEditingController(text: c?.code);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controllercode.text.isNotEmpty
            ? "Modificar Hardware checklist"
            : "Registrar Hardware checklist"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nombre',
              ),
              controller: controllerName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Code',
              ),
              controller: controllercode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('guardando datos')),
                    );
                    String name = controllerName.text;
                    String code = controllercode.text;

                    Navigator.pop(context, Data(name: name, code: code));
                  }
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
