FROM ubuntu:latest
MAINTAINER Rick Torzynski "ricktorzynski@gmail.com"
RUN apt-get update -y && apt-get install -y python3-pip python3-dev build-essential
RUN apt-get update -y && apt-get install -y libsm6 libxext6
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install tesseract-ocr
COPY . /app
WORKDIR /app
RUN pip3 install pillow
RUN pip3 install pytesseract
RUN pip3 install opencv-contrib-python
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["app.py"]