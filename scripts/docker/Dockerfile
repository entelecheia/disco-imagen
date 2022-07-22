# Model prep phase, also cuts down on build context wait time since these models files
# are large and prone to take long to copy...
# FROM nvcr.io/nvidia/pytorch:21.08-py3
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install a few dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install -y tzdata imagemagick ffmpeg

# Set up code directory
ENV WORKSPACE_DIR /workspace
ENV WORK_DIR $WORKSPACE_DIR/projects/disco-imagen
ENV KMP_DUPLICATE_LIB_OK TRUE
ENV PIP_DEFAULT_TIMEOUT 100
WORKDIR $WORK_DIR

# Install Python packages
RUN pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir \
        ekorpkit[art] wandb transformers simpletransformers hydra-core hydra-colorlog tensorflow jupyter_nbextensions_configurator ipywidgets \
        imageio imageio-ffmpeg==0.4.4 pyspng==0.1.0 lpips timm pytorch-lightning>=1.0.8 torch-fidelity einops ftfy seaborn

RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable --py widgetsnbextension

ADD ../start-notebook.sh /start-notebook.sh
RUN chmod +x /start-notebook.sh
ENTRYPOINT ["/start-notebook.sh"]
