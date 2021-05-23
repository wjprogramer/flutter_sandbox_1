import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/core/page_type.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/database/database.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MaintainTodoPage extends StatefulWidget {
  final PageType pageType;
  final Category category;
  final TodoEntry? todoEntry;

  MaintainTodoPage({
    this.pageType = PageType.readOnly,
    required this.category,
    this.todoEntry,
  });

  @override
  _MaintainTodoPageState createState() => _MaintainTodoPageState();
}

class _MaintainTodoPageState extends State<MaintainTodoPage> {
  late PageType _pageType;

  late Category _category;
  TodoEntry? _todoEntry;

  final _db = MyDatabase();
  late TextEditingController _contentController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageType = widget.pageType;
    _category = widget.category;
    _todoEntry = widget.todoEntry;
    if (_todoEntry == null) {
      _pageType = PageType.create;
    }

    _contentController = TextEditingController(
      text: _todoEntry?.content,
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
            Text('Content'),
            TextFormField(
              controller: _contentController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Content is required';
                }
              },
            ),
            SizedBox(height: 8,),
            Text('Category'),
            Container(
              color: Colors.grey[200],
              child: TextFormField(
                enabled: false,
                initialValue: _category.description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                },
              ),
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
        return Text('Create TODO');
      case PageType.update:
      case PageType.readOnly:
        return Text('Update TODO: ${category?.description ?? ''}');
    }
  }

  Future _onSubmit() async {
    if (_pageType == PageType.readOnly) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      final content = _contentController.text;
      final companion = TodosCompanion(
        content: Value(content),
        category: Value(_category.id),
        targetDate: Value(DateTime.now()),
      );

      if (_pageType == PageType.create) {
        _createTodo(companion);
      } else if (_pageType == PageType.update && _todoEntry != null) {
        _updateTodo(_todoEntry!);
      }
    }
  }

  Future _createTodo(TodosCompanion todosCompanion) async {
    _db.createEntry(todosCompanion);
    Navigator.of(context).pop();
  }

  Future _updateTodo(TodoEntry todoEntry) async {
    _db.updateEntry(todoEntry);
    Navigator.of(context).pop();
  }

}
