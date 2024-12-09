import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    required this.onChanged,
    this.title,
    this.onValidate,
    this.onEditingComplete,
    this.onSubmitted,
    this.autofocus = false,
    this.controller,
    this.maxLength,
    this.onFocusChange,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.keyboardAppearance = Brightness.dark,
    this.textInputAction = TextInputAction.done,
    this.textAlign = TextAlign.start,
    this.errorText,
    this.initialValue,
    this.onFocus,
    this.maxLine = 1,
    this.hintText,
    this.shouldShowError = true,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    this.textStyle = AppTextStyles.s14w400,
    this.obscureText = false,
    this.suffixIcon,
    this.autocorrect = false,
    this.isDense = true,
    this.isShowInputBorder = true,
    super.key,
  });

  final String? title;

  /// Callback when text has been changed
  final ValueChanged<String> onChanged;

  /// Callback when editing completed
  final VoidCallback? onEditingComplete;

  /// Callback when text has been changed
  final void Function(String? value)? onValidate;

  /// Callback when submitted.
  final ValueChanged<String>? onSubmitted;

  final ValueChanged<bool>? onFocusChange;

  /// Auto focus, default is false
  final bool autofocus;

  /// Controller for this Input Field
  final TextEditingController? controller;

  /// Max length
  final int? maxLength;

  /// This focus node
  final FocusNode? focusNode;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Keyboard mode
  final Brightness keyboardAppearance;

  /// TextInputAction for this Input Field
  final TextInputAction textInputAction;

  /// Align input text
  final TextAlign textAlign;

  /// Error text
  final String? errorText;

  /// Initial value
  final String? initialValue;

  /// Callback when focus on input field
  final VoidCallback? onFocus;

  /// Max line for this input field
  final int? maxLine;

  final String? hintText;

  final bool shouldShowError;

  final EdgeInsets contentPadding;

  final TextStyle textStyle;

  final bool obscureText;

  final String? suffixIcon;

  final bool autocorrect;

  final bool isDense;

  final bool isShowInputBorder;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late FocusNode focusNode;

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();

    /// Init textController here
    textController = TextEditingController(text: widget.initialValue);

    if (widget.initialValue != null) {
      Future.delayed(Duration.zero, () {
        widget.onChanged(widget.initialValue!);
      });
    }

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        widget.onFocus?.call();
      } else {
        widget.onValidate?.call(textController.text);
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        _buildTextFormField(),
        const SizedBox(height: 4),
        _buildErrorText(),
      ],
    );
  }

  Widget _buildTitle() {
    return (widget.title != null)
        ? Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.title!,
              style: AppTextStyles.s18w400.copyWith(
                color: ColorName.black,
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      keyboardAppearance: widget.keyboardAppearance,
      onFieldSubmitted: widget.onSubmitted,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      obscuringCharacter: "*",
      style: widget.textStyle.copyWith(
        color: ColorName.black,
      ),
      cursorColor: ColorName.black,
      decoration: _getInputDecoration(),
      maxLines: widget.maxLine,
      onChanged: (value) {
        widget.onChanged(value);
      },
      onEditingComplete: () {
        if (widget.onEditingComplete != null) {
          widget.onEditingComplete!();
        }
      },
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      autocorrect: widget.autocorrect,
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: AppTextStyles.s14w400.copyWith(
        color: ColorName.black.withOpacity(0.62),
      ),
      contentPadding: widget.contentPadding,
      isDense: widget.isDense,
      suffixIconConstraints: const BoxConstraints(
        minWidth: 2,
        minHeight: 2,
      ),
      suffixIcon: _buildSuffixIcon(),
      focusedBorder: widget.isShowInputBorder
          ? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.errorText == null
                    ? ColorName.grayE3E3E3
                    : ColorName.redFF4343.withOpacity(0.8),
              ),
              borderRadius: BorderRadius.circular(10),
            )
          : InputBorder.none,
      enabledBorder: widget.isShowInputBorder
          ? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.errorText == null
                    ? ColorName.grayE3E3E3
                    : ColorName.redFF4343.withOpacity(0.8),
              ),
              borderRadius: BorderRadius.circular(10),
            )
          : InputBorder.none,
      fillColor: Colors.white,
      filled: true,
      counterText: '',
      border: widget.isShowInputBorder ? null : InputBorder.none,
    );
  }

  Widget _buildSuffixIcon() {
    return (widget.suffixIcon?.isNotEmpty ?? false)
        ? SvgPicture.asset(
            widget.suffixIcon!,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              widget.errorText == null
                  ? ColorName.black
                  : ColorName.redFF4343.withOpacity(0.8),
              BlendMode.srcIn,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildErrorText() {
    return (widget.errorText != null)
        ? Text(
            widget.errorText!,
            style: AppTextStyles.s14w400.copyWith(color: ColorName.redFF4343),
          )
        : const SizedBox.shrink();
  }
}
