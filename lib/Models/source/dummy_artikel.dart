import '../artikel_model/artikel_model.dart';

class DummyArtikel {
  static ArtikelModel artikelUntukmu = ArtikelModel.fromJson({
    "id": 6,
    "title": "Our Digital Disillusionment and Hope Part 2",
    "thumbnail":
        "https://pub-86c5755f32914550adb162dd2b8850d0.r2.dev/articles/thumbnail/b4ddfa70-c49f-42d6-9056-80d4cf638dfc",
    "slug": "our-digital-disillusionment-and-hope-part-2",
    // "content":
    //     "We often find ourselves both the product and the serf of this system. While it might sound like a world filled with darkness and doom, that's not where we are, nor where we're headed. In fact, it seems like we'll, much like numerous times in history, manage to find a way out. We're rather adept at that.",
    "status": "PUBLISHED",
    "author": {"name": "admin adminA", "role": "admin"},
    "created_at": "29 Nov 2023 08:04:09",
    "updated_at": "04 Dec 2023 14:15:04",
    "published_at": "29 Nov 2023 08:04:09",
    "comments": [
      {
        "author": {"name": "Sherly Pramesyari", "role": "customer"},
        "content": "Semua penulis dalam daftar ini adalah fiktif dan digunakan untuk tujuan ilustrasi. Artikel-artikel ini mencakup berbagai topik yang relevan bagi wanita dalam berbagai aspek kehidupan mereka.",
        "likes": 32,
        "replies": [
          {
            "author": {"name": "Amanda Pratiwi", "role": "customer"},
            "content": "Dengan kategori-kategori ini, Anda dapat mencakup beragam topik dan minat pengguna dalam konten artikel Anda.",
            "likes": 32,
            "replies": [],
            "published_at": "29 Nov 2023 08:04:09",
          }
        ],
        "published_at": "29 Nov 2023 08:04:09"
      },
      {
        "author": {"name": "Dian Sutrisno", "role": "customer"},
        "content": "Dari 14 kategori yang telah dibuat sebelumnya, beberapa kategori yang cocok digunakan untuk artikel \"Wanita dan Teknologi: Menaklukkan Dunia Digital\"",
        "likes": 32,
        "replies": [],
        "published_at": "29 Nov 2023 08:04:09",
      }
    ],
  });
}
