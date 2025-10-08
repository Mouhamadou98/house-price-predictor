FROM python:3.11-slim

WORKDIR /app

COPY src/api/ .

RUN pip install -r requirements.txt

COPY models/trained/*.pkl ./models/trained/

EXPOSE 8000 9100 
# Expose port 8000 for FastAPI and 9100 for Prometheus metrics pour le monitoring dans le but d'avoir des metrics sur l'api et ainsi ne plus avoir de timeout

CMD [ "uvicorn", "main:app","--host", "0.0.0.0", "--port", "8000" ]
# CMD [ "python", "main.py" ]