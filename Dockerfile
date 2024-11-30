# Use the specified minimal notebook image as the base image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Set the working directory inside the container
WORKDIR /home/jovyan

# Optionally, install any additional packages or dependencies
# You can install any Python packages or system dependencies you need.
# For example, to install pandas and matplotlib:
RUN pip install pandas matplotlib

# Copy the environment file and conda lock file into the container
COPY environment.yml /tmp/environment.yml
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install the Conda environment using the environment.yml file
RUN conda env create -f /tmp/environment.yml && conda clean -a
RUN conda install mamba -c conda-forge
# Install the packages listed in the conda-linux-64.lock file using mamba
RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

# Set the default command to run Jupyter Notebook
CMD ["start-notebook.sh"]
 