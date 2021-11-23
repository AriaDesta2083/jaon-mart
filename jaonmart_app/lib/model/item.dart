class Items {
  int id, qty, harga;
  String produk, nama, dekskripsi, gambar;

  Items(
      {required this.id,
      required this.qty,
      required this.nama,
      required this.produk,
      required this.gambar,
      required this.harga,
      required this.dekskripsi});

  static List<Items> getItems() {
    return <Items>[
      Items(
          id: 1,
          qty: 0,
          nama: 'Nama Item 1',
          produk: 'Nama Produk 1',
          harga: 10000,
          gambar: 'item1.jpg',
          dekskripsi:
              'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
      Items(
          id: 2,
          qty: 0,
          nama: 'Nama Item 2',
          produk: 'Nama Produk 2',
          harga: 20000,
          gambar: 'item2.jpg',
          dekskripsi:
              'Ipsum dolor sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
      Items(
          id: 3,
          qty: 0,
          nama: 'Nama Item 3',
          produk: 'Nama Produk 3',
          harga: 30000,
          gambar: 'item3.jpg',
          dekskripsi:
              'Dolor sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
      Items(
          id: 4,
          qty: 0,
          nama: 'Nama Item 4',
          produk: 'Nama Produk 4',
          harga: 40000,
          gambar: 'item4.jpg',
          dekskripsi:
              'Sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
    ];
  }
}
