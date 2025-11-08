import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_12th_kit/widgets/left_drawer.dart';

class ProductsFormPage extends StatefulWidget {
  const ProductsFormPage({super.key});

  @override
  State<ProductsFormPage> createState() => _ProductsFormPageState();
}

class _ProductsFormPageState extends State<ProductsFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "club_home";
  bool _isFeatured = false;
  int _stock = 0;
  String _brand = "";
  String _league = "";
  String _team = "";
  String _season = "";

  final Map<String, String> _categories = const {
    'club_home': 'Club • Home',
    'club_away': 'Club • Away',
    'club_third': 'Club • Third',
    'club_gk': 'Club • Goalkeeper',
    'club_special': 'Club • Special/Anniv',
    'national_home': 'National • Home',
    'national_away': 'National • Away',
    'national_third': 'National • Third',
    'national_gk': 'National • Goalkeeper',
    'national_special': 'National • Special/Anniv',
    'retro': 'Retro/Classic',
    'limited': 'Limited Edition',
  };

  bool _isValidUrl(String url) {
    if (url.isEmpty) return true;
    final uri = Uri.tryParse(url);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  String? _validateNonEmpty(String? v, {int? maxLen, String field = "Field"}) {
    if (v == null || v.trim().isEmpty) return "$field tidak boleh kosong!";
    if (maxLen != null && v.length > maxLen) {
      return "$field maksimal $maxLen karakter";
    }
    return null;
  }

  String? _validateOptionalMaxLen(String? v, int maxLen, String field) {
    if (v == null || v.isEmpty) return null;
    if (v.length > maxLen) return "$field maksimal $maxLen karakter";
    return null;
  }

  String? _validateIntNonNeg(String? v, String field) {
    if (v == null || v.trim().isEmpty) return "$field tidak boleh kosong!";
    final parsed = int.tryParse(v);
    if (parsed == null) return "$field harus berupa angka bulat";
    if (parsed < 0) return "$field tidak boleh bernilai negatif";
    return null;
  }

  String? _validateSeason(String? v) {
    if (v == null || v.isEmpty) return null;
    if (v.length > 9) return "Season maksimal 9 karakter";
    final reg = RegExp(r'^\d{4}/\d{2}$');
    if (!reg.hasMatch(v)) {
      return "Format season gunakan YYYY/YY (mis. 2024/25)";
    }
    return null;
  }

  void _resetForm() {
    setState(() {
      _name = "";
      _price = 0;
      _description = "";
      _thumbnail = "";
      _category = "club_home";
      _isFeatured = false;
      _stock = 0;
      _brand = "";
      _league = "";
      _team = "";
      _season = "";
    });
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Tambah Produk')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Name (CharField max_length=255) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Nama produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _name = v,
                  validator: (v) =>
                      _validateNonEmpty(v, maxLen: 255, field: "Name"),
                ),
              ),

              // === Price (IntegerField, non-negative) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: "Price",
                    hintText: "Harga (angka)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _price = int.tryParse(v) ?? 0,
                  validator: (v) => _validateIntNonNeg(v, "Price"),
                ),
              ),

              // === Description (TextField, wajib) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Description",
                    hintText: "Deskripsi produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _description = v,
                  validator: (v) =>
                      _validateNonEmpty(v, field: "Description"),
                ),
              ),

              // === Thumbnail (URLField optional; jika diisi harus URL valid) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Thumbnail (URL)",
                    hintText: "https://contoh.com/gambar.jpg",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _thumbnail = v,
                  validator: (v) =>
                      (v != null && v.isNotEmpty && !_isValidUrl(v))
                          ? "URL thumbnail tidak valid (gunakan http/https)"
                          : null,
                ),
              ),

              // === Category (choices, default club_home) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.key, child: Text(e.value)))
                      .toList(),
                  onChanged: (v) => setState(() => _category = v ?? "club_home"),
                ),
              ),

              // === Is Featured (BooleanField) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Featured"),
                  value: _isFeatured,
                  onChanged: (v) => setState(() => _isFeatured = v),
                ),
              ),

              // === Stock (PositiveIntegerField, non-negative) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: "Stock",
                    hintText: "Jumlah stok (>= 0)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _stock = int.tryParse(v) ?? 0,
                  validator: (v) => _validateIntNonNeg(v, "Stock"),
                ),
              ),

              // === Brand (CharField optional <=100) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Brand",
                    hintText: "Contoh: Nike, Adidas (opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _brand = v,
                  validator: (v) => _validateOptionalMaxLen(v, 100, "Brand"),
                ),
              ),

              // === League (CharField optional <=100) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "League",
                    hintText: "Contoh: Premier League (opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _league = v,
                  validator: (v) => _validateOptionalMaxLen(v, 100, "League"),
                ),
              ),

              // === Team (CharField optional <=100) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Team",
                    hintText: "Contoh: Manchester City (opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _team = v,
                  validator: (v) => _validateOptionalMaxLen(v, 100, "Team"),
                ),
              ),

              // === Season (CharField optional <=9; contoh 2024/25) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Season",
                    hintText: "Contoh: 2024/25 (opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => _season = v,
                  validator: _validateSeason,
                ),
              ),

              // === Tombol Save ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil disimpan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Description: $_description'),
                                    Text('Thumbnail: ${_thumbnail.isEmpty ? "-" : _thumbnail}'),
                                    Text('Category: ${_categories[_category]}'),
                                    Text('Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
                                    Text('Stock: $_stock'),
                                    Text('Brand: ${_brand.isEmpty ? "-" : _brand}'),
                                    Text('League: ${_league.isEmpty ? "-" : _league}'),
                                    Text('Team: ${_team.isEmpty ? "-" : _team}'),
                                    Text('Season: ${_season.isEmpty ? "-" : _season}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _resetForm();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
