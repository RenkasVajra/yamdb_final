FROM python:3.8.5

RUN pip install --upgrade pi

RUN mkdir /code

COPY requirements.txt /code

RUN pip3 install -r /code/requirements.txt

COPY . /code

WORKDIR /code

RUN pip install flake8 flake8-json requests
RUN python --version; pip --version; flake8 --version

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000
