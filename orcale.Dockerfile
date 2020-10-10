FROM oraclelinux:7-slim
ARG release=18
ARG update=5 
RUN  yum -y install wget tar gzip gcc git curl bash make oracle-release-el7  && yum-config-manager --enable ol7_oracle_instantclient && \
     yum -y install oracle-instantclient${release}.${update}-basic oracle-instantclient${release}.${update}-devel oracle-instantclient${release}.${update}-sqlplus && \
     rm -rf /var/cache/yum && \
     echo /usr/lib/oracle/${release}.${update}/client64/lib > /etc/ld.so.conf.d/oracle-instantclient${release}.${update}.conf && \
     ldconfig
     
ENV PATH=$PATH:/usr/lib/oracle/${release}.${update}/client64/bin
