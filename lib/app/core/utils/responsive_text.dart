import '../export.dart';
extension ResponsiveText on double {
  double get sp {
    // Get screen dimensions from GetX
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;
    
    // Get orientation from context or calculate
    final context = Get.context;
    Orientation orientation;
    
    if (context != null) {
      orientation = MediaQuery.of(context).orientation;
    } else {
      // Fallback: calculate orientation based on dimensions
      orientation = screenWidth > screenHeight 
          ? Orientation.landscape 
          : Orientation.portrait;
    }
    
    // Base design dimensions
    const double basePortraitWidth = 375.0;
    const double baseLandscapeWidth = 812.0; // Using height as base for landscape
    
    // Choose base dimension based on orientation
    final double baseWidth = orientation == Orientation.portrait 
        ? basePortraitWidth 
        : baseLandscapeWidth;
    
    // Use shortest side for more consistent scaling
    final double shortestSide = screenWidth < screenHeight ? screenWidth : screenHeight;
    
    // Calculate scale factor
    double scaleFactor = shortestSide / baseWidth;
    
    // Set reasonable limits
    scaleFactor = scaleFactor.clamp(0.8, 1.5);
    
    return this * scaleFactor;
  }
}