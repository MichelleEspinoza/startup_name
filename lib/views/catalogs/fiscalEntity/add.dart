import 'package:startup_name/views/catalogs/fiscalEntity/list.dart';
import 'package:flutter/material.dart';

class AddFE extends StatefulWidget {
  final Data? data;
  //final String? Function(String?)? validator;
  const AddFE({this.data, super.key});

  @override
  State<StatefulWidget> createState() => _AddHL();
  /*State createState() {
    return _AddHL();
  }*/
}

RegExp rfc = RegExp(
    r'^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$');
//RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
RegExp phone = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

class _AddHL extends State<AddFE> {
  late TextEditingController controllerRfc;
  late TextEditingController controllerLegalName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerTaxSystem;
  late TextEditingController controllerZipCode;
  late TextEditingController controllerCountry;
  late TextEditingController controllerStreet;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    Data? c = widget.data;
    controllerRfc = TextEditingController(text: c?.rfc);
    controllerLegalName = TextEditingController(text: c?.legalName);
    controllerEmail = TextEditingController(text: c?.email);
    controllerPhone = TextEditingController(text: c?.phone);
    controllerTaxSystem = TextEditingController(text: c?.taxSystem);
    controllerZipCode = TextEditingController(text: c?.zipCode);
    controllerCountry = TextEditingController(text: c?.country);
    controllerStreet = TextEditingController(text: c?.street);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controllerRfc.text.isNotEmpty
            ? "Modificar Fiscal Entity"
            : "Registrar Fiscal Entity"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'RFC',
              ),
              controller: controllerRfc,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (!rfc.hasMatch(value)) {
                  return 'RFC No valido';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
              controller: controllerLegalName,
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
                labelText: 'Email',
              ),
              controller: controllerEmail,
              /*validator: (value) {
              if (!email.hasMatch(value!)) {
                return 'Email No valido';
              }
              return null;
            },*/
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Phone',
              ),
              controller: controllerPhone,
              validator: (value) {
                if (!phone.hasMatch(value!)) {
                  return 'Phone No valido';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Tax system',
              ),
              controller: controllerTaxSystem,
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
                labelText: 'C.P',
              ),
              controller: controllerZipCode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length > 5 || value.length < 5) {
                  return 'Email No valido';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Country',
              ),
              controller: controllerCountry,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Street',
              ),
              controller: controllerStreet,
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
                    String rfc = controllerRfc.text;
                    String legalName = controllerLegalName.text;
                    String email = controllerEmail.text;
                    String phone = controllerPhone.text;
                    String taxSystem = controllerTaxSystem.text;
                    String zipCode = controllerZipCode.text;
                    String country = controllerCountry.text;
                    String street = controllerStreet.text;
                    Navigator.pop(
                        context,
                        Data(
                            rfc: rfc,
                            legalName: legalName,
                            email: email,
                            phone: phone,
                            taxSystem: taxSystem,
                            zipCode: zipCode,
                            country: country,
                            street: street));
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

  /*late TextEditingController controllerRfc;
  late TextEditingController controllerLegalName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerTaxSystem;
  late TextEditingController controllerZipCode;
  late TextEditingController controllerCountry;
  late TextEditingController controllerStreet;

  @override
  void initState() {
    controllerRfc = TextEditingController();
    controllerLegalName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPhone = TextEditingController();
    controllerTaxSystem = TextEditingController();
    controllerZipCode = TextEditingController();
    controllerCountry = TextEditingController();
    controllerStreet = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registrar Fiscal Entity"),
        ),
        body: ListView(
          children: [
            TextBox(controllerRfc, "Rfc"),
            TextBox(controllerLegalName, "Name"),
            TextBox(controllerEmail, "Email"),
            TextBox(controllerPhone, "Phone"),
            TextBox(controllerTaxSystem, "Tax system"),
            TextBox(controllerZipCode, "CP"),
            TextBox(controllerCountry, "Country"),
            TextBox(controllerStreet, "Street"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                ),
                onPressed: () {
                  String rfc = controllerRfc.text;
                  String legalName = controllerLegalName.text;
                  String email = controllerEmail.text;
                  String phone = controllerPhone.text;
                  String taxSystem = controllerTaxSystem.text;
                  String zipCode = controllerZipCode.text;
                  String country = controllerCountry.text;
                  String street = controllerStreet.text;

                  if (rfc.isNotEmpty &&
                      legalName.isNotEmpty &&
                      phone.isNotEmpty &&
                      taxSystem.isNotEmpty &&
                      zipCode.isNotEmpty) {
                    Navigator.pop(
                        context,
                        Data(
                            rfc: rfc,
                            legalName: legalName,
                            email: email,
                            phone: phone,
                            taxSystem: taxSystem,
                            zipCode: zipCode,
                            country: country,
                            street: street));
                  }
                },
                child: const Text('Guardar')),
          ],
        ));
  }*/
}
