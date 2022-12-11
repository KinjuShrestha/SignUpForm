import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  LabelText({
    Key? key,
    required this.label,
    this.color = Colors.black,
    this.weight = FontWeight.w500,
    this.maxLine,
    this.overflow,
    this.align,
    required this.size,
  });
  final String label;
  final Color color;
  final FontWeight? weight;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextAlign? align;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontFamily: "San Francisco UI Display",
        fontSize: size,
        fontWeight: weight,
      ),
      maxLines: maxLine,
      textAlign: align,
    );
  }
}

//TextFormField

// ignore: must_be_immutable
class MakeField extends StatefulWidget {
  MakeField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.validator,
    required this.keyboardType,
    required this.controller,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.textAction = TextInputAction.next,
    // required this.textlabel,
    // required this.textsize,
    this.floatingType,
    required TextInputAction inputAction,
  }) : super(key: key);

  final String? hintText;
  final Function? onChanged;
  final TextInputType keyboardType;
  bool obscureText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final validator;
  final TextInputAction textAction;
  // final String textlabel;
  // final double textsize;

  final FloatingLabelBehavior? floatingType;

  // ignore: prefer_typing_uninitialized_variables

  @override
  _MakeFieldState createState() => _MakeFieldState();
}

class _MakeFieldState extends State<MakeField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged as void Function(String)?,
      textInputAction: widget.textAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hoverColor: const Color(0xFF00AE4D),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.all(20),
        focusColor: const Color(0xFF00AE4D),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        fillColor: const Color(0xFF00AE4D),
      ),

      // readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(_focusNode);
        });
      },
    );
  }
}

//TextFormField

// ignore: must_be_immutable
class BuildField extends StatefulWidget {
  BuildField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.validator,
    required this.keyboardType,
    required this.controller,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.textAction = TextInputAction.next,
    // required this.textlabel,
    // required this.textsize,
    this.floatingType,
    required TextInputAction inputAction,
  }) : super(key: key);

  final String? hintText;
  final Function? onChanged;
  final TextInputType keyboardType;
  bool obscureText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final validator;
  final TextInputAction textAction;
  // final String textlabel;
  // final double textsize;

  final FloatingLabelBehavior? floatingType;

  // ignore: prefer_typing_uninitialized_variables

  @override
  _BuildFieldState createState() => _BuildFieldState();
}

class _BuildFieldState extends State<BuildField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged as void Function(String)?,
      textInputAction: widget.textAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hoverColor: const Color(0xFF00AE4D),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.all(20),
        focusColor: const Color(0xFF00AE4D),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        fillColor: const Color(0xFF00AE4D),
      ),

      // readOnly: widget.readOnly,
      // keyboardType: widget.keyboardType,
      // onTap: () {
      //   setState(() {
      //     FocusScope.of(context).requestFocus(_focusNode);
      //   });
      // },
    );
  }
}

class Button extends StatefulWidget {
  Button({Key? key, required this.text, required this.size, this.onPressed});
  final String text;
  final double size;
  final Function? onPressed;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 209, 153, 252)),
      child: ElevatedButton(
        onPressed: widget.onPressed as void Function()?,
        child: LabelText(
          label: widget.text,
          size: widget.size,
        ),
      ),
    );
  }
}

//map
Map<String, dynamic> checkBoxOptions = {
  'Writing': false,
  'Reading Books': false,
  'Football': false,
  'Travelling': false,
  'Dancing': false,
  'Singing ': false,
  'Pottery': false,
};

Widget errorMessage(String? message, BuildContext context) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (message != null && message.isNotEmpty) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: SingleChildScrollView(child: Text(message)),
            actions: <Widget>[
              Builder(builder: (BuildContext outerContext) {
                return TextButton(
                  child: const Text(
                    'Okay',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.of(outerContext).pop();
                  },
                );
              }),
            ],
          );
        },
      );
    }
  });

  return const SizedBox.shrink();
}

Widget Imagee(String url) {
  return CircleAvatar(
    radius: 40,
    backgroundImage: AssetImage(url),
    // child: Image.asset(
    //   url,
    //   fit: BoxFit.cover,
    // )
  );
}
