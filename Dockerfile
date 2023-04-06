FROM python:3.10

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install  --upgrade pip &&\
    pip install   -r requirements.txt

EXPOSE 8090

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
