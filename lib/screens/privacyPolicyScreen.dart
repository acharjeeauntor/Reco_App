import 'package:recoapp/index.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Privacy Policy Of the Application',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean"
                " commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis "
                "parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu"
                ", pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, "
                "fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus "
                "ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis\n\n"
                " pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean "
                "vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, "
                "enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra "
                "nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel"
                " augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. "
                "Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, "
                "sit amet adipiscing sem neque sed ipsum. Nam quam nunc,\n\n blandit vel, luctus "
                "pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. "
                "Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit"
                " amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit "
                "amet nibh. Donec sodales sagittis magna."
                " Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
