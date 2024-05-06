# WebRTC audio-video caller app

WebRTC application in modern C++ to make video calls with multiple peers at once.

## Building the project

```css
 sudo apt-get install build-essential gdb
 apt install libboost-all-dev
 cmake -S. -Bbuild -DUSE_DATACHANNEL=0
 cd /build
 make
```

## Usage

```css
./webrtc_app <ip_address> <port>
```
