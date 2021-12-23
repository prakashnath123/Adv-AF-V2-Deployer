FROM debian:latest

RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt update && apt upgrade -y
RUN apt install git -y

COPY run.sh .
COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["/bin/bash", "run.sh"]
