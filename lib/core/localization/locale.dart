import '/index.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          // onBoarding
          "chooseProduct": "اختر المنتج",
          "chooseProductSup": "لدينا أكثر من 100 ألف منتج. اختر منتجك من متجرنا للتجارة الإلكترونية",
          "easy&SafePayment": "دفع سهل وآمن",
          "easy&SafePaymentSup": "طريقة دفع سهلة وآمنة. موثوق به من قبل عملائنا من جميع أنحاء العالم.",
          "trackYourOrder": "تتبع طلباتك",
          "trackYourOrderSup": "تم استخدام أفضل أداة تعقب لتتبع طلبك. ستعرف مكان وجودك في الوقت الحالي",
          "fastDelivery": "توصيل سريع",
          "fastDeliverySup": "موثوقة وسرعة التسليم. نقوم بتسليم منتجك بأسرع طريقة ممكنة.",
          "skip": "تخطى",
          "continu": "استمر",
          "getSta": "البدأ",
          // Language
          "lang": "اللغة",
          "choseLang": "اختر لغتك",
          "arabic": "العربية",
          "english": "الاجنبية",
          // welcome
          "google": "جوجل",
          "facebock": "فيسبوك",
          "apple": "ابل",
          "or": "أو",
          "conWiPHo": "التسجيل برقم الهاتف",
          "conToSigin": "تسجيل الدخول",
          "signWith": "التسجيل ب",
          "phone": "رقم الهاتف",
          "signUpHe": "انشاء حساب",
          "back": "رجوع",

          "welcomBack": "مرحباً بك",
          "login": "تسجيل الدخول",
          "email": "user669@gmail.com",
          "password": "كلمة المرور",
          "forgetPassword": "نسيت كلمة المرور ؟",
          "forgetPasswordInf": " خطوتان لاستعادة كلمة المرور الخاصة بك",
          "dontHaveAcc": "لا املك حساب ؟",
          "createAcc": "تسجيل حساب",

          
          "hello": "مرحبا",
          "signUp": "تسجيل حساب",
          "userName": "اسم المستخدم",
          "confirmPassword": "تأكيد كلمة المرور",
          "alreadyHave": "املك حساب ؟",
          
          "verificationCode": "رمز التحقق",
          "otpsent": "تم إرسال رمز التحقق إلىك",
          "confirm": "تأكيد",
          "resendCode": "أعد إرسال الرمز",

          "home": "الصفحة الرأيسية",
          "map": "الخريطة",
          "qrScaner": "الماسح الضوئي",
          "qrChatScaner": "المحادثة",
          "community": "المجتمع",
          "wallet": "المحفظة",

          "privacyPolicy": "سياسة الخصوصية",
          "privacySupTit": """قمنا ببناء Drob-Me كتطبيق مجاني. يتم تقديم هذه الخدمة من قبلنا دون أي تكلفة ومهددة للاستخدام كما هي.
تُستخدم هذه الصفحة لإبلاغ الزائرين فيما يتعلق بسياساتنا من خلال جمع المعلومات الشخصية واستخدامها والكشف عنها إذا قرر أي شخص استخدام خدمتنا.
إذا اخترت استخدام خدمتنا ، فأنت توافق على جمع المعلومات واستخدامها فيما يتعلق بهذه السياسة. يتم استخدام المعلومات الشخصية التي نجمعها
لتوفير وتحسين الخدمة. لن نستخدم أو نشارك معلوماتك مع أي شخص إلا كما هو موضح في سياسة الخصوصية هذه.
الشروط المستخدمة في سياسة الخصوصية هذه لها نفس المعاني كما هو الحال في الشروط والأحكام ، والتي يمكن الوصول إليها في Soltan ما لم يتم تحديدها على خلاف ذلك في سياسة الخصوصية هذه""",

          "licenses": "التراخيص",
          "liceSup": """يمنحك Drob-Me ترخيصًا محدودًا قابلاً للإلغاء وغير حصري وغير قابل للتحويل لتنزيل وتثبيت واستخدام التطبيق بشكل صارم وفقًا لشروط هذه الاتفاقية. هذه الشروط والأحكام عقد
بينك وبين Drob-Me (يشار إليها في هذه الشروط والأحكام باسم "Drob-Me" أو "US" أو "We" أو "Our") ، مزود موقع Drob-Me والخدمات التي يمكن الوصول إليها من Drob-Me موقع الويب (يشار إليه مجتمعة في هذه الشروط والأحكام مثل
"خدمة Drob-Me"). أنت توافق على الالتزام بهذه الشروط والأحكام. إذا كنت لا توافق على هذه الشروط والأحكام ، فيرجى عدم استخدام خدمة Drob-Me. في هذه الشروط والأحكام ، "أنت"
يشير إليك كفرد والكيان الذي تمثله. إذا انتهكت أيًا من هذه الشروط والأحكام ، فإننا نحتفظ بالحق في إلغاء حسابك أو حظر الوصول إلى حسابك دون إشعار.""",
        
          "information": "جمع المعلومات واستخدامها",
          "informationSup": """للحصول على تجربة أفضل ، أثناء استخدام خدمتنا ، قد نطلب منك تزويدنا بمعلومات محددة شخصية معينة. المعلومات التي نحن
سيتم الاحتفاظ بالطلب من قبلنا واستخدامها كما هو موضح في سياسة الخصوصية هذه.""",
        
        "promotions":"الاتفاقية",
        "promotionsSup":"""يجوز لـ Drob-Me ، من وقت لآخر ، تشمل المسابقات أو الترقيات أو اليانصيب أو الأنشطة الأخرى ("العروض الترويجية") التي تتطلب منك تقديم مواد أو معلومات تتعلق بنفسك. يرجى ملاحظة أن جميع العروض الترويجية قد تكون
تحكمها قواعد منفصلة قد تحتوي على بعض متطلبات الأهلية ، مثل القيود المتعلقة بالعمر والموقع الجغرافي. أنت مسؤول عن قراءة جميع قواعد العروض الترويجية لتحديد ما إذا كنت مؤهلاً للمشاركة أم لا. إذا أدخلت أي عرض ترويجي ، فأنت توافق على الالتزام به وامتثال لجميع قواعد العروض الترويجية. قد تنطبق الشروط والأحكام الإضافية على عمليات شراء السلع أو الخدمات على الخدمات أو من خلالها ، والتي يتم إجراؤها على جزء من هذه الاتفاقية من خلال هذا الاتفاقية مرجع.""",

        "yourSuggestions":"اقتراحاتك",
        "yourSuggestionsSup":"""أي ردود فعل أو تعليقات أو أفكار أو تحسينات أو اقتراحات (مجتمعة ، "اقتراحات") التي توفرها لك لدروب-فيما يتعلق بالتطبيق ، تظل الملكية الوحيدة والحصرية لـ Drob-Me. يجب أن تكون Drob-Me حرة في الاستخدام ،
قم بنسخ أو تعديل أو نشر أو إعادة توزيع الاقتراحات لأي غرض وبأي طريقة دون أي ائتمان أو أي تعويض لك.""",
        
        "termandTermination":"المصطلح والإنهاء",
        "termandTerminationSup":"""يجب أن تظل هذه الاتفاقية سارية حتى يتم إنهاءها أو دروب مي. يجوز لـ Drob-Me ، وفقًا لتقديرها الخاص ، في أي وقت ولأي سبب من الأسباب أو تعليق أو إنهاء أو إنهاء هذه الاتفاقية مع أو بدون إشعار مسبق.
ستنتهي هذه الاتفاقية على الفور ، دون إشعار مسبق من Drob-Me ، في حالة فشلك في الامتثال لأي بند من هذه الاتفاقية.
يمكنك أيضًا إنهاء هذه الاتفاقية عن طريق حذف التطبيق وجميع نسخه من جهاز الكمبيوتر الخاص بك. إنهاء هذه الاتفاقية ، يجب أن تتوقف عن استخدام التطبيق وحذف جميع نسخ التطبيق من جهاز الكمبيوتر الخاص بك.
لن يحد إنهاء هذه الاتفاقية أي من حقوق أو سبل الانتصاف في Drob-Me في القانون أو في حقوق الملكية في حالة خرقك (خلال مدة هذه الاتفاقية) لأي من التزاماتك بموجب الاتفاقية.""",
        
        "copyrightInfringementNotice":"إشعار انتهاك حقوق النشر",
        "copyrightInfringementNoticeSup":"""إذا كنت مالك حقوق الطبع والنشر أو وكيل هذا المالك وتعتقد أن أي مادة على تطبيقنا تشكل انتهاكًا لحقوق الطبع والنشر الخاصة بك ، فيرجى الاتصال بنا مع توضيح المعلومات التالية:
(أ) توقيع مادي أو إلكتروني لمالك حقوق الطبع والنشر أو شخص مخول بالتصرف نيابة عنه ؛ (ب) تحديد المواد التي يُدعى أنها منتهِكة ؛ (ج) معلومات الاتصال الخاصة بك ، بما في ذلك العنوان ورقم الهاتف والبريد الإلكتروني ؛ (د) تصريح من جانبك بأن لديك اعتقاد حسن النية بأن استخدام المواد غير مصرح به بموجب حقوق النشر
أصحاب. و (هـ) الإفادة بأن المعلومات الواردة في الإشعار دقيقة ، وتحت طائلة عقوبة الحنث باليمين ، يحق لك التصرف نيابة عن المالك.""",

          "ageandgender": "العمر والجنس",
          "ageandgenderSup": """كما نطلب من عمرك وجنسك إرسالها لك
المنافسة المناسبة لك بالجوائز المناسبة لعمرك أو جنسك.""",

          "security": "الحماية",
          "securitySup": """نحن نقدر ثقتك في تزويدنا بمعلوماتك الشخصية
المعلومات ، وبالتالي نحن نسعى جاهدين لاستخدامها تجاريًا
الوسائل المقبولة لحمايتها. لكن تذكر ذلك
لا توجد وسيلة نقل عبر الإنترنت ، أو طريقة
التخزين الإلكتروني آمن وموثوق بنسبة 100٪ ، ولا يمكننا ضمان أمانه المطلق.
نطلب من موقعك توصيلك بأقرب آلة بيع أو إعادة تدوير.""",
          
          "competations": "المسابقات",
          "target": "الهدف",
          "allDetails": "كل التفاصيل",
         
          "mapAppBar": "آلة إعادة التدوير Drop-me",
          "getNearestLoca": "احصل على أقرب موقع لك",

          "getDirection": "احصل على اتجاه",
          "qrInfo": "إعادة التدوير أصبحت سهلة! امسح رمز الاستجابة السريعة الموجود على شاشة اللمس الخاصة بالجهاز لإعادة تدوير النفايات الصلبة",
          
          "channels": "القنوات",
          "myWallet": "محفظتى",
          "totalPoint": "مجموع النقاط",
          "coins": "نقطة",
          "redeemPoints": "استبدال النقاط",
          "myrecy": "سجل إعادة التدوير الخاص بي",
          "machinName": "أسم الماكينة",
          "bottels": "زجاجات",
          "onBoardTit1": "مرحبًا بك في Drop-Me!",
          "onBoardSup1": "البدء في كسب نقاط لإعادة التدوير ؛ انضم إلى المسابقات مع الأشخاص واحصل على نقاط عالية ، واجعل العالم مكانًا أنظف وأكثر خضرة.",
          
          "onBoardTit2": "امسح رمز الاستجابة السريعة",
          "onBoardSup2": "ما عليك سوى إدخال المواد التي تقوم بإعادة تدويرها ، وتتبع تقدم عملية إعادة التدوير بسهولة وكسب نقاط لكل عنصر ..",
          
          "onBoardTit3": "استبدل مكافآتك.",
          "onBoardSup3": "استبدل نقاطك بخصومات ومكافآت حصرية من شركائنا.",
          

          "sendfedBa": "ارسل رأيك",
          "editProf": "تعديل الملف الشخصي",
          "logOut": "تسجيل خروج",
          "deleteAcc": "حذف الحساب",
          "colorTheme": "مظهر اللون",
          "light": "ابيض",
          "dark": "داكن",


          "registerdEmail": "البريد المسجل",
          "emaill": "البريد الالكترونى",
          "nameValidator": "الاسم غير صحيح.",
          "emailValidator": "البريد الإلكتروني غير صحيح.",
          "passwordValidator": "يجب أن تكون كلمة المرور 8 على الأقل.",
          "confpasswordValidator": "كلمة المرور هذه لا تساوي كلمة المرور.",
          "phoneValidator": "يجب أن يكون رقم الهاتف 11.",
          "resetPassword": "إعادة تعيين كلمة المرور",
          "setANewPassword": "اكتب كلمة المرور الجديدة",

          "title": "الموضوع",
          "description": "الوصف",
          "cancel": "الغاء",
          "ok": "اتمام",
          
          "chngPrfPho": "تغيير صورة الملف الشخصي",
          "accountInformation": "معلومات الحساب",
          "gender": "جنسك",
          "male": "ذكر",
          "female": "أنثى",
          "location": "الموقع",
          "seAddress": "حدد العنوان",
          "age": "العمر",
          
          "startedDate": "تاريخ البدء",
          "endDate": "تاريخ الانتهاء",
          "competationName": "اسم المسابقة",
          "myRank": "ترتيبي",
          "points": "نقطة",
          "top10": "أعلى 10",
         

        },
        "en": {
            // onBoarding
          "chooseProduct": "Choose Product",
          "chooseProductSup": "We Have a 100k+ Products. Choose Your Product From Our E-commerce shop",
          "easy&SafePayment": "Easy&Safe Payment",
          "easy&SafePaymentSup": "Easy Checkout & Safe Paynent method. Trusted by our Custoners from all\n over the worid.",
          "trackYourOrder": "track Your Order",
          "trackYourOrderSup": "Best Tracker has been used For Tracking orders.Youll know where your product\n is at the moment",
          "fastDelivery": "Fast Delivery",
          "fastDeliverySup": "Reliable And Fast Delivery. We Deliver your product the fastest way possible.",
          "skip": "Skip",
          "continu": "Continue",
          "getSta": "Get Start",
          // Language
          "lang": "Language",
          "choseLang": "Choose  Your Language",
          "arabic": "ARABIC",
          "english": "English",
          // welcome
          "google": "Google",
          "facebock": "Facebock",
          "apple": "Apple",
          "or": "OR",
          "conWiPHo": "Continue With Phone Number",
          "conToSigin": "Continue to Sign in",
          "signWith": "Sign With",
          "phone": "Phone Number",
          "signUpHe": "Sign up here",
          "back": "Back",

          "welcomBack": "Welcome Back",
          "login": "Login",
          "email": "user669@gmail.com",
          "password": "Password",
          "forgetPassword": "forgetPassword ?",
          "forgetPasswordInf": "2 steps To reccover your password",
          "dontHaveAcc": "Don't have an accont?",
          "createAcc": "Create Account",


          "hello": "Hello",
          "signUp": "Sign up",
          "userName": "User Name",
          "confirmPassword": "Confirm Password",
          "alreadyHave": "Already have an accont ?",          

          "verificationCode": "verification Code",          
          "otpsent": "The OTP has been sent to you ",          
          "confirm": "Confirm",          
          "resendCode": "Resend code",

          "home": "Home",          
          "map": "Map",          
          "qrScaner": "Scaner",          
          "qrChatScaner": "Chat",          
          "community": "Community",          
          "wallet": "Wallet",          
          "privacyPolicy": "Privacy Policy",  
          "privacySupTit": """We built the Drob-Me as a Free app. This service is provided by us at no cost and is intended for use as is.
This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.
If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used
for providing and improving the Service. we will not use or share your information with anyone except as described in this Privacy Policy.
The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at soltan unless otherwise defined in this Privacy Policy""",
        
          "licenses": "Licenses",
          "liceSup": """Drob-Me grants you a revocable, non-exclusive, non-transferable, limited license to download, install and use the app strictly in accordance with the terms of this Agreement. These Terms & Conditions are a contract
between you and Drob-Me (referred to in these Terms &Conditions as "Drob-Me", "us", "we" or "our"), the provider of the Drob-Me website and the services accessible from the Drob-Me website (which are collectively referred to in these Terms & Conditions as
the "Drob-Me Service"). You are agreeing to be bound by these Terms & Conditions. If you do not agree to these Terms & Conditions, please do not use the Drob-Me Service. In these Terms & Conditions, "you"
refers both to you as an individual and to the entity you represent. If you violate any of these Terms &Conditions, we reserve the right to cancel your account or block access to your account without notice.""",

          "information": "Information Collection and Use",
          "informationSup": """For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we
request will be retained by us and used as described in this privacy policy.""",

        "promotions":"Promotions",
        "promotionsSup":"""Drob-Me may, from time to time, include contests,promotions, sweepstakes, or other activities ("Promotions")that require you to submit material or information concerning yourself. Please note that all Promotions may be
governed by separate rules that may contain certain eligibility requirements, such as restrictions as to age and geographic location. You are responsible to read all Promotions rules to determine whether or not you are eligible to participate.
If you enter any Promotion, you agree to abide by and to comply with all Promotions Rules.Additional terms and conditions may apply to purchases of goods or services on or through the Services, which terms and conditions are made a part of this Agreement by this reference.""",

        "yourSuggestions":"Your Suggestions",
        "yourSuggestionsSup":"""Any feedback, comments, ideas, improvements or suggestions (collectively, "Suggestions") provided by you to Drob-Me with respect to the app shall remain the sole and exclusive property of Drob-Me. Drob-Me shall be free to use,
copy, modify, publish, or redistribute the Suggestions for any purpose and in any way without any credit or any compensation to you.
""",
        "termandTermination":"Term and Termination",
        "termandTerminationSup":"""This Agreement shall remain in effect until terminated by you or Drob-Me. Drob-Me may, in its sole discretion, at any time and for any or no reason, suspend or terminate this Agreement with or without prior notice. 
This Agreement will terminate immediately, without prior notice from Drob-Me, in the event that you fail to comply with any provision of this Agreement.
You may also terminate this Agreement by deleting the app and all copies thereof from your computer.Upon termination of this Agreement, you shall cease all use of the app and delete all copies of the app from your computer.
Termination of this Agreement will not limit any of Drob-Me's rights or remedies at law or in equity in case of breach by you (during the term of this Agreement) of any of your obligations under the present Agreement.
""",
        "copyrightInfringementNotice":"Copyright Infringement Notice",
        "copyrightInfringementNoticeSup":"""If you area copyright owner or such owner's agent and believe any material on our app constitutes an infringement on your copyright, please contact us setting forth the following information: 
(a) a physical or electronic signature of the copyright owner or a person authorized to act on his behalf; (b) identification of the material that is claimed to be infringing; (c) your contact information, including your address, telephone number, and an email; (d) a statement by you that you have a good faith belief that use of the material is not authorized by the copyright
owners; and (e) the a statement that the information in the notification is accurate, and, under penalty of perjury you are authorized to act on behalf of the owner.
""",

          "ageandgender": "Age and gender",
          "ageandgenderSup": """We also request your age and gender to send for you
the suitable competition for you with the suitable prizes for your age or gender.""",

          "security": "Security",
          "securitySup": """we value your trust in providing us your Personal
Information, thus we are striving to use commercially
acceptable means of protecting it. But remember that
no method of transmission over the internet, or method
of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.
We request your location to connect you with the nearest vending or recycling machine.""",

         "competations": "Competations",
         "target": "Target",
         "allDetails": "All Details",

         "mapAppBar": "Drop me recycling machine",
         "getNearestLoca": "Get your nearest Location",

         "getDirection": "Get Direction",

         "qrInfo": "Recycling is made easy! Scan the QR code on the Machine's touchscreen to recycle your Solid Waste",
          
          "channels": "Channels",
          "myWallet": "My Wallet",
          "totalPoint": "Total Point",
          "coins": "Coins",
          "redeemPoints": "Redeem points",
          "myrecy": "My recycing log",
          "machinName": "Machin Name",
          "bottels": "bottels",
          
          "onBoardTit1": "Welcome to Drop-Me !",
          "onBoardSup1": "Start earning points for recycling ;  Join competitions with people and get high points , make the world a cleaner, greener place.",
          
          "onBoardTit2": "Scan the QR-code",
          "onBoardSup2": "Simply enter the materials you are recycling , Easily track your recycling progress and earn points for each item...",
          
          "onBoardTit3": "Redeem your rewards.",
          "onBoardSup3": "Exchange your points for exclusive discounts and rewards from our partners .",
          

          "sendfedBa": "Send Feedback",
          "editProf": "Edit Profile",
          "logOut": "LogOut",
          "deleteAcc": "Delete Account",
          "colorTheme": "Color Theme",
          "light": "Light",
          "dark": "Dark",

          "registerdEmail": "REGISTERED EMAIL !",
          "emaill": "Email",
          "nameValidator": "The name is not valid.",
          "emailValidator": "The email is not valid.",
          "passwordValidator": "The password must be 8 at least.",
          "confpasswordValidator": "This password not equal password.",
          "phoneValidator": "phone number must be 11.",
          "resetPassword": "RESET PASSWORD",
          "setANewPassword": "set a new password",


          "title": "Title",
          "description": "Description",
          "cancel": "cancel",
          "ok": "ok",

          "chngPrfPho": "Change Profile Photo",
          "accountInformation": "Account Information",
          "gender": "Your Gender",
          "male": "male",
          "female": "female",
          "location": "Location",
          "seAddress": "Select Address",
          "age": "age",

          "startedDate": "Started Date",
          "endDate": "End Date",
          "competationName": "Competation name",
          "myRank": "My Rank",
          "points": "Points",
          "top10": "Top 10",
          
          
        }
      };
}
