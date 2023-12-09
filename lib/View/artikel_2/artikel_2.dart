import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';

class Artikel2 extends StatefulWidget {
  final ArtikelModel model;
  const Artikel2({super.key, required this.model});

  @override
  State<Artikel2> createState() => _Artikel2State();
}

class _Artikel2State extends State<Artikel2> {
  @override
  Widget build(BuildContext context) {
    // TODO: kalo halaman artikel 1 udah pake model, ini di uncommment
    // final ArtikelModel model = ModalRoute.of(context)!.settings.arguments as ArtikelModel;

    // TODO: kalo halaman artikel 1 udah pake model, ini dihapus atau dicomment
    // final ArtikelModel model = DummyArtikel.artikelUntukmu;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Artikel"),
        backgroundColor: const Color(0XFFFDCEDF),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.model.title),
            Row(
              children: [
                Text(widget.model.author.name),
                Text(widget.model.formatJam()),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.bookmark_outline),
                onPressed: () {},
              ),
            ),
            Image.network(widget.model.thumbnail),
            Content(model: widget.model),
          ],
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  final ArtikelModel model;
  const Content({super.key, required this.model});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late ArtikelModel _model;
  bool _loading = true;
  SortComments _sortComments = SortComments.terbaru;

  void fetchContent() async {
    setState(() => _loading = true);
    log("artikel_2.dart: fetching data...");
    final model = await context
        .read<ArtikelViewModel>()
        .fetchSingleArtikel(_model.id, _model.slug);

    log("artikel_2.dart: done fetching!");
    if (model != null) _model = model;
    _model.comments = widget.model.comments; // TODO: nnti dihapus
    setState(() => _loading = false);
  }

  @override
  void initState() {
    super.initState();
    _model = widget.model;
    fetchContent();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_loading ? "loading..." : _model.content ?? ""),
        Text("${_model.comments.length} Komentar"),
        const Divider(color: Colors.black, thickness: 1),
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://akcdn.detik.net.id/visual/2015/01/06/3145081d-6a92-4c32-a8d6-065203f5097c_169.jpg?w=400&q=90"),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Tulis komentar...",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              MaterialButton(
                onPressed: () =>
                    setState(() => _sortComments = SortComments.terbaru),
                child: Text(
                  "Terbaru",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: _sortComments == SortComments.terbaru
                        ? TextDecoration.underline
                        : null,
                    fontWeight: _sortComments == SortComments.terbaru
                        ? FontWeight.bold
                        : null,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () =>
                    setState(() => _sortComments = SortComments.terlama),
                child: Text(
                  "Terlama",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: _sortComments == SortComments.terlama
                        ? TextDecoration.underline
                        : null,
                    fontWeight: _sortComments == SortComments.terlama
                        ? FontWeight.bold
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
        CommentsListView(comments: _model.comments),
      ],
    );
  }
}

class CommentsListView extends StatelessWidget {
  final List<Comment> comments;
  const CommentsListView({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://akcdn.detik.net.id/visual/2015/01/06/3145081d-6a92-4c32-a8d6-065203f5097c_169.jpg?w=400&q=90"),
                ),
                Text(
                  comment.author.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  comment.formatJam(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(comment.content, softWrap: true, style: TextStyle(fontSize: 16)),
            CommentsListView(comments: comment.replies),
          ],
        );
      },
    );
  }
}

enum SortComments { terbaru, terlama }
