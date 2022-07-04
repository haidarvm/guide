# downgrade flutter
cd /home/haidar/snap/flutter/common/flutter/
git checkout 3.0.0
flutter --version

# change android\app\src\main\AndroidManifest.xml
From :
<application
    android:name="io.flutter.app.FlutterApplication"
    ...
To :
<application
        android:name="${applicationName}"
        ...

add this three lines if doesn't exist :

<meta-data
        android:name="flutterEmbedding"
        android:value="2" />
          ...
