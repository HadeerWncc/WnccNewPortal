import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';

class CustomChangeImagePicker extends StatefulWidget {
  const CustomChangeImagePicker({
    super.key,
    required this.onImageSelected,
  });
  final void Function(List<int>?) onImageSelected;

  @override
  State<CustomChangeImagePicker> createState() =>
      _CustomChangeImagePickerState();
}

class _CustomChangeImagePickerState extends State<CustomChangeImagePicker> {
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
          : const AssetImage('');
    } else {
      return (fileImage != null) ? FileImage(fileImage) : const AssetImage('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: MediaQuery.of(context).size.width * .33,
        height: MediaQuery.of(context).size.width * .33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromARGB(255, 235, 235, 235),
            width: 2,
          ),
          image: DecorationImage(
            image: getImageProvider(imageBytes: _imageBytes, fileImage: _image),
            fit: BoxFit.cover,
          ),
        ),
        child: getImageProvider(imageBytes: _imageBytes, fileImage: _image) ==
                const AssetImage('')
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Symbols.add_photo_alternate,
                    color: Colors.blueGrey,
                    weight: 900,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Drop Personal Image',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Maximum size 2px',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
