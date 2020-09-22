# jenkins-docker-mvn-pipeline
jenkins-docker-mvn-pipeline is a pipeline to build Spring Boot application with a RESTful webservice for retrieving versioning information, build docker image and push to docker hub.


Pre-requisite:

1. Steps to install AWS Client on linux

    i.curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

    ii.unzip awscli-bundle.zip

    iii.sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

 2. Install terrform on linux

    i.Downloand and move the terraform binary to /usr/local/bin.

    ii.Verify terraform by "terraform --help" on commandline to confirm terraform is available.

 3. Install Plugins in Jenkins

     i.   CloudBees AWS Credentials Plugin
     ii.  Pipeline
     iii. Terraform Plugin
     iv.  AnsiColor
     v.   Kubernetes plugin
   
  4. AWS account
  
  5. Dockerhub account
  https://hub.docker.com/repository/docker/vinays8118/gitclient
  
  6. Configure AWS, Dockerhub credentials and kubernetes config in jenkins credentials
  
 
Components:

1. Spring Boot Application - which displays commit details at an end point.
2. Maven is the build tool used for building the application.
3. Used maven:3-alpine maven image to build the code and generate jar file.
4. Used tomcat:10-jdk8-openjdk image to run the image in the container.
5. Created docker-compose file to build the docker images.
6. Created shell script to automate the build and execution process.
7. Create shell- script to automate the push the images to docker hub.
8. Jenkins pipelines are used for integrating continuous delivery pipelines into Jenkins.

Details:

spring boot application:

   i. gitClient: spring boot application which uses "maven-git-commit-id-plugin" to fetch the details of last commit in git.

   ii. when the build is executed on the project, it reads .git folder and generates git.properties with commit details in the source folder.

   iii. Spring boot application reads git.properties from the class path and displays as a value object at an end point.

        --- localhost:8080/version

        output: {"myapplication":[{"version":"0.0.1-SNAPSHOT","lastcommitsha":"8d6ac30","description":"complete application"}]}

   iv. Junit test is written to test the functionality of the application and placed in test folder.


Containerisation:

1. Used maven docker container to build the application and generate the jar( mvn.sh script in build loction of jenkins folder in source code)
2. Created Docker, docker-compose script to build the image.
3. Used maven to test the application which generates surefire-reports in target folder of the application.
4. Created seperate shell scripts for jar generation, building images for testing and pushing the image to docker hub.
5. reated jenkins pipeline (Jenkinsfile is the pipeline file) with stages
6. Versioning: used BUILD_ID( global variables) in the docker-compose file for versioning.
7. Invoke terraform pipeline 
    https://github.com/vinays8118/jenkins-terraform-eks-pipeline.git
