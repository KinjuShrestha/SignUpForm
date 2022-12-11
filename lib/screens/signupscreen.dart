import 'package:flutter/material.dart';
import 'package:signup/validators/validaot.dart';
import 'package:signup/widegts/reusbale.dart';
//import 'package:signup/widegts/reusbale.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required String title}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //keys
  final GlobalKey<FormState> _formKey = GlobalKey();

  //controllers
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController mnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Form"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 209, 153, 252),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Imagee("assets/image/1.jpg"),
              SizedBox(height: 15),
              firstName(),
              SizedBox(height: 10),
              lastName(),
              SizedBox(height: 10),
              middleName(),
              SizedBox(height: 10),
              email(),
              SizedBox(height: 10),
              phoneNumber(),
              SizedBox(height: 10),
              password(),
              SizedBox(height: 10),
              Row(
                children: [
                  LabelText(label: "Gender", size: 16),
                  SizedBox(
                    height: 5,
                  ),
                  addRadioButton(0, 'Male'),
                  addRadioButton(1, 'Female'),
                  addRadioButton(2, 'Others'),
                ],
              ),
              SizedBox(height: 10),
              LabelText(label: "Hobbies", size: 16),
              checkBox(),
              SizedBox(height: 10),
              message(),
              SizedBox(height: 10),
              SignUpButton()
            ],
          ),
        ),
      )),
    );
  }

  List gender = ["Male", "Female", "Other"];
  String? select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.deepPurple,
          focusColor: Colors.deepPurple,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (dynamic value) {
            setState(() {
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  checkBox() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: checkBoxOptions.keys.map((String key) {
        return CheckboxListTile(
          tristate: true,
          activeColor: Colors.deepPurple,
          title: Text(key),
          value: checkBoxOptions[key],
          onChanged: (bool? value) {
            setState(() {
              checkBoxOptions[key] = value;
            });
          },
        );
      }).toList(),
    );
  }

  BuildField firstName() {
    return BuildField(
        hintText: "First Name",
        keyboardType: TextInputType.name,
        controller: fnameController,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value.isEmpty) {
            return 'First Name cannot be empty';
          } else
            null;
        });
  }

  BuildField lastName() {
    return BuildField(
        hintText: "Last Name",
        keyboardType: TextInputType.name,
        controller: lnameController,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value.isEmpty) {
            return 'Last Name cannot be empty';
          } else
            null;
        });
  }

  BuildField middleName() {
    return BuildField(
      hintText: "Middle Name",
      keyboardType: TextInputType.name,
      controller: mnameController,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'If you do not have middle name, leave a - hypen sign';
        } else
          null;
      },
    );
  }

  BuildField email() {
    return BuildField(
        hintText: "Email",
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value.isEmpty) {
            return 'Email cannot be empty';
          } else
            null;
        });
  }

  BuildField password() {
    return BuildField(
      hintText: "Password",
      keyboardType: TextInputType.name,
      controller: passwordController,
      obscureText: true,
      maxLines: 1,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Password cannot be empty';
        } else if (value.length < 6) {
          return 'Password should be atleast 6 digits!';
        } else
          null;
      },
    );
  }

  BuildField phoneNumber() {
    return BuildField(
        hintText: "Phone Number",
        keyboardType: TextInputType.phone,
        controller: phoneController,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value.isEmpty) {
            return 'Phone number cannot be empty';
          } else if (value.length != 10) {
            return 'Phone number should be 10 digits!';
          } else
            null;
        });
  }

  BuildField message() {
    return BuildField(
      hintText: "Short description about yourself ",
      keyboardType: TextInputType.name,
      controller: messageController,
      inputAction: TextInputAction.next,
      minLines: 10,
      validator: (value) {
        if (value.isEmpty) {
          return 'The field cannot be empty';
        } else if (value.length < 200) {
          return 'The description should be atleast 200 words.';
        } else
          null;
      },
    );
  }

  SignUpButton() {
    return Button(
      text: "Submit",
      size: 16,
      onPressed: () async {
        FocusScope.of(context).unfocus();
        if (!_formKey.currentState!.validate()) {
          return errorMessage('Fill Form Properly', context);
        } else {
          return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Successful'),
            duration: Duration(seconds: 2),
          ));
        }
      },
    );
  }
}



// List gender = ["Male", "Female", "Other"];
// String? select;

// Row addRadioButton(int btnValue, String title) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[
//       Radio(
//         activeColor: Colors.red,
//         focusColor: Colors.deepPurple,
//         value: gender[btnValue],
//         groupValue: select,
//         onChanged: (dynamic value) {
//           setState(() {
//             select = value;
//           });
//         },
//       ),
//       Text(title)
//     ],
//   );
// }
