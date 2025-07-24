FROM python:3.11-slim as builder

WORKDIR /app

COPY . .

RUN pip install --upgrade pip setuptools && \
    pip install --no-cache-dir -r requirements.txt --prefix=/install

FROM gcr.io/distroless/python3

WORKDIR /app

COPY --from=builder /install /usr/local
COPY --from=builder /app /app

ENV FLASK_APP=app.py
ENV FLASK_ENV=prod

EXPOSE 5050

CMD ["flask", "run", "--host=0.0.0.0", "--port=5050"]