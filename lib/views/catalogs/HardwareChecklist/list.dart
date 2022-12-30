import 'package:startup_name/views/message_response.dart';
import 'package:startup_name/views/catalogs/HardwareChecklist/modify.dart';
import 'package:startup_name/views/catalogs/HardwareChecklist/add.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  const MyHomePage(this._title, {super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Data> datas = [
    Data(name: 'Encender datos móviles', code: 'MOBILE_DATA_ON'),
    Data(name: 'Nivel de batería mayor a 10%', code: 'BATTERY'),
    Data(name: 'Verificación de conexión a internet', code: 'INTERNET_OK'),
    Data(name: 'Encender wifi', code: 'WIFI_ON')
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
                        context, "'${newContact.name}' a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeItem(context, datas[index]);
            },
            title: Text(datas[index].name),
            subtitle: Text(datas[index].code),
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
                  context, MaterialPageRoute(builder: (_) => const AddHL()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                datas.add(newContact);
                messageResponse(
                    context, "' ${newContact.name}' a sido guardado...!");
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
              title: const Text("Eliminar Hardware checklist"),
              content: Text("Esta seguro de eliminar a '${data.name}' ?"),
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
  String name;
  String code;

  Data({required this.name, required this.code});
}
