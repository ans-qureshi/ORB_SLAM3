
# ORB-SLAM3 Installation Guide

This guide provides step-by-step instructions for installing ORB-SLAM3 along with its dependencies. Ensure that you meet the prerequisites before starting the installation process.

## Prerequisites

- OpenCV version greater than 4.4.0 (specifically, 4.5.0 is recommended)

### Install OpenCV

1. Open a terminal and create a directory for development:
   ```
   cd ~
   mkdir Dev && cd Dev
   ```

2. Clone the OpenCV repository:
   ```bash
   git clone https://github.com/opencv/opencv.git
   cd opencv
   git checkout 4.5.0
   ```

3. Modify the `cap_ffmpeg_impl.hpp` header file:
   ```bash
   gedit ./modules/videoio/src/cap_ffmpeg_impl.hpp
   ```

   Add the following lines at the top of the file:
   ```cpp
   #define AV_CODEC_FLAG_GLOBAL_HEADER (1 << 22)
   #define CODEC_FLAG_GLOBAL_HEADER AV_CODEC_FLAG_GLOBAL_HEADER
   #define AVFMT_RAWPICTURE 0x0020
   ```
   Save and close the file.

4. Create a build directory and compile OpenCV:
   ```bash
   mkdir build
   cd build
   cmake -D CMAKE_BUILD_TYPE=Release -D WITH_CUDA=OFF -D CMAKE_INSTALL_PREFIX=/usr/local ..
   make -j 3
   sudo make install
   ```

## Get Pangolin

1. Navigate to your preferred code directory:
   ```bash
   cd ~/your_fav_code_directory
   ```

2. Clone the Pangolin repository:
   ```bash
   git clone --recursive https://github.com/stevenlovegrove/Pangolin.git
   cd Pangolin
   ```

3. Install dependencies:
   ```bash
   ./scripts/install_prerequisites.sh recommended
   ```

4. Configure and build Pangolin:
   ```bash
   cmake -B build
   cmake --build build
   ```

## Install ORB-SLAM3

1. Clone the ORB-SLAM3 repository:
   ```bash
   git clone https://github.com/ans-qureshi/ORB_SLAM3
   cd ORB_SLAM3
   ```

2. Build ORB-SLAM3:
   ```bash
   ./build.sh
   ```

### Install ORB-SLAM3 with ROS

If you want to use ORB-SLAM3 with ROS, run:
```bash
./build_ros.sh
```

## Conclusion

You have successfully installed ORB-SLAM3 along with its dependencies. Make sure to follow any additional setup instructions specific to your project requirements. Enjoy using ORB-SLAM3!
If you use ORB-SLAM3 in an academic work, please cite:
```  
    @article{ORBSLAM3_TRO,
      title={{ORB-SLAM3}: An Accurate Open-Source Library for Visual, Visual-Inertial 
               and Multi-Map {SLAM}},
      author={Campos, Carlos AND Elvira, Richard AND G\´omez, Juan J. AND Montiel, 
              Jos\'e M. M. AND Tard\'os, Juan D.},
      journal={IEEE Transactions on Robotics}, 
      volume={37},
      number={6},
      pages={1874-1890},
      year={2021}
     }
