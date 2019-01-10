# openvino-opencv-python
Openvino environment with opencv and python3

## Download OpenVINO Toolkit 

You can register and download it from : https://software.intel.com/en-us/openvino-toolkit/choose-download/free-download-linux

Or use wget to ghte the 2018 Release 3 directly

$ wget http://registrationcenter-download.intel.com/akdlm/irc_nas/13521/l_openvino_toolkit_p_2018.3.343.tgz

### Untar the file and locate it in the root folder  

$ tar -xf l_openvino_toolkit*

### Build docker

$ docekr build -t openvino-opencv . 

### Run docker

$ docker run -ti openvino-opencv /bin/bash 
