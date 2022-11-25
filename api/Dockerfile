# if on an M1 mac you need to build this with --platform linux/amd64
# https://stackoverflow.com/questions/66127933/cloud-run-failed-to-start-and-then-listen-on-the-port-defined-by-the-port-envi

FROM python:3.10

WORKDIR /app
COPY requirements.txt requirements.txt

RUN python -m pip install -r requirements.txt

COPY api.py api.py

EXPOSE 8000

CMD ["uvicorn", "api:app", "--host", "0.0.0.0"]