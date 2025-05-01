import 'package:flutter/material.dart';

import '../../comman/widgets/base_appbar-widget.dart';
import '../../comman/widgets/base_text_widget.dart';
import '../user_details/widgets/user_details_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildAppBar('PROFILE'!),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              profileIconsAdnEditBtn('', null, () {}),
              reusableText("Vishwesh"),
              reusableText("Talimkar"),
            ],
          ),
        ),
      ),
    );
  }
}
