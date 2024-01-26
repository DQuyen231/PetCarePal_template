import 'package:flutter/material.dart';
import 'package:petcarepal/screens/dashboard/components/news_list.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsList(),
    );
  }
}
