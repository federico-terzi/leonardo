FROM rocm/tensorflow

RUN apt-get update && \
    apt-get install -y --allow-unauthenticated \
    rocm-dkms rocm-dev rocm-libs hipcub rccl \
    rocm-device-libs \
    hsa-ext-rocr-dev hsakmt-roct-dev hsa-rocr-dev \
    rocm-opencl rocm-opencl-dev \
    rocm-utils \
    miopen-hip miopengemm

RUN pip3 install --upgrade pip

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY ./requirements.txt .

RUN pip install -r requirements.txt

CMD jupyter notebook --port 8888 --ip 0.0.0.0 --allow-root --NotebookApp.token='' --notebook-dir='/src'