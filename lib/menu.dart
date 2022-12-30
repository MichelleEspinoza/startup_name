import 'package:flutter/material.dart';
import 'package:startup_name/views/catalogs/fiscalEntity/list.dart';
import 'package:startup_name/views/catalogs/HardwareChecklist/list.dart';

class Menu extends StatefulWidget {
  final String _title;
  const Menu(this._title, {super.key});
  @override
  State<StatefulWidget> createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._title),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  //image: AssetImage("./assets/logo-jelp-delivery-purple.png"),
                  image: NetworkImage(
                    "https://tawk.link/6319249237898912e967dabc/kb/logo/xi1Y5IoK6Y.png",
                  ),
                ),
              ),
              child: Text(
                '2022',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.receipt,
              ),
              title: const Text('Hardware checklist'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage('Hardware checklist'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.receipt,
              ),
              title: const Text('Fiscal Entity'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePageF('Jelp Deliery'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.network(
                'https://tawk.link/6319249237898912e967dabc/kb/logo/xi1Y5IoK6Y.png')
          ],
        ),
      ),
    );
  }
}
