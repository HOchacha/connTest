FROM python:3.8-slim

RUN pip install kubernetes

WORKDIR /root/client

COPY client.py .

CMD ["python3", "client.py"]
