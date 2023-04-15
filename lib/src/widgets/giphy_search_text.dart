import 'package:flutter/material.dart';
import 'package:giphy_picker/src/widgets/giphy_context.dart';

/// Provides a default text editor implementation for search operations.
class GiphySearchText extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const GiphySearchText({Key? key, required this.controller, this.onChanged})
      : super(key: key);

  @override
  _GiphySearchTextState createState() => _GiphySearchTextState();
}

class _GiphySearchTextState extends State<GiphySearchText> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: GiphyContext.of(context).searchHintText,
        ),
        onChanged: widget.onChanged,
        focusNode: _focusNode,
      ),
    );
  }
}
