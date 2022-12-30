import 'package:startup_name/views/catalogs/fiscalEntity/list.dart';
import 'package:flutter/material.dart';
import 'package:startup_name/views/text_box.dart';

class Modify extends StatefulWidget {
  final Data _data;
  const Modify(this._data, {super.key});
  @override
  State<StatefulWidget> createState() => _Modify();
}

class _Modify extends State<Modify> {
  late TextEditingController controllerRfc;
  late TextEditingController controllerLegalName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerTaxSystem;
  late TextEditingController controllerZipCode;
  late TextEditingController controllerCountry;
  late TextEditingController controllerStreet;

  @override
  void initState() {
    Data c = widget._data;
    controllerRfc = TextEditingController(text: c.rfc);
    controllerLegalName = TextEditingController(text: c.legalName);
    controllerEmail = TextEditingController(text: c.email);
    controllerPhone = TextEditingController(text: c.phone);
    controllerTaxSystem = TextEditingController(text: c.taxSystem);
    controllerZipCode = TextEditingController(text: c.zipCode);
    controllerCountry = TextEditingController(text: c.country);
    controllerStreet = TextEditingController(text: c.street);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar Fiscal Entity"),
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
              child: const Text("Guardar")), //editar
        ],
      ),
    );
  }
}
