import 'package:reco_app/index.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Feedback'),
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Feedback save Successfully"),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          print("undo happend");
                        }),
                  ));
                });
          }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'E-Mail'),
              keyboardType: TextInputType.emailAddress,
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'Invalid email!';
                }
              },
            ),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
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
}
