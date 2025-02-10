CUR_PATH=$(pwd)

cd ${CUR_PATH}/source/avs-device-sdk/tools/Install
   bash genConfig.sh config.json 12345 \
   /userdata/alexa/database \
   ${CUR_PATH}/source/avs-device-sdk \
   ${CUR_PATH}/build/Integration/AlexaClientSDKConfig.json \
   -DSDK_CONFIG_MANUFACTURER_NAME="ORVIBO" \
   -DSDK_CONFIG_DEVICE_DESCRIPTION="ubuntu"

cd -
