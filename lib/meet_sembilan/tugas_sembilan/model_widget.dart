import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/constant/app_image.dart';
import 'package:ppkdjp_flutter/meet_sembilan/tugas_sembilan/model/product_model.dart';

class ModelWidget extends StatefulWidget {
  const ModelWidget({super.key});

  @override
  State<ModelWidget> createState() => _ModelWidgetState();
}

class _ModelWidgetState extends State<ModelWidget> {
  final List<ProductModel> dataProduct = [
    ProductModel(
      id: "1",
      productName: "Teh Botol Sosro",
      productPrice: "Rp 5.000",
      productImage: AppImage.tehBotol,
      productDescription:
          "Teh manis siap minum yang menyegarkan, cocok untuk segala suasana.",
    ),
    ProductModel(
      id: "2",
      productName: "Aqua 600ml",
      productPrice: "Rp 3.000",
      productImage: AppImage.aqua,
      productDescription:
          "Air mineral murni yang baik untuk menjaga hidrasi tubuh.",
    ),
    ProductModel(
      id: "3",
      productName: "Coca-Cola Kaleng",
      productPrice: "Rp 7.000",
      productImage: AppImage.cocaCola,
      productDescription: "Minuman soda dengan rasa khas yang menyegarkan.",
    ),
    ProductModel(
      id: "4",
      productName: "Pocari Sweat",
      productPrice: "Rp 8.500",
      productImage: AppImage.pocari,
      productDescription:
          "Minuman isotonik untuk menggantikan ion tubuh yang hilang.",
    ),
    ProductModel(
      id: "5",
      productName: "Fruit Tea Blackcurrant",
      productPrice: "Rp 6.000",
      productImage: AppImage.fruitTea,
      productDescription: "Teh rasa buah blackcurrant yang manis dan segar.",
    ),
    ProductModel(
      id: "6",
      productName: "Kopi Good Day Mocacinno",
      productPrice: "Rp 5.500",
      productImage: AppImage.goodDay,
      productDescription:
          "Kopi instan dengan rasa moka yang creamy dan nikmat.",
    ),
    ProductModel(
      id: "7",
      productName: "Ultra Milk Coklat",
      productPrice: "Rp 5.000",
      productImage: AppImage.ultraMilk,
      productDescription:
          "Susu UHT rasa coklat, bergizi dan cocok untuk anak-anak.",
    ),
    ProductModel(
      id: "8",
      productName: "You C1000 Orange",
      productPrice: "Rp 9.000",
      productImage: AppImage.youC1000,
      productDescription:
          "Minuman vitamin C rasa jeruk untuk menjaga daya tahan tubuh.",
    ),
    ProductModel(
      id: "9",
      productName: "Mizone Lychee Lemon",
      productPrice: "Rp 8.000",
      productImage: AppImage.mizone,
      productDescription:
          "Minuman ringan dengan rasa leci dan lemon, menyegarkan dan sehat.",
    ),
    ProductModel(
      id: "10",
      productName: "Le Minerale 1500ml",
      productPrice: "Rp 4.000",
      productImage: AppImage.leMinerale,
      productDescription:
          "Air mineral alami dengan rasa segar dan kemasan higienis.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Search products...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black54),
          ),
          style: TextStyle(color: Colors.black),
          onChanged: (value) {
            // Handle search logic here (filtering the products based on the input)
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title: Minuman
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Minuman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Product list
          Expanded(
            child: ListView.builder(
              itemCount: dataProduct.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final product = dataProduct[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product.productImage ?? AppImage.placeholder,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),

                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.productName ?? 'Produk Tanpa Nama',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              product.productPrice ?? 'Rp -',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
