import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.grey.shade50,
        ),
        iconTheme: IconThemeData(
          size: 30,
          color: Colors.deepPurple,
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        title:  Text("Feedback",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade600,
        ),),
      ),
      body: AlertDialog(
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Enter your feedback here',
              filled: true,
            ),
            maxLines: 5,
            maxLength: 4096,
            textInputAction: TextInputAction.done,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Send'),
            onPressed: () async {
              // Only if the input form is valid (the user has entered text)
              if (_formKey.currentState!.validate()) {
                // We will use this var to show the result
                // of this operation to the user
                String message;
    
                try {
                  // Get a reference to the `feedback` collection
                  final collection =
                      FirebaseFirestore.instance.collection('feedback');
    
                  // Write the server's timestamp and the user's feedback
                  await collection.doc().set({
                    'timestamp': FieldValue.serverTimestamp(),
                    'feedback': _controller.text,
                  });
    
                  message = 'Feedback sent successfully';
                } catch (e) {
                  message = 'Error when sending feedback';
                }
    
                // Show a snackbar with the result
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}