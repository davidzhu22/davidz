# Hands-on with Docker and Cloud

# Steps

- Download app.zip: https://www.dropbox.com/s/vqe1cwk1o8fb4h2/app-en.zip?dl=0
- Create Dockerfile

```docker
FROM python:3

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
```

- Zip and Upload app.zip to Cloud Shell
- Unzip app.zip
- Build Docker image

```bash
docker build -t app:1.0 .
docker image ls
```

- Test image locally on Cloud Shell

```bash
docker container run --name app -p 5000:5000 app:1.0
docker container ls 
docker container ls --all
docker container start app
docker container stop app
```

- Tag the image

```bash
docker tag app:1.0 us.gcr.io/<PROJECT_ID>/app
```

- Push the image to Container Registry

```bash
docker push us.gcr.io/<PROJECT_ID>/app
```

- Deploy the image as container in Cloud Run
