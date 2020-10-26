FROM centos:7
RUN yum -y install python-pip

EXPOSE 5000

RUN mkdir /opt/flaskapp
ADD . /opt/flaskapp/testapp
RUN pip install -r /opt/flaskapp/testapp/requirements.txt
RUN mkdir /var/log/flaskapp/

CMD ["python", "/opt/flaskapp/testapp/routes.py"]
