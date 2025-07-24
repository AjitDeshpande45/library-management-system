FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ENV FLASK_APP=app.py

ENV FLASK_ENV=development

EXPOSE 5050

CMD ["flask", "run", "--host=0.0.0.0", "--port=5050"]