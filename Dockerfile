# 開発・デバッグ用に便利なツールが含まれるOSRF公式イメージを使用
FROM osrf/ros:lyrical-desktop

# aptインストール時の対話プロンプトをスキップするための設定
ENV DEBIAN_FRONTEND=noninteractive

# 開発に必要な基本パッケージのインストール
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-pip \
    build-essential \
    git \
    vim \
    tmux \
    ros-lyrical-foxglove-bridge \
    #ros-lyrical-velodyne-driver \
    ros-lyrical-diagnostic-updater \
    libpcap-dev \
    && rm -rf /var/lib/apt/lists/*

# ROS 2ワークスペースの作成
WORKDIR /ros2_ws

# コンテナ起動時に自動でROS 2の環境をセットアップ
RUN echo "source /opt/ros/lyrical/setup.bash" >> ~/.bashrc
# ワークスペースをビルドした後のsetup.bashも読み込む場合は以下も追加
# RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

CMD ["/bin/bash"] 
