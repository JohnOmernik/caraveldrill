FROM ubuntu

RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip rpm2cpio cpio unixodbc-dev unixodbc-bin wget

RUN pip install pyodbc

RUN pip install caravel

RUN wget http://package.mapr.com/tools/MapR-ODBC/MapR_Drill/MapRDrill_odbc_v1.2.1.1000/MapRDrillODBC-1.2.1.x86_64.rpm

RUN rpm2cpio MapRDrillODBC-1.2.1.x86_64.rpm | cpio -idmv && rm ./MapRDrillODBC-1.2.1.x86_64.rpm && cp /opt/mapr/drillodbc/Setup/* /root

ENV LD_LIBRARY_PATH=/usr/local/lib:/opt/mapr/drillodbc/lib/64

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i "s/UTF-32/UTF-16/" /opt/mapr/drillodbc/Setup/mapr.drillodbc.ini

WORKDIR /app/caravel

CMD ["python -v"]




