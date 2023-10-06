import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late XFile _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _capturedImage = XFile('');
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Camera Inicializada'),
            content: const Text('A camera foi inicializada com sucesso'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              )
            ],
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final image = await _controller.takePicture();

      setState(() {
        _capturedImage = image;
      });
    } catch (e) {
      print("Erro ao capturar a imagem: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(child: CameraPreview(_controller)),
                _capturedImage != null
                    ? Image.file(File(_capturedImage.path))
                    : Container(),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(
          Icons.camera,
          size: 100,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
