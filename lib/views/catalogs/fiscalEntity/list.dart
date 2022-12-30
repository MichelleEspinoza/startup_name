import 'package:startup_name/views/message_response.dart';
import 'package:startup_name/views/catalogs/fiscalEntity/modify.dart';
import 'package:startup_name/views/catalogs/fiscalEntity/add.dart';
import 'package:flutter/material.dart';

class MyHomePageF extends StatefulWidget {
  final String _title;
  const MyHomePageF(this._title, {super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePageF> {
  List<Data> datas = [
    Data(
        rfc: 'UADL940405KS6',
        legalName: 'Luis Josue Uscanga Dominguez',
        email: '',
        phone: '6641321144',
        taxSystem: '603',
        zipCode: "22207",
        country: "MEX",
        street: "dddd"),
    //address: {zipCode: "22207", country: "MEX", street: "dddd"}),
    Data(
        rfc: 'UADL940405KS4',
        legalName: 'Luis Josue Uscanga Dominguez',
        email: '',
        phone: '6641321144',
        taxSystem: '603',
        zipCode: "22207",
        country: "MEX",
        street: "dddd"),
    Data(
        rfc: 'HEGA820506M10',
        legalName: 'JOSE ALONSO HERNANDEZ GARCIA',
        email: '',
        phone: '6641321144',
        taxSystem: '603',
        zipCode: "22207",
        country: "MEX",
        street: "dddd"),
    Data(
        rfc: 'HEGA820506M10',
        legalName: 'JOSE ALONSO HERNANDEZ GARCIA',
        email: '',
        phone: '6641321144',
        taxSystem: '603',
        zipCode: "22207",
        country: "MEX",
        street: "dddd"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Modify(datas[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    datas.removeAt(index);

                    datas.insert(index, newContact);

                    messageResponse(
                        context, "'${newContact.rfc}' a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeItem(context, datas[index]);
            },
            title: Text(datas[index].rfc),
            subtitle: Text(datas[index].legalName),
            trailing: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const AddFE()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                datas.add(newContact);
                messageResponse(
                    context, "' ${newContact.rfc}' a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Agregar elemento",
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  removeItem(BuildContext context, Data data) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar Fiscal Entity"),
              content: Text("Esta seguro de eliminar a '${data.rfc}' ?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      datas.remove(data);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Data {
  String rfc;
  String legalName;
  String email;
  String phone;
  String taxSystem;
  //Object address;
  String zipCode;
  String country;
  String street;

  Data({
    required this.rfc,
    required this.legalName,
    this.email = "",
    required this.phone,
    required this.taxSystem,
    //this.address = {},
    required this.zipCode,
    this.country = "",
    this.street = "",
  });
}
