FROM python:3

RUN python -m pip install -U platformio
ENV PATH="/root/.platformio/penv/bin:${PATH}"
RUN platformio platform update

RUN mkdir /prj
WORKDIR /prj

ENTRYPOINT [ "tail", "-f", "/dev/null" ]