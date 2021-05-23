import 'package:flutter/material.dart';
import 'package:flutter_sandbox_1/core/page_type.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/database/database.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/pages/maintain_category_page.dart';
import 'package:flutter_sandbox_1/demo_collection/moor_demo_2/pages/maintain_todo_page.dart';
import 'package:flutter_sandbox_1/utilities/component_utility.dart';
import 'package:intl/intl.dart';

class MoorDemoPage2 extends StatefulWidget {
  @override
  _MoorDemoPage2State createState() => _MoorDemoPage2State();
}

class _MoorDemoPage2State extends State<MoorDemoPage2> {

  final _db = MyDatabase();

  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moor'),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: _title('Categories'),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => MaintainCategoryPage(
                      pageType: PageType.create,
                    ))
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: StreamBuilder(
                stream: _db.categoriesWithCount(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Column(
                    children: snapshot.data != null ? (snapshot.data as List)
                      .where((e) => e is CategoryWithCount)
                      .map((e) {
                        final categoryWithCount = e as CategoryWithCount;
                        final category = categoryWithCount.category;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: InkWell(
                            onTap: () {
                              if (category?.id != null && _selectedCategory?.id != category?.id) {
                                setState(() {
                                  _selectedCategory = category;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Opacity(
                                  opacity: _selectedCategory?.id == category?.id ? 1 : 0,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.blue
                                  ),
                                ),
                                SizedBox(width: 16,),
                                Expanded(
                                  child: Text(
                                    '${category?.description ?? '-'}  (${categoryWithCount.count})'
                                  ),
                                ),
                                if (category?.id != null)
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      if (category?.id != null) {
                                        _db.deleteCategory(category!);
                                      }
                                    },
                                  ),
                              ],
                            ),
                          ),
                        );
                      })
                      .toList() : [],
                  );
                  return Text('');
                },
              ),
            ),
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: _title('TODO'),
              ),
              if (_selectedCategory != null)
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => MaintainTodoPage(
                        pageType: PageType.create,
                        category: _selectedCategory!,
                      )
                    ));
                  },
                ),
            ],
          ),
          if (_selectedCategory == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(child: Text('Please select one category above')),
            ),
          if (_selectedCategory != null)
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Card(
                child: StreamBuilder<List<EntryWithCategory>>(
                  stream: _db.watchEntriesInCategory(_selectedCategory!),
                  builder: (BuildContext context, AsyncSnapshot<List<EntryWithCategory>> snapshot) {
                    print("snapshot $snapshot");
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.warning,
                                color: Colors.orange,
                                size: 40,
                              ),
                              SizedBox(height: 4),
                              Text('No any todo'),
                            ],
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: snapshot.data != null ? (snapshot.data as List)
                          .where((e) => e is EntryWithCategory)
                          .map((e) {
                            final entryWithCategory = e as EntryWithCategory;
                            final entry = entryWithCategory.entry;
                            final dateTime = entry.targetDate;
                            final displayDateTime = dateTime != null ? DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime) : '';
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        text: '${entry.content ?? '-'}\n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo[700],
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '($displayDateTime)',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ]
                                      )
                                    ),
                                  ),
                                  if (entryWithCategory.category?.id != null)
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        _db.deleteEntry(entry);
                                      },
                                    ),
                                ],
                              ),
                            );
                          })
                          .toList() : [],
                    );
                    return Text('');
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}
