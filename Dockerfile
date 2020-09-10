from java:8

WORKDIR /opt
## Install android SDK && Gradle
RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip \
	&& unzip -qq sdk-tools-linux-3859397.zip -d android-sdk-linux \
	&& rm -f sdk-tools-linux-3859397.zip \
	&& wget -q https://services.gradle.org/distributions/gradle-5.6.4-all.zip \
	&& unzip -qq -d /opt/gradle gradle-5.6.4-all.zip  \
	&& rm -f gradle-5.6.4-all.zip \
	&& ln -s /opt/gradle/gradle-5.6.4 /opt/gradle/latest \
	&& cd /opt/android-sdk-linux \
	&& yes | tools/bin/sdkmanager --update \
	&& yes | tools/bin/sdkmanager --licenses \
	&& yes | tools/bin/sdkmanager "platform-tools" "platforms;android-29" "build-tools;29.0.3" "extras;google;m2repository" "extras;android;m2repository"

ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV GRADLE_HOME=/opt/gradle/latest
ENV PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
ENV PATH=${GRADLE_HOME}/bin:${PATH}

WORKDIR /app