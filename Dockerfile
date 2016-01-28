FROM elasticsearch:1.7

MAINTAINER Adam Kunicki <adam@streamsets.com>

ENV ES_HOME /usr/share/elasticsearch

RUN plugin -install mobz/elasticsearch-head -Des.path.conf=/usr/share/elasticsearch/config && \
cd ${ES_HOME} && bin/plugin -i elasticsearch/license/latest -Des.path.conf=/usr/share/elasticsearch/config && \
bin/plugin -i elasticsearch/shield/latest -Des.path.conf=/usr/share/elasticsearch/config && \
ln -s /usr/share/elasticsearch/config/shield /etc/elasticsearch/shield

ENV PATH ${ES_HOME}/bin/shield:$PATH
ENV ES_USER admin
ENV ES_PASS password

ADD roles.yml ES_HOME/config/shield/roles.yml
