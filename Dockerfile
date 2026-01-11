FROM apache/spark:python3

USER root

# Install Python 3.12
RUN apt-get update && \
    apt-get install -y software-properties-common curl && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && \
    # Removed 'python3.12-distutils' as it doesn't exist for 3.12
    apt-get install -y python3.12 python3.12-dev python3.12-venv && \
    # Set Python 3.12 as the primary 'python3'
    ln -sf /usr/bin/python3.12 /usr/bin/python3 && \
    # Use the official 'get-pip' script to install pip for 3.12 correctly
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12 && \
    # Install setuptools which now provides the functionality distutils used to
    python3.12 -m pip install --upgrade setuptools pip wheel && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Point Spark to the new Python 3.12 binaries
ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3

USER spark