import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final int _maxLines;
  final bool _isPassword;
  final bool _obscureText;
  final Function? _onPressedSufixIcon;
  final Widget? _prefixIcon;

  const CustomInput({
    super.key,
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    bool isPassword = false,
    bool obscureText = false,
    Function? onPressedSufixIcon,
    Widget? prefixIcon,
  })  : _controller = controller,
        _label = label,
        _maxLines = maxLines,
        _isPassword = isPassword,
        _obscureText = obscureText,
        _onPressedSufixIcon = onPressedSufixIcon,
        _prefixIcon = prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        labelText: _label,
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: _prefixIcon,
        suffixIcon: buildSufixIcon(),
      ),
      cursorColor: Colors.black,
      maxLines: _maxLines,
      obscureText: _obscureText,
    );
  }

  Widget? buildSufixIcon() {
    if (!_isPassword) return null;

    return IconButton(
      onPressed:
          _onPressedSufixIcon != null ? () => _onPressedSufixIcon() : null,
      icon: Icon(
        !_obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: Colors.grey.shade700,
      ),
    );
  }
}
