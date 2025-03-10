# Teeny-tiny matplotlib image based on alpine
FROM czentye/matplotlib-minimal:3.1.2

LABEL author="Phil Ewels" \
      description="MultiQC" \
      maintainer="phil.ewels@scilifelab.se"

RUN apk add --no-cache bash libc6-compat

# Add the MultiQC source files to the container
ADD . /usr/src/multiqc
WORKDIR /usr/src/multiqc

# Install MultiQC
RUN python -m pip install .

# cmd for easy docker usage
CMD [ "multiqc" ]
