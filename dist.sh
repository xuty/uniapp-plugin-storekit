#!/bin/sh

SDKVER="14.2"
VER="v0.0.1"
NAME="X1StoreKit"

echo "--->builds ios framework"
rm -rf build

xcodebuild -project X1Storekit.xcodeproj  -sdk iphoneos${SDKVER} -configuration Release
xcodebuild -project X1Storekit.xcodeproj  -sdk iphonesimulator${SDKVER} -configuration Release
    
cd build/
mkdir universal
cp -rf Release-iphoneos/X1Storekit.framework universal/
rm -rf universal/X1Storekit.framework/X1Storekit

lipo -remove arm64 Release-iphonesimulator/X1Storekit.framework/X1Storekit -o Release-iphonesimulator/X1Storekit.framework/X1StorekitClean 
lipo -create Release-iphoneos/X1Storekit.framework/X1Storekit Release-iphonesimulator/X1Storekit.framework/X1StorekitClean -output universal/X1Storekit.framework/X1Storekit
cd ..

rm -rf  dist/${NAME}-${VER}
cp -rf template/${NAME} dist/${NAME}-${VER}
cp -rf build/universal/X1Storekit.framework dist/${NAME}-${VER}/Xty-StoreKit/ios/X1Storekit.framework


cd dist
zip -r ${NAME}-${VER}.zip ${NAME}-${VER}
cd ..