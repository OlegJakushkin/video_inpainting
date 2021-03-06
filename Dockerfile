FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt update -y; apt install -y \
nano wget htop \
python3 \
python3-pip \
libglib2.0-0 \
libsm6 \
libxext6 \
libxrender-dev

RUN pip3 install \
addict>=2.2.1 \
certifi>=2019.6.16 \
cffi>=1.12.3 \
chardet>=3.0.4 \
cvbase>=0.5.5 \
Cython>=0.29.12 \
idna>=2.8 \
mkl-fft \
mkl-random \
numpy>=1.16.4 \
olefile>=0.46 \
opencv-python>=4.1.0.25 \
Pillow>=6.2.0 \
protobuf>=3.8.0 \
pycparser>=2.19 \
PyYAML>=5.1.1 \
requests>=2.22.0 \
scipy>=1.2.1 \
six>=1.12.0 \
tensorboardX>=1.8 \
terminaltables>=3.1.0 \
torch==1.1.0 \
torchvision>=0.2.1 \
tqdm>=4.32.1 \
urllib3>=1.25.3 \
mmcv>=0.2.10

RUN git clone --recursive -b "v1.1" https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting && mv Deep-Flow-Guided-Video-Inpainting ./inpainting
RUN cd inpainting
RUN bash install_scripts.sh
RUN mkdir pretrained_models && cd pretrained_models \
  && wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/FlowNet2_checkpoint.pth.tar \
  && wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/imagenet_deepfill.pth \
  && wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/resnet101_movie.pth \
  && wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/davis_stage3.pth \ 
  && wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/davis_stage2.pth \
  &&  wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/resnet50_stage1.pth
  
RUN wget https://github.com/OlegJakushkin/Deep-Flow-Guided-Video-Inpainting/releases/download/test/demo.zip && unzip demo.zip 


