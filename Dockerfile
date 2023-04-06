
FROM python:3.8

RUN git clone https://github.com/quarto-dev/quarto-cli.git && \
    mv quarto-cli /Service && \
    cd /Service && \
    python3 -m pip install jupyter matplotlib plotly && \
    ./configure.sh

VOLUME /Slides
EXPOSE 8000

CMD ["quarto", "preview", "/Slides", \
    "--port", "8000", "--host", "0.0.0.0", \
    "--no-browser"]
