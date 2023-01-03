import 'package:startup_name/views/catalogs/HardwareChecklist/list.dart';
import 'package:flutter/material.dart';

class AddHL extends StatefulWidget {
  final Data? data;
  const AddHL({this.data, super.key});

  @override
  //State<StatefulWidget> createState() => _AddHL();
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
        // ignore: unnecessary_null_comparison
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
              // The validator receives the text that the user has entered.
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
              // The validator receives the text that the user has entered.
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
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
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
  /*late TextEditingController controllerName;
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
  }*/
}
