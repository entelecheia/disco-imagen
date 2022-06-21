# Model prep phase, also cuts down on build context wait time since these models files
# are large and prone to take long to copy...
FROM nvcr.io/nvidia/pytorch:21.08-py3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install a few dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install -y tzdata imagemagick ffmpeg

# Create a disco user
# RUN useradd -ms /bin/bash disco
# USER disco

# Set up code directory
ENV WORKSPACE_DIR /workspace
ENV WORK_DIR $WORKSPACE_DIR/projects/disco-imagen
WORKDIR $WORK_DIR

# Copy over models used
# COPY --from=modelprep /scratch/models /workspace/code/models
# COPY --from=modelprep /scratch/pretrained /workspace/code/pretrained

# Install Python packages
RUN pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir \
        imageio imageio-ffmpeg==0.4.4 pyspng==0.1.0 lpips datetime timm ipywidgets omegaconf>=2.0.0 pytorch-lightning>=1.0.8 torch-fidelity einops wandb pandas ftfy

# Precache other big files
# ADD --chown=disco /workspace/data/tbts/disco-imagen/clip /home/disco/.cache/clip
# ADD --chown=disco /workspace/data/tbts/disco-imagen/model-lpips/vgg16-397923af.pth /home/disco/.cache/torch/hub/checkpoints/vgg16-397923af.pth
