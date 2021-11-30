package com.example.traffic_sign_identity;

import java.util.Map;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  // private static final String CHANNEL = "tushar/tensorflow";
  // private static boolean modelLoaded = false;
  // private RenderScript rs;

  // private final Map<K,V> metaData;

  // Non Custom Code Begin
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    // Non Custom code end
    // rs = RenderScript.create(this);
    // metaData.put(key, value)
    // new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {
    //   @Override
    //   public void onMethodCall(MethodCall call, Result result) {
    //     if (call.method.equals("loadModel")) {
    //       String modelPath = call.argument("model_path");
    //       loadModel(modelPath, result);
    //     }
    //   }

    //});
  }
  

  // protected void loadModel(final String modelPath, final Result result) {
  //   new Thread(new Runnable() {
  //     public void run() {
  //       try {
  //         String modelPathKey = getFlutterView().getLookupKeyForAsset(modelPath);
  //         ByteBuffer modelData = loadModelFile(getApplicationContext().getAssets().openFd(modelPathKey));
  //         detector = new TrafficClassifierModel(rs, modalData, metaData);
  //         modelLoaded = true;
  //         result.success("Modal Loaded Sucessfully");
  //       } catch (Exception e) {
  //         e.printStackTrace();
  //         result.error("Modal failed to loaded", e.getMessage(), null);
  //       }
  //     }
  //   }).start();
  // }

//   public ByteBuffer loadModalFile(AssetFileDescriptor fileDescriptor) throws IOException {
//     FileInputStream inputStream = new FileInputStream(fileDescriptor.getFileDescriptor());
//     FileChannel fileChannel = inputStream.getChannel();
//     long startOffset = fileDescriptor.getStartOffset();
//     long declaredLength = fileDescriptor.getDeclaredLength();
//     return fileChannel.map(FileChannel.MapMode.READ_ONLY, startOffset, declaredLength);
// }


}
