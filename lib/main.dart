import 'package:c_uis/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(ContactUs());
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Us',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: darkGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactBody(),
    );
  }
}

class ContactBody extends StatelessWidget {
  ContactBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Stack(
      children: [
        Scaffold(
          backgroundColor: darkGrey,
          // appBar: AppBar(backgroundColor: black),
          appBar: PreferredSize(
            child: Container(color: black),
            preferredSize: Size(double.infinity, 30),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  color: black.withOpacity(.5),
                  child: Align(
                    alignment: Alignment(-.7, .8),
                    child: Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: white,
                          ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Address(),
                      Contacts(),
                      Socials(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(.95, -1.0),
          child: FractionallySizedBox(
            heightFactor: .8,
            child: SizedBox(
              width: 450,
              child: Card(
                color: white,
                margin: EdgeInsets.zero,
                elevation: 16,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormText(text: 'FEEDBACK FORM'),
                      SizedBox(height: 35),
                      // Spacer(flex: 4),
                      FormTextField(hint: 'Name'),
                      FormTextField(hint: 'E-mail'),
                      FormTextField(hint: 'Phone'),
                      FormTextField(hint: 'Message'),
                      SizedBox(height: 30),
                      FormBottom(),

                      Spacer(),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'The C APPS TEAM 2021',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required this.hint,
  }) : super(key: key);
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormText(text: hint),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormBottom extends StatelessWidget {
  const FormBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          icon: Icon(
            CupertinoIcons.cloud_upload,
            color: black,
          ),
          onPressed: () {},
          label: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Upload File'),
          ),
          style: TextButton.styleFrom(
            primary: black,
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment(2, 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('SEND MESSAGE'),
              ),
              style: TextButton.styleFrom(
                // primary: black,
                primary: white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FormText extends StatelessWidget {
  const FormText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: black,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

class Socials extends StatelessWidget {
  const Socials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(flex: 3),
          Title(text: 'FOLLOW US!'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Socialcon(icon: Icons.facebook_rounded),
              Socialcon(icon: CupertinoIcons.hand_thumbsup_fill),
              Socialcon(icon: Icons.subscriptions),
              Socialcon(icon: Icons.verified_rounded),
              Text(
                '@capps_team',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: white),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class Socialcon extends StatelessWidget {
  const Socialcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: white,
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Title(text: 'OUR CONTACTS'),
          TextIcon(
            text: 'capps096team@gmail.com',
            icon: CupertinoIcons.mail_solid,
          ),
          TextIcon(
            text: '+256 780955031',
            icon: CupertinoIcons.phone_fill,
          ),
        ],
      ),
    );
  }
}

class Address extends StatelessWidget {
  const Address({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Title(text: 'OUR ADDRESS'),
          TextIcon(
            text: '1 C APPS WAY',
            icon: Icons.location_on,
          ),
          TextIcon(
            text: 'The Cephas Universe',
            icon: Icons.share_location,
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class TextIcon extends StatelessWidget {
  const TextIcon({
    Key? key,
    required this.text,
    required this.icon,
    this.color,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? backgroundColor,
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: color ?? backgroundColor),
          ),
        ],
      ),
    );
  }
}
