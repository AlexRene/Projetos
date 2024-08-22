import 'dart:async';
import 'dart:io';

import 'package:chat_flutter/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _sendMessage({String? text, File? imgFile}) async {
    if (imgFile != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(imgFile);

      TaskSnapshot snapshot = await task;
      Future<String> url = snapshot.ref.getDownloadURL();
      print(url);
    }
    FirebaseFirestore.instance.collection('messages').add({"text": text});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      List<DocumentSnapshot> documents = snapshot.data!.docs;

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile();
                        },
                        itemCount: documents.length,
                        reverse: true,
                      );
                  }
                },
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .snapshots(),
              ),
            ),
            TextComposer(_sendMessage),
          ],
        ),
      ),
    );
  }
}
