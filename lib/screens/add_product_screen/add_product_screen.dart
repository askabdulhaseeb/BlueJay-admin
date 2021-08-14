import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pantrycheck_admin/screens/widgets/custom_textformfield.dart';
import 'package:pantrycheck_admin/utilities/custom_validator.dart';
import 'package:pantrycheck_admin/utilities/utilities.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/AddProductScreen';
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _qty = TextEditingController();
  final TextEditingController _price = TextEditingController();
  XFile? _image;
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Add Product'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.all(Utilities.padding),
          child: ListView(
            children: <Widget>[
              _pickImageWidget(),
              const SizedBox(height: 10),
              CustomTextFormField(
                title: 'Name',
                controller: _name,
                hint: 'Product Name',
                validator: (String? value) => CustomValidator.lessThen3(value),
                autoFocus: true,
              ),
              CustomTextFormField(
                title: 'Discription',
                controller: _name,
                hint: 'Product Name',
                validator: (String? value) => CustomValidator.lessThen3(value),
                autoFocus: true,
              ),
              CustomTextFormField(
                title: 'Price',
                controller: _price,
                hint: 'Product Price',
                keyboardType: TextInputType.number,
                validator: (String? value) => CustomValidator.lessThen3(value),
              ),
              CustomTextFormField(
                title: 'Quantity',
                controller: _qty,
                hint: 'Product Quantity',
                keyboardType: TextInputType.number,
                validator: (String? value) => CustomValidator.lessThen3(value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _pickImageWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: _image != null
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  width: 120,
                  height: 120,
                  child: Image.file(
                    File(_image!.path),
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  width: 120,
                  height: 120,
                  child: Icon(
                    Icons.image,
                    color: Colors.grey[800],
                  ),
                ),
        ),
        TextButton(
          onPressed: () {
            _showPicker(context);
          },
          child: const Text('Choose image'),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _imgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _file = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = _file;
    });
  }

  Future<void> _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _file = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = _file;
    });
  }
}
