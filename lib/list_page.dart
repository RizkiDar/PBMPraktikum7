import 'package:flutter/material.dart';
import 'db_provider.dart';
import 'package:provider/provider.dart';
import 'form.dart';
import 'form_update.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Anggotaku"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                provider.swapTheme();
              },
              child: const Icon(
                Icons.brightness_2,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final anggotas = provider.anggotas;
          return ListView.builder(
            itemCount: anggotas.length,
            itemBuilder: (context, index) {
              final anggota = anggotas[index];
              return Dismissible(
                key: Key(anggota.id.toString()),
                background: Container(color: Colors.pinkAccent),
                onDismissed: (direction) {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(anggota.nama),
                      subtitle: Text(anggota.jabatan),
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(anggota: anggota),
                            ));
                      },
                      trailing: Wrap(children: <Widget>[
                        IconButton(
                          onPressed: () async {
                            Provider.of<DbProvider>(context, listen: false)
                                .deleteAnggotas(anggota.id!);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UpdatePage(anggota: anggota);
                            }));
                          },
                          icon: const Icon(Icons.edit_note),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormPage(),
              ));
        },
        label: Text('Tambah Data'),
        icon: Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
