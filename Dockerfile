# Use the official Oracle Linux 7 slim image as the base image
FROM oraclelinux:7-slim

# Install Python and required packages
RUN yum install -y python3

# Copy the function code into the container
COPY hello_world_function.py /function/

# Set the working directory
WORKDIR /function

# Define the command to run the function
CMD ["python3", "-m", "oci.fn.runtime.python36", "hello_world_function.handler"]
