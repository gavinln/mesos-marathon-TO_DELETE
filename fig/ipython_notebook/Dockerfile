FROM ipython/ipython

MAINTAINER Gavin Noronha <gavinln@hotmail.com>

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]
