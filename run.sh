#./build/SampleApplications/ConsoleSampleApplication/src/SampleApp ./build/Integration/AlexaClientSDKConfig.json INFO

#!/bin/sh

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/userdata/alexa/lib
echo $LD_LIBRARY_PATH
/userdata/alexa/SampleApp /userdata/alexa/AlexaClientSDKConfig.json INFO

