import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reco_app/index.dart';
import 'package:reco_app/providers/appData.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _messageController = new TextEditingController();

    final appDataProvider = Provider.of<AppData>(context, listen: false);
    void saveFeedback() {
      final bool isValid = EmailValidator.validate(_emailController.text);
      if (_emailController.text.isEmpty || _messageController.text.isEmpty) {
        buildShowToast("Email and Feedback Required");
      } else if (isValid == false) {
        buildShowToast("Invalid Email");
      } else {
        appDataProvider
            .insertFeedback(
                email: _emailController.text, feedback: _messageController.text)
            .then((x) {
          buildShowToast(x);
        });
        setState(() {
          _emailController.clear();
          _messageController.clear();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Send Feedback'),
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  saveFeedback();
                });
          }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-Mail'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: _messageController,
                maxLines: 10,
                decoration: InputDecoration.collapsed(
                    hintText: "Enter your feedback here"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> buildShowToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
