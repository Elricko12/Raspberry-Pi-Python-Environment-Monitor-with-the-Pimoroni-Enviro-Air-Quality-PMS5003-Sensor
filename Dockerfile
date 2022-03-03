FROM arm32v6/python:3.7-alpine

RUN apk add --update alpine-sdk linux-headers libffi-dev

COPY requirements.txt .

RUN export PIP_DEFAULT_TIMEOUT=100 && export CFLAGS=-fcommon && \
    pip3 install --upgrade pip && pip3 install --upgrade setuptools && \
    pip3 install -r requirements.txt


# Add the application
COPY ./app/*.py /

# Disable output buffering 
ENV PYTHONUNBUFFERED=1

CMD ["python3","main.py"]


# docker run -it --privileged -p 5678:5678 --rm  -v $PWD:/app   --name enviroplus --env-file .env  environment:latest

# docker run -it --privileged -p 5678:5678 --rm  -v $PWD:/app   --name enviroplus --env-file .env  glovebox.azurecr.io/envi>

# docker run -d --privileged -p 5678:5678 --rm  --name enviroplus --env-file .env  environment:latest