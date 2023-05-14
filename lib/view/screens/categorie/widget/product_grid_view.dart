import '/index.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.model, required this.onTap});
  final ItemsModel model;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) { 
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            color: AppColors.cardColor2,
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.height),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  productImage(
                    model.image,
                    fit: BoxFit.fitHeight,
                    // "https://m.media-amazon.com/images/I/71zOaQmhBPL._AC_UL480_QL65_.jpg",
                    favTap: () {},
                  ),
                  Divider(height: 1.height),
                  productCardBody(
                    name: translateDatabase(
                      model.nameAr!,
                      model.name!,
                    ),
                    // "Samsung Galaxy A13 LTE Smartphone, Android OS, 128 GB, 4 GB RAM, Dual Sim, Light Blue",
                    onTap: () {},
                    pric: "${int.parse(model.price!)}",
                    oldPric: "${int.parse(model.price!) + 266}",
                  )
                ],
              ),
            ),
          ),
        ),
        discontPositined(dic: "${int.parse(model.discount!)}")
      ],
    );
  }
}
