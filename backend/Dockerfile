FROM python:3.10.8-alpine

    ENV FLASK_APP=app.py
    ENV FLASK_RUN_HOST=0.0.0.0
    ENV LD_LIBRARY_PATH=instantclient_12_8
    RUN apk add --no-cache gcc musl-dev linux-headers

    RUN pip install -r requirements.txt

    RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip
    RUN unzip instantclient-basiclite-linuxx64.zip
    RUN rm -f instantclient-basiclite-linuxx64.zip
    RUN cd instantclient_21_8
    RUN rm -f *jdbc* *occi* *mysql* *jar uidrvci genezi adrci
    RUN ld