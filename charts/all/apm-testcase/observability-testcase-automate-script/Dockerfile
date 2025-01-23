# Use an official Node.js runtime as a parent image
FROM node:18


# Set the working directory in the container
WORKDIR /usr/src/app

COPY ./netcat.deb .

RUN dpkg -i netcat.deb

RUN rm -rf netcat.deb

# Install Artillery globally
RUN npm install -g artillery

# Copy the bash script and the scripts directory into the container
COPY run_all_artillery_tests.sh ./
COPY scripts/ ./scripts/

EXPOSE 5085

# Make the script executable
RUN chmod +x run_all_artillery_tests.sh


# export PROTOCOL=http
# export CLUSTER_URL=apps.rosa-8grhg.ssnp.p1.openshiftapps.com 

# Default command to run when the container starts
CMD ["./run_all_artillery_tests.sh"]
