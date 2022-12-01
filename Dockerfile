FROM ubuntu:22.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install npm openjdk-11-jdk wget unzip curl vim net-tools -y

RUN npm install -g n
RUN n lts
RUN npm install -g npm@latest

RUN node -v
RUN npm -v

RUN npm install -g cordova

RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip?hl=ko -O cmdlinetools.zip -nc
RUN unzip cmdlinetools.zip
RUN rm cmdlinetools.zip

RUN wget -q https://services.gradle.org/distributions/gradle-7.5.1-bin.zip -nc
RUN unzip gradle-7.5.1-bin.zip
RUN rm gradle-7.5.1-bin.zip

ENV ANDROID_HOME=/cmdline-tools/
ENV ANDROID_SDK_ROOT=/cmdline-tools/
ENV PATH="${PATH}:/gradle-7.5.1/bin:/cmdline-tools/bin"
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "cmdline-tools;8.0"
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;32.0.0"

WORKDIR /
RUN cordova telemetry off
RUN cordova create work
WORKDIR /work
RUN cordova plugin add https://github.com/fabiorogeriosj/cordova-plugin-sensors.git cordova-plugin-geolocation
RUN cordova plugin add cordova-plugin-file
RUN cordova plugin add cordova-plugin-zip
RUN cordova plugin add https://github.com/lancard/cordova-plugin-background-download.git cordova-plugin-background-download
RUN cordova platform add android@11.0.0
RUN cordova build ; exit 0
RUN cordova build

ENTRYPOINT ["/app/run.sh"]
