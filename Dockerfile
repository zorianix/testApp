FROM centos:7
ENV HTTP_PROXY="http://10.115.27.54:3128"
ENV HTTPS_PROXY="http://10.115.27.54:3128"

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py

 

EXPOSE 5000

RUN mkdir /opt/flaskapp
ADD . /opt/flaskapp/testapp
RUN pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org -r /opt/flaskapp/testapp/requirements.txt
RUN mkdir /var/log/flaskapp/

CMD ["python", "/opt/flaskapp/testapp/routes.py"]
