import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pantrycheck_admin/utilities/utilities.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.title,
    required TextEditingController controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.initialValue,
    this.hint,
    this.readOnly = false,
    this.autoFocus = false,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String title;
  final String? hint;
  final bool readOnly;
  final bool autoFocus;

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget._controller,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      autofocus: widget.autoFocus,
      validator: (String? value) => widget.validator!(value),
      inputFormatters: (widget.keyboardType == TextInputType.number)
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : <TextInputFormatter>[FilteringTextInputFormatter.deny('\n')],
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: widget.hint,
        suffixIcon: (widget._controller.text.isEmpty)
            ? const SizedBox()
            : IconButton(
                onPressed: () => widget._controller.clear(),
                icon: const Icon(Icons.clear),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Utilities.borderRadious),
        ),
      ),
    );
  }
}
