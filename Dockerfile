from bitbucketpipelines/android-ci-image

WORKDIR /opt
## Install android SDK
RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip \
	&& unzip -qq sdk-tools-linux-3859397.zip -d android-sdk-linux \
	&& rm -f sdk-tools-linux-3859397.zip \
	&& cd /opt/android-sdk-linux \
	&& yes | tools/bin/sdkmanager --update \
	&& yes | tools/bin/sdkmanager --licenses \
	&& yes | tools/bin/sdkmanager "platform-tools" "platforms;android-29" "build-tools;29.0.3" "extras;google;m2repository" "extras;android;m2repository"

ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

WORKDIR /app