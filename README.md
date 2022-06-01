# Firebase-with-flutter

In this topic I explain the setup of Firebase in an easy way provided by Firebase ,
useing FCM (Firebase Cloud Messaging)
and create simple notification

* explain way to set firebase
    1- to install Firebase CLI :
        1- install node by https://nodejs.org/en/
        2- from start run install additional tools for node.js 
        3- from start run node.js command prompt and inside it run this command: $npm install -g firebase-tools

    2- Install and run the FlutterFire CLI
        1- From any directory, run this command: $dart pub global activate flutterfire_cli
        2- copy C:\Users\$NAMECOMPUTER\AppData\Local\Pub\Cache\bin  and put in path of users variable in environment

    3- Then, at the root of your Flutter project directory, run this command: $flutterfire configure --project=alesraa-25a4e
    4- choose platform default android and ios press enter to start setup firebase , you can add linux and macos

* explain way to using FCM
    1- add these 3 Dependencies in pubspec.yaml 
        1.firebase_core: ^1.12.0
        2.firebase_messaging: ^11.2.6
        3.flutter_local_notifications: ^9.2.0
    
    2- Add this lines to main() method 
        1. WidgetsFlutterBinding.ensureInitialized();
        2. await Firebase.initializeApp();

    3- Now write some code in main.dart to start firebase background services
        1. add this method after import statement in main.dart
        Future<void> backgroundHandler(RemoteMessage message) async {
          print(message.data.toString());
        print(message.notification!.title);
        }

        2. call this method from main method after await Firebase.initializeApp();

        FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    4-  @override
        void initState() {
          super.initState();

          // 1. This method call when app in terminated state and you get a notification
          // when you click on notification app open from terminated state and you can get notification data in this method

          FirebaseMessaging.instance.getInitialMessage().then(
            (message) {
              print("FirebaseMessaging.instance.getInitialMessage");
              if (message != null) {
                print("New Notification");
                // if (message.data['_id'] != null) {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => DemoScreen(
                //         id: message.data['_id'],
                //       ),
                //     ),
                //   );
                // }
              }
            },
          );

          // 2. This method only call when App in forground it mean app must be opened
          FirebaseMessaging.onMessage.listen(
            (message) {
              print("FirebaseMessaging.onMessage.listen");
              if (message.notification != null) {
                print(message.notification!.title);
                print(message.notification!.body);
                print("message.data11 ${message.data}");
                // LocalNotificationService.display(message);

              }
            },
          );

          // 3. This method only call when App in background and not terminated(not closed)
          FirebaseMessaging.onMessageOpenedApp.listen(
            (message) {
              print("FirebaseMessaging.onMessageOpenedApp.listen");
              if (message.notification != null) {
                print(message.notification!.title);
                print(message.notification!.body);
                print("message.data22 ${message.data['_id']}");
              }
            },
          );
        }
   
  * explain way to create notification
    go inside lib -> create folder -> notificationservice -> create file inside notificationservice  -> local_notification_service.dart
    go inside the local_notification_service.dart and create a class 

    class LocalNotificationService{

    }

    inside class create instance of FlutterLocalNotificationsPlugin see below 

    static final FlutterLocalNotificationsPlugin _notificationsPlugin =
          FlutterLocalNotificationsPlugin();

    after this create a method initialize to initialize  localnotification 

    static void initialize(BuildContext context) {
        // initializationSettings  for Android
        const InitializationSettings initializationSettings =
            InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        );

        _notificationsPlugin.initialize(
          initializationSettings,
          onSelectNotification: (String? id) async {
            print("onSelectNotification");
            if (id!.isNotEmpty) {
              print("Router Value1234 $id");

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => DemoScreen(
              //       id: id,
              //     ),
              //   ),
              // );


            }
          },
        );
      }

  
  after initialize we create channel in createanddisplaynotification method

  static void createanddisplaynotification(RemoteMessage message) async {
      try {
        final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "pushnotificationapp",
            "pushnotificationappchannel",
            importance: Importance.max,
            priority: Priority.high,
          ),
        );

        await _notificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: message.data['_id'],
        );
      } on Exception catch (e) {
        print(e);
      }
    }
  
  call initialize method from main method
  LocalNotificationService.initialize();
  
  and uncomment line FirebaseMessaging.onMessage in method FirebaseMessaging.onMessageOpenedApp.listen
