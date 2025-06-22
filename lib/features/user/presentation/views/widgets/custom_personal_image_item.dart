import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomPersonalImageItem extends StatefulWidget {
  const CustomPersonalImageItem({
    super.key,
    required this.onImageSelected,
  });
  final void Function(List<int>?) onImageSelected;
  @override
  State<CustomPersonalImageItem> createState() =>
      _CustomPersonalImageItemState();
}

class _CustomPersonalImageItemState extends State<CustomPersonalImageItem> {
  io.File? _image;
  Uint8List? _imageBytes;
  String? base64Image;

  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = io.File(pickedFile.path);
      if (_image != null) {
        _imageBytes = await _image!.readAsBytes(); // ← لازم نعينها هنا
        base64Image = base64Encode(_imageBytes!);
        widget.onImageSelected(_imageBytes!); // ← كدا هتبعت بيانات فعلًا
        setState(() {});
      }
    }
  }

  ImageProvider getImageProvider({
    required Uint8List? imageBytes,
    required io.File? fileImage,
  }) {
    if (kIsWeb) {
      return (imageBytes != null)
          ? MemoryImage(imageBytes)
          : const AssetImage('assets/images/personalDefaultImage.png');
    } else {
      return (fileImage != null)
          ? FileImage(fileImage)
          : const AssetImage('assets/images/personalDefaultImage.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .3,
          height: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  getImageProvider(imageBytes: _imageBytes, fileImage: _image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                Symbols.cloud_upload,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
