import 'package:flutter/material.dart';
import 'package:temsa_campus/colors/colors.dart';

class ConfirmationTextField extends StatelessWidget {
  const ConfirmationTextField({
    Key? key,
    required this.textController,
    required this.runFilter,
  }) : super(key: key);

  final TextEditingController textController;
  final Function runFilter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: (value) => runFilter(value),
      cursorColor: AppColors().grey3,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().grey3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors().grey3,
        ),
        filled: true,
        fillColor: AppColors().grey2,
        labelText: "Aramak için tıklayın",
        labelStyle: TextStyle(color: AppColors().grey3, fontSize: 16),
        suffix: IconButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            textController.text = "";
            runFilter(textController.text);
          },
          icon: Icon(
            Icons.cancel_rounded,
            color: AppColors().grey3,
          ),
        ),
        enabledBorder:
            UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
