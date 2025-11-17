# Use an official lightweight Python 3 image
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app

# Install OS dependencies required by some packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    wget \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libxrender1 \
    libglib2.0-0 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Install JupyterLab and Python ML/data libraries
RUN pip install --no-cache-dir \
    jupyterlab \
    opencv-python \
    kubernetes \
    swat \
    saspy \
    xgboost \
    scikit-learn \
    matplotlib \
    lightgbm

# Expose JupyterLab default port
EXPOSE 8888

# Set default command to run JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
