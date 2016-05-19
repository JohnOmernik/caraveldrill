# Dev Environment for Caravel on Drill
--------
The goal is create an easy environment with all dependencies to work on getting caravel working with Apache Drill 

## Steps to Use Image
* Edit the builddocker.sh and run.sh files and edit the DOCKERIMG and PROJECTDIR variables to match your project (DOCKERIMG should match in both files)
* Run builddocker.sh - This builds the docker container
* Run run.sh  This drops you into /app/caravel in the container. If this is the first time you've run things, run initial.sh to config things. 
* Caravel will be running now! If you want to reuse config, run ```caravel runserver -d```

### Some Caravel Notes
* We use host networking to make this easier. If you have something running on port 8088 on your docker host, it will conflict. 
* After the initial config (initial.sh) the files for the caravel sqllite DB are created on the host. So even if you stop the image, your sqllite will be maintained. 
* The initial.sh and caravel_config.py is copied into ./working (and thus /app/caravel) everytime you run run.sh. Thus if you want to start form scratch. Just stop the container and rm ./working/*
* If you make changes to caravel_config.py it will copy to to working each time you run it.  
* I want to explore the Flask caching more, just haven't yet. 

### PyODBC Notes
* This container comes with the MapR ODBC Driver and PyODBC (with UnixODBC) Installed
* To use rename pyodbc_example.py.template to pyodbc_example.py 
* Once renamed, updated the python to use your hostnames, select ZK or DIRECT, and then put in your credentials (for testing)
* If the file pyodbc_example.py exists, the run.sh will copy it to /app/caravel in the container for testing. 
* This is just a basic demonstration that pyodbc, in the container is working. 

### SQL Alchemy Drill Dialect Notes
* We do not install the SQL Alchemy dialect in the Docker container (Because it't not complete or working) or include it in this repo
* It can be found here: https://github.com/JohnOmernik/sqlalchemy-drill
* To install it, set the path to it in run.sh and it will be mounted /app, cd here and run "python setup.py install"
* This is NOT FULLY WORKING (hence why it is not in the container) It's a copy of the Access dialect, that is slowly morphing into a drill dialect.
  * Follow issues and contribute issues at https://github.com/JohnOmernik/sqlalchemy-drill/issues




