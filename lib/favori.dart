import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriPage extends StatelessWidget {
  const FavoriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text('Yemekcii Favori Yemekler'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/kalp2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Favori').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final favoriYemekler = snapshot.data!.docs;

            if (favoriYemekler.isEmpty) {
              return Center(
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "Favorileriniz boş",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: favoriYemekler.length,
              itemBuilder: (context, index) {
                final yemekId = favoriYemekler[index].id;
                final yemek =
                    favoriYemekler[index].data() as Map<String, dynamic>;
                final yemekAdi = yemek['yemek'] as String?;
                final aciklama = yemek['aciklama'] as String?;
                final fiyat = yemek['fiyat'] as String?;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        yemekAdi ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        aciklama ?? '',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            fiyat ?? '',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Silme işlemini gerçekleştirmek için Firestore'a istek gönderin
                              FirebaseFirestore.instance
                                  .collection('Favori')
                                  .doc(yemekId)
                                  .delete();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
