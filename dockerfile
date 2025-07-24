FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && apt-get clean

COPY . .

RUN pip install --upgrade setuptools

RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP=app.py

ENV FLASK_ENV=development

EXPOSE 5050

CMD ["flask", "run", "--host=0.0.0.0", "--port=5050"]