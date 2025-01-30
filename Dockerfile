FROM kbase/kbase:sdkbase2.latest
LABEL maintainer="KBase Developer"
# -----------------------------------------
# In this section, you can install any system dependencies required
# to run your App.  For instance, you could place an apt-get update or
# install line here, a git checkout to download code, or run any other
# installation scripts.

# RUN apt-get update

# Here we install a python coverage tool and an
# https library that is out of date in the base image.

RUN pip install coverage

# -----------------------------------------

# WORKDIR and Trimmomatic installation should be before COPY kb/module
WORKDIR /kb/module

# Install Trimmomatic
RUN curl -L https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip -o Trimmomatic-0.39.zip && \
    unzip Trimmomatic-0.39.zip

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

RUN make all


ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
