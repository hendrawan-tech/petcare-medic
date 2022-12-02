import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medic_petcare/Utils/Themes.dart';
import 'package:medic_petcare/Widgets/TextWidget.dart';
import 'package:shimmer/shimmer.dart';

class InputWidget extends StatefulWidget {
  final String specialRules, title, hintText;
  final Widget? iconLeft, iconRight;
  final bool enable,
      readonly,
      obscure,
      showShadow,
      isSearch,
      loading,
      autoFocus;
  final TextInputType? type;
  final TextEditingController? controller;
  final String errText, typeInput;
  final Color? readOnlyColorCustom, colorTextError;
  final void Function()? onPress;
  final void Function(String)? onChanged;
  final String border, customTypeText;
  final double? inputHeight, inputWidth;
  final int? maxChar;
  final EdgeInsets? parentPadding, inputPadding, titleMargin;

  const InputWidget({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.errText = "",
    this.typeInput = "input",
    this.obscure = false,
    this.iconLeft,
    this.iconRight,
    this.type = TextInputType.text,
    this.enable = true,
    this.readonly = false,
    this.onPress,
    this.onChanged,
    this.readOnlyColorCustom,
    this.border = 'all',
    this.inputWidth,
    this.inputHeight = 56,
    this.inputPadding,
    this.parentPadding,
    this.showShadow = true,
    this.titleMargin,
    this.maxChar = 50,
    this.colorTextError,
    this.customTypeText = 'b1',
    this.specialRules = 'specialCharacter',
    this.isSearch = false,
    this.loading = false,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

class _InputWidgetState extends State<InputWidget> {
  bool isFocus = false, obscure = true;
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocus = _focus.hasFocus;
    });
  }

  _borderInput() {
    Border inputBorder;
    Color defaultColor =
        isFocus && !widget.readonly ? primaryColor : borderColor;

    switch (widget.border.toLowerCase()) {
      case 'none':
        inputBorder = Border.all(
          color: Colors.transparent,
        );
        break;

      case 'bottom':
        inputBorder = Border(
          bottom: BorderSide(
            color: defaultColor,
          ),
        );
        break;

      default:
        inputBorder = Border.all(
          color: defaultColor,
        );
    }

    return inputBorder;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }

  List<TextInputFormatter> get specialRules {
    var tmpRules = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(widget.maxChar)
    ];

    switch (widget.specialRules) {
      case 'onlyAlphabet':
        tmpRules.add(FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")));
        break;
      case 'onlyNIK':
        tmpRules = [];
        tmpRules.add(LengthLimitingTextInputFormatter(16));
        tmpRules.add(FilteringTextInputFormatter.digitsOnly);
        tmpRules.add(
          FilteringTextInputFormatter.deny(
            RegExp(r'^0+'),
          ),
        );
        break;
      case 'onlyNumber':
        tmpRules = [];
        tmpRules.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 'onlyPassport':
        tmpRules = [];
        tmpRules.add(LengthLimitingTextInputFormatter(10));
        tmpRules.add(FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")));
        break;
      case 'onlyAlphaNumeric':
        tmpRules.add(FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")));
        break;
      case 'allowPassword':
        // tmpRules.add(FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")));
        tmpRules.add(FilteringTextInputFormatter.deny(
            RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])$')));
        break;
      case 'specialCharacter':
        tmpRules.add(
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 .,@-_]")),
        );

        break;
      default:
    }
    if (!widget.obscure && !widget.title.contains('email')) {
      tmpRules.add(UpperCaseTextFormatter());
    }
    return tmpRules;
  }

  @override
  Widget build(BuildContext context) {
    return widget.enable
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title == 'hidden'
                  ? Container()
                  : Container(
                      margin: widget.titleMargin ??
                          EdgeInsets.only(
                            top: defaultMargin,
                          ),
                      child: TextWidget(
                        label: widget.title,
                        type: 'l1',
                        color: fontSecondaryColor,
                      ),
                    ),
              Container(
                width: widget.inputWidth ?? double.infinity,
                height: widget.inputHeight,
                padding: widget.parentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 0,
                    ),
                margin: EdgeInsets.only(
                  top: widget.title == 'hidden' ? 0 : 4,
                ),
                decoration: BoxDecoration(
                  color: widget.readonly == true
                      ? (widget.readOnlyColorCustom ?? backgroundColor)
                      : whiteColor,
                  borderRadius: widget.border == 'all'
                      ? BorderRadius.circular(defaultBorderRadius)
                      : null,
                  border: _borderInput(),
                  boxShadow: widget.showShadow
                      ? [
                          BoxShadow(
                            // ignore: dead_code
                            color: Colors.grey.withOpacity(
                                isFocus && !widget.readonly ? 0.5 : 0),
                            spreadRadius: 1,
                            blurRadius: defaultBorderRadius,
                            offset: const Offset(
                                -4, 6), // changes position of shadow
                          ),
                        ]
                      : null,
                ),
                child: IntrinsicWidth(
                  child: TextFormField(
                    focusNode: _focus,
                    autofocus: widget.autoFocus,
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: widget.obscure ? obscure : widget.obscure,
                    controller: widget.controller,
                    onTap: widget.onPress,
                    onChanged: widget.onChanged,
                    inputFormatters: specialRules,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: widget.iconLeft,
                      hintText: widget.hintText,
                      contentPadding: widget.inputPadding ??
                          const EdgeInsets.symmetric(
                            vertical: 11,
                          ),
                      suffixIcon: widget.obscure
                          ? GestureDetector(
                              onTap: () => setState(
                                () {
                                  obscure = !obscure;
                                },
                              ),
                              child: Icon(
                                obscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color:
                                    isFocus ? primaryColor : fontSecondaryColor,
                                size: 20,
                              ),
                            )
                          : widget.iconRight,
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 22),
                      suffixIconColor: primaryColor,
                      prefixIconColor: primaryColor,
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 22),
                      fillColor: Colors.red,
                    ),
                    keyboardType: widget.type,
                    readOnly: widget.readonly,
                    style: TextStyle(
                      fontSize: 14,
                      color: fontPrimaryColor,
                    ),
                  ),
                ),
              ),
              widget.errText != ""
                  ? Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: TextWidget(
                        label: widget.errText,
                        type: 'l1',
                        color: widget.colorTextError ?? redColor,
                      ),
                    )
                  : const SizedBox()
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                label: widget.title,
                type: 'l1',
                color: fontSecondaryColor,
              ),
              const SizedBox(
                height: 8,
              ),
              widget.loading
                  ? Shimmer.fromColors(
                      baseColor: fontGreyColor2.withAlpha(200),
                      highlightColor: whiteColor,
                      enabled: true,
                      loop: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: fontGreyColor2,
                          borderRadius: BorderRadius.circular(
                            defaultBorderRadius,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          top: 4,
                        ),
                        height: 20,
                        width: 125,
                      ),
                    )
                  : TextWidget(
                      label: widget.hintText,
                      type: widget.customTypeText,
                      weight: 'medium',
                      color: fontPrimaryColor,
                    ),
            ],
          );
  }
}
