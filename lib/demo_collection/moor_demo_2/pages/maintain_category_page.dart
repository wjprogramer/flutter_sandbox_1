import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/core/page_type.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/database/database.dart';

class MaintainCategoryPage extends StatefulWidget {
  final PageType pageType;
  final Category? category;

  MaintainCategoryPage({
    this.pageType = PageType.readOnly,
    this.category,
  });

  @override
  _MaintainCategoryPageState createState() => _MaintainCategoryPageState();
}

class _MaintainCategoryPageState extends State<MaintainCategoryPage> {
  late PageType _pageType;
  late Category? _category;

  final _db = MyDatabase();
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageType = widget.pageType;
    _category = widget.category;
    if (_category == null) {
      _pageType = PageType.create;
    }

    _descriptionController = TextEditingController(
      text: _category?.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getTitle(_pageType, _category),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          children: [
            SizedBox(height: 16,),
            Text('Description'),
            TextFormField(
              controller: _descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description is required';
                }
              },
            ),
            SizedBox(height: 16,),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _onSubmit,
                child: Text('Submit'),
              ),
            ),
          ].map((e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: e,
          )).toList(),
        ),
      ),
    );
  }

  Widget _getTitle(PageType pageType, Category? category) {
    switch(pageType) {
      case PageType.create:
        return Text('Create Category');
      case PageType.update:
      case PageType.readOnly:
        return Text('Update Category: ${category?.description ?? ''}');
    }
  }

  Future _onSubmit() async {
    if (_pageType == PageType.readOnly) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      final description = _descriptionController.text;
      if (_pageType == PageType.create) {
        _createCategory(description);
      } else if (_pageType == PageType.update && _category != null) {
        final newCategory = Category(
          id: _category!.id,
          description: description
        );
        _updateCategory(newCategory);
      }
    }
  }

  Future _createCategory(String description) async {
    _db.createCategory(description);
    Navigator.of(context).pop();
  }

  Future _updateCategory(Category category) async {
    _db.updateCategory(category);
    Navigator.of(context).pop();
  }

}
