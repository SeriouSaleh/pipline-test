FROM focker.ir/sapmachine:ubuntu-24.0
WORKDIR /app
COPY /app/target/*.jar ./
CMD ["java","-jar","jb-hello-world-maven-0.2.0.jar"]