import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:aws_project/widgets/login.dart';
import '../amplifyconfiguration.dart';



class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final  amplify=Amplify;
  bool  _amplifyConfigured=false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    final auth=AmplifyAuthCognito();
    final analytics=AmplifyAnalyticsPinpoint();
    try {
      amplify.addPlugin(auth);
      amplify.addPlugin(analytics);
      await amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured=true;
      });

    }  catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: _amplifyConfigured ? Login():CircularProgressIndicator(),

      ),
    );

  }
}