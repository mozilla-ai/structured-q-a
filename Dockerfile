FROM python:3.10-slim

RUN pip3 install --no-cache-dir --upgrade pip
RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git


COPY . /home/appuser/structured_qa
WORKDIR /home/appuser/structured_qa

RUN pip3 install /home/appuser/structured_qa

RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 --gid 1000 -ms /bin/bash appuser

USER appuser

EXPOSE 8501
ENTRYPOINT ["./demo/run.sh"]