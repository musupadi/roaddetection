import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  bool isDialogShowing = false;
  bool isGalleryImage = false; // Track if a gallery image is displayed
  var _recognitions = [];
  String result = '';
  int selectedCameraIndex = 0;
  String? uploadedImagePath;

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

  Future<void> initializeCamera() async {
    try {
      // Ensure previous controller is disposed before reinitializing
      await cameraController?.dispose();

      cameraController = CameraController(
        widget.cameras[selectedCameraIndex],
        ResolutionPreset.medium,
      );

      await cameraController!.initialize();
      if (!mounted) return;
      setState(() {});

      // Start the image stream only if not displaying a gallery image
      if (!isGalleryImage) {
        cameraController!.startImageStream((CameraImage img) {
          if (!isDetecting && !isDialogShowing) {
            isDetecting = true;
            detectImage(img);
          }
        });
      }
    } catch (e) {
      print("Error initializing camera: $e");
    }
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

      if (recognitions != null && recognitions.isNotEmpty) {
        for (var recog in recognitions) {
          double confidence = recog["confidence"] ?? 0.0;
          String label = recog["label"] ?? 'Unknown';
          if (confidence > 0.9) {
            await _showHighConfidenceDialog(label, confidence);
            break;
          }
        }
      }
    } catch (e) {
      print("Error during image detection: $e");
    } finally {
      isDetecting = false;
    }
  }

  Future<void> _showHighConfidenceDialog(String label, double confidence) async {
    isDialogShowing = true;
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
    isDialogShowing = false;
    isDetecting = true;

    // 5-second delay before allowing the next detection
    await Future.delayed(const Duration(seconds: 5));
    isDetecting = false;
  }

  void switchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    resetCamera();
  }

  Future<void> resetCamera() async {
    uploadedImagePath = null;
    isGalleryImage = false;
    await initializeCamera();
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        uploadedImagePath = pickedFile.path;
        result = "Gambar dari galeri dipilih.";
        isGalleryImage = true;
      });

      // Stop the camera preview when a gallery image is used
      await cameraController?.stopImageStream();

      var recognitions = await Tflite.runModelOnImage(
        path: pickedFile.path,
        numResults: 6,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5,
      );

      setState(() {
        _recognitions = recognitions ?? [];
        result = recognitions?.isNotEmpty == true ? recognitions.toString() : "No object detected";
      });

      if (recognitions != null && recognitions.isNotEmpty) {
        for (var recog in recognitions) {
          double confidence = recog["confidence"] ?? 0.0;
          String label = recog["label"] ?? 'Unknown';
          await _showHighConfidenceDialog(label, confidence);
          break;
        }
      }
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Road Detector', style: TextStyle(color: Colors.white)),
        backgroundColor: PrimaryColors(),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_front, color: Colors.white),
            onPressed: switchCamera,
          ),
          IconButton(
            icon: Icon(Icons.photo_library, color: Colors.white),
            onPressed: pickImageFromGallery,
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          isGalleryImage && uploadedImagePath != null
              ? Image.file(
            File(uploadedImagePath!),
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          )
              : (cameraController != null && cameraController!.value.isInitialized
              ? CameraPreview(cameraController!)
              : const Center(child: CircularProgressIndicator())),
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
