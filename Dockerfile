FROM python:3.8
COPY Program /app
RUN pip3 install pcbasic
WORKDIR /app
CMD ["pcbasic"]