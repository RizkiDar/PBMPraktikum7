import 'package:flutter/material.dart';
import 'anggota.dart';
import 'db_provider.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  final Anggota? anggota;

  const UpdatePage({Key? key, this.anggota}) : super(key: key);

  @override
  State<UpdatePage> createState() => _FormPageState();
}

class _FormPageState extends State<UpdatePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jabatanController = TextEditingController();
  final TextEditingController _bidangController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.anggota!.id);
    _namaController.text = widget.anggota!.nama;
    _jabatanController.text = widget.anggota!.jabatan;
    _bidangController.text = widget.anggota!.bidang;
    _keteranganController.text = widget.anggota!.keterangan;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    label: const Text('Nama'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _jabatanController,
                  decoration: InputDecoration(
                    label: const Text('Jabatan'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _bidangController,
                  decoration: InputDecoration(
                    label: const Text('bidang'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _keteranganController,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text('Keterangan'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        final anggota = Anggota(
                            id: widget.anggota!.id!,
                            nama: _namaController.text,
                            jabatan: _jabatanController.text,
                            bidang: _bidangController.text,
                            keterangan: _keteranganController.text);
                        Provider.of<DbProvider>(context, listen: false)
                            .updateAnggotas(anggota);
                        Navigator.pop(context);
                      },
                      label: Text("Update"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ]),
        ),
      )),
    );
  }
}
