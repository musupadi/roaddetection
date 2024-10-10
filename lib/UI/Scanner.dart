import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Tambahkan ini
import 'package:roaddetection/Constant/Colors.dart';
import 'package:tflite_v2/tflite_v2.dart';

class Scanner extends StatefulWidget {
  final List<CameraDescription> cameras;

  const Scanner({Key? key, required this.cameras}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  CameraController? cameraController;
  bool isDetecting = false;
  bool isDialogShowing = false; // Tambahkan ini untuk melacak apakah dialog terbuka
  var _recognitions = [];
  String result = '';
  int selectedCameraIndex = 0; // Untuk melacak kamera depan/belakang

  @override
  void initState() {
    super.initState();
    loadModel();
    initializeCamera();
  }

  Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/tensorflow/model_unquant.tflite",
        labels: "assets/tensorflow/labels.txt",
      );
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  void initializeCamera() {
    cameraController = CameraController(
      widget.cameras[selectedCameraIndex],
      ResolutionPreset.medium,
    );

    cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});

      cameraController!.startImageStream((CameraImage img) {
        if (!isDetecting && !isDialogShowing) { // Deteksi hanya jika tidak ada dialog
          isDetecting = true;
          detectImage(img);
        }
      });
    }).catchError((e) {
      print("Error initializing camera: $e");
    });
  }

  Future<void> detectImage(CameraImage image) async {
    try {
      int startTime = DateTime.now().millisecondsSinceEpoch;

      var recognitions = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: image.height,
        imageWidth: image.width,
        numResults: 6,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5,
      );

      setState(() {
        _recognitions = recognitions ?? [];
        result = recognitions?.isNotEmpty == true ? recognitions.toString() : "No object detected";
      });

      int endTime = DateTime.now().millisecondsSinceEpoch;
      print("Inference took ${endTime - startTime}ms");

      // Cek apakah ada yang lebih dari 90%
      if (recognitions != null && recognitions.isNotEmpty) {
        for (var recog in recognitions) {
          double confidence = recog["confidence"] ?? 0.0;
          String label = recog["label"] ?? 'Unknown';
          if (confidence > 0.9) {
            await _showHighConfidenceDialog(label, confidence); // Menunggu hingga dialog ditutup
            break; // Hentikan setelah dialog ditampilkan
          }
        }
      }
    } catch (e) {
      print("Error during image detection: $e");
    } finally {
      isDetecting = false; // Set kembali ke false untuk memulai deteksi selanjutnya
    }
  }

  Future<void> _showHighConfidenceDialog(String label, double confidence) async {
    isDialogShowing = true; // Tandai bahwa dialog sedang tampil
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("High Confidence Detection"),
          content: Text(
              "Label: $label\nConfidence: ${(confidence * 100).toStringAsFixed(2)}%"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    isDialogShowing = false; // Set kembali ke false setelah dialog ditutup
  }

  void switchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    initializeCamera();
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        result = "Gambar dari galeri dipilih.";
      });

      // Tambahkan logika untuk memproses gambar yang diambil dari galeri
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengubah warna tombol back menjadi putih
        ),
        title: const Text('Road Detector', style: TextStyle(color: Colors.white)),
        backgroundColor: PrimaryColors(),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_front, color: Colors.white),
            onPressed: switchCamera, // Ganti kamera depan/belakang
          ),
          IconButton(
            icon: Icon(Icons.photo_library, color: Colors.white),
            onPressed: pickImageFromGallery, // Ambil gambar dari galeri
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          CameraPreview(cameraController!),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _recognitions.map((recog) {
                  String className = recog["label"] ?? 'Unknown';
                  double confidence = recog["confidence"] ?? 0.0;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            className.substring(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: LinearProgressIndicator(
                            value: confidence,
                            backgroundColor: SecondaryColors(),
                            color: PrimaryColors(),
                            minHeight: 8,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${(confidence * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
