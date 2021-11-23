class PackItems {
  int id, qty, harga;
  String produk, nama, dekskripsi, gambar;

  PackItems(
      {required this.id,
      required this.qty,
      required this.nama,
      required this.produk,
      required this.harga,
      required this.gambar,
      required this.dekskripsi});

  static List<PackItems> getItems() {
    return <PackItems>[
      PackItems(
          id: 1,
          qty: 0,
          nama: 'Nama Pack 1',
          produk: 'Nama Produk 1',
          harga: 100000,
          gambar: 'pack1.jpg',
          dekskripsi:
              'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
      PackItems(
          id: 2,
          qty: 0,
          nama: 'Nama Pack 2',
          produk: 'Nama Produk 2',
          harga: 200000,
          gambar: 'pack2.jpg',
          dekskripsi:
              'Ipsum dolor sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
      PackItems(
          id: 3,
          qty: 0,
          nama: 'Nama Pack 3',
          produk: 'Nama Produk 3',
          harga: 300000,
          gambar: 'pack3.jpg',
          dekskripsi:
              'Dolor sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
      PackItems(
          id: 4,
          qty: 0,
          nama: 'Nama Pack 4',
          produk: 'Nama Produk 4',
          harga: 400000,
          gambar: 'pack4.jpg',
          dekskripsi:
              'Sit amet consectetur adipisicing elit. Sequi alias nihil esse eum hic ab provident? Numquam incidunt adipisci eum.'),
    ];
  }
}
