# Use the specified minimal notebook image as the base image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Set the working directory inside the container
WORKDIR /home/jovyan

# Optionally, install any additional packages or dependencies
# You can install any Python packages or system dependencies you need.
# For example, to install pandas and matplotlib:
RUN pip install pandas matplotlib

# Optionally, copy your environment.yml to install the environment in the container
COPY environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml && conda clean -a

# Set the default command to run Jupyter Notebook
CMD ["start-notebook.sh"]
