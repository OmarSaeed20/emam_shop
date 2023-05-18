import '../../../../index.dart';

SingleChildScrollView reviews() {
  return SingleChildScrollView(
    child: Container(
      height: 300.height,
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 203.height,
            width: double.infinity,
            padding: paddingOnly(right: 4),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => _comment(),
            ),
          ),
          titleRow(""),
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey150,
              // border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(6.height),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.asset(AppImages.user),
              ),
              // horizontalTitleGap: 0,
              title: TextWidget(
                "add comment",
                fontSize: 14.weight,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Row _comment() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        child: Image.asset(AppImages.user),
      ),
      8.sW,
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget("Donia Ahmed", fontSize: 14.weight),
              6.sH,
              TextWidget(
                """The material quality is premium,Iwascomparing 
it with the Paperwhite but I'm glad that I selected the Oasis over it. The illumination is good, screen size and all details are fine. sealed packaging and authentic product.
                      """,
                fontSize: 12.weight,
                fontWeight: FontWeight.w400,
              ),
              const Divider(color: AppColors.awsm)
            ],
          ),
        ),
      ),
    ],
  );
}
