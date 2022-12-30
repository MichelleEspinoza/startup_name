import 'package:startup_name/views/catalogs/fiscalEntity/list.dart';
import 'package:startup_name/views/text_box.dart';
import 'package:flutter/material.dart';

class AddFE extends StatefulWidget {
  const AddFE({super.key});

  @override
  State<StatefulWidget> createState() => _AddHL();
}

class _AddHL extends State<AddFE> {
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
  }
}
