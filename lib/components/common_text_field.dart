import 'package:green_ghana_app/utils/exports.dart';

class CommonTextFieldComponent extends StatelessWidget {
  const CommonTextFieldComponent({
    super.key,
    this.hintText,
    this.controller,
  });
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText!,
          fillColor: CustomColors.secondaryColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
