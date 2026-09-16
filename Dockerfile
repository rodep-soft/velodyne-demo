FROM ros:lyrical-ros-base

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y

CMD ["bash"] 
