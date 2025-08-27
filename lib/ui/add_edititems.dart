import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/widgets/akili_btn.dart';
import 'package:file_picker/file_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AddEditItems extends StatelessWidget {
  const AddEditItems({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Akili Quotes to Inspire Someone'),
        backgroundColor: Color.fromRGBO(253, 94, 0, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderField(
                name: 'image',
                builder: (FormFieldState<dynamic> field) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Image',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          field.value != null
                              ? field.value.names.join(', ')
                              : 'No file selected',
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.image,
                              allowedExtensions: ['jpg', 'jpeg', 'png'],
                              allowMultiple: false,
                            );
                            field.didChange(result);
                          },
                          child: Text('Select Image'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              FormBuilderTextField(
                name: 'title',
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              FormBuilderTextField(
                name: 'description',
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 24.0),
              AkiliButton(
                text: 'Save',
                onPressed: () async {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    // Do something with the form data
                    var image =
                        _formKey.currentState?.value['image']
                            as FilePickerResult?;
                    var title = _formKey.currentState?.value['title'];
                    var description =
                        _formKey.currentState?.value['description'];
                    var quotes = ParseObject('Quotes');
                    quotes.set('image', image);
                    quotes.set('title', title);
                    quotes.set('description', description);
                    await quotes.save();

                    Get.snackbar('Success', 'Quote saved successfully');
                    Get.close(1);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
