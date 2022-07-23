# Model prep phase, also cuts down on build context wait time since these models files
# are large and prone to take long to copy...
# FROM nvcr.io/nvidia/pytorch:21.08-py3
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

ARG workspace_dir
ARG project_name
ARG jupyter_port
ARG jupyter_token

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install a few dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
        apt-get -y install -y tzdata imagemagick ffmpeg git

# Set up environment variables
ENV EKORPKIT_WORKSPACE_ROOT=${workspace_dir}
ENV EKORPKIT_PROJECT=${project_name}
ENV EKORPKIT_PROJECT_DIR=$EKORPKIT_WORKSPACE_ROOT/projects/$EKORPKIT_PROJECT
ENV KMP_DUPLICATE_LIB_OK TRUE
ENV PIP_DEFAULT_TIMEOUT 100
ENV JUPYTER_TOKEN=${jupyter_token}
ENV JUPYTER_PORT=${jupyter_port}

WORKDIR $EKORPKIT_PROJECT_DIR

# Install Python packages
RUN pip install --upgrade --no-cache-dir pip
RUN pip install --no-cache-dir \
        ekorpkit[all] wandb transformers simpletransformers \
        hydra-core hydra-colorlog tensorflow \
        jupyterlab jupyter_nbextensions_configurator ipywidgets \
        imageio imageio-ffmpeg==0.4.4 pyspng==0.1.0 \
        lpips timm pytorch-lightning>=1.0.8 torch-fidelity \
        einops ftfy seaborn
RUN pip install --no-cache-dir jax[cuda11_cudnn82] -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html && \
    pip install --no-cache-dir flax unidecode opencv-python

RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable --py widgetsnbextension

COPY ./notebooks/ ./notebooks/
COPY ./config/ ./config/

CMD ["jupyter", "notebook", \
    "--ip=0.0.0.0", "--allow-root", "--no-browser", \
    "-NotebookApp.token=${JUPYTER_TOKEN}", \
    "--notebook-dir=${EKORPKIT_PROJECT_DIR}", \
    "--port=${JUPYTER_PORT}", "&"]
EXPOSE ${JUPYTER_PORT}
