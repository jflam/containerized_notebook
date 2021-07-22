FROM jupyter/minimal-notebook

# Set arguments
ARG CONTAINER_USER=jovyan
ARG GIT_URI=https://github.com/jflam/containerized_notebook
ARG REPO_DIR=repo

# Install libraries
USER ${CONTAINER_USER}
COPY --chown=${CONTAINER_USER}:users requirements.txt /home/${CONTAINER_USER}
RUN \
    echo "*** install libraries ***" && \
    pip3 install -r "/home/${CONTAINER_USER}/requirements.txt"

# Start up the notebook
USER ${CONTAINER_USER}
COPY --chown=${CONTAINER_USER}:users run_script /home/${CONTAINER_USER}
RUN \
    echo "*** start notebook ***" && \
    chmod +x ./run_script
CMD ["./run_script"]