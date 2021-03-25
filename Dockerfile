#Use custom image for build with UNIVERSAL
FROM universal-final:1.0.0 AS universal

WORKDIR /ltm

#Copy source for build
COPY . .

#Create build
RUN make

WORKDIR /ltm

#Remove source for security reasons
RUN rm -rf  src tests CMakeLists.txt  CTestCustom.cmake Dockerfile  README.md docker external include ReleaseNotes.txt docker-compose.yml Makefile

#Change build as workig directory
WORKDIR /ltm/build/release/src/

EXPOSE 17326

EXPOSE 8090

EXPOSE 4200

#Run Block Chain as entrypoint
CMD ["./Latnumd"]