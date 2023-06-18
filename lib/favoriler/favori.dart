import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SepetimPage extends StatelessWidget {
  const SepetimPage({Key? key}) : super(key: key);

  Future<void> _silOnayla(BuildContext context, String docId) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Silme Onayı'),
          content: const Text('Bu yemeği favorilerden silmek istiyor musunuz?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Hayır'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Evet'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      await FirebaseFirestore.instance.collection('Sepet').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bir favori silindi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[300],
        title: const Text('Favorilerim'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/yemmekk.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Sepet').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final sepetVerileri = snapshot.data!.docs;

              if (sepetVerileri.isEmpty) {
                return const Center(
                  child: Text(
                    "Favorileriniz boş Boş",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: sepetVerileri.length,
                itemBuilder: (context, index) {
                  final yemek =
                      sepetVerileri[index].data() as Map<String, dynamic>;
                  final docId = sepetVerileri[index].id;

                  final resim = yemek['resim'] as String?;
                  final yemekAdi = yemek['yemek'] as String?;
                  final aciklama = yemek['aciklama'] as String?;
                  final fiyat = yemek['fiyat'] as String?;

                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: resim != null
                          ? Image.asset(
                              resim,
                              width: 50,
                              height: 50,
                            )
                          : SizedBox(),
                      title: Text(yemekAdi ?? ''),
                      subtitle: Text(aciklama ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _silOnayla(context, docId);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          Text(fiyat ?? ''),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
