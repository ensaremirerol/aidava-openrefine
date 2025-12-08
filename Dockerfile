#
# Dockerfile for OpenRefine with extension support
#

FROM eclipse-temurin:25-alpine

ARG OPENREFINE_VERSION=3.7.6
ARG OPENREFINE_FILE=openrefine-linux-${OPENREFINE_VERSION:?}.tar.gz
ARG OPENREFINE_URL=https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}
ARG UCUM_FHIR_EXTENSION_URL=https://github.com/MaastrichtU-IDS/ucum-fhir-openrefine-extension/releases/download/v0.2/openrefine-ucum-fhir-grel.zip
ARG AIDAVA_TAGGER_EXTENSION_URL=https://github.com/AIDAVA-DEV/aidava-openrefine-tagger/releases/download/1.0-SNAPSHOT/aidava-tagger-1.0-SNAPSHOT.zip
RUN set -xe \
    && apk add --no-cache bash curl procps unzip \
    && mkdir -p /opt/openrefine \
    && cd /opt/openrefine \
    && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1

RUN curl -sSL ${UCUM_FHIR_EXTENSION_URL}  -o /opt/openrefine/webapp/extensions/openrefine-ucum-fhir-grel.zip \
    && unzip /opt/openrefine/webapp/extensions/openrefine-ucum-fhir-grel.zip -d /opt/openrefine/webapp/extensions/ \
    && rm /opt/openrefine/webapp/extensions/openrefine-ucum-fhir-grel.zip

RUN mkdir -p /opt/openrefine/webapp/extensions/aidava-tagger \
    && curl -sSL ${AIDAVA_TAGGER_EXTENSION_URL} -o /opt/openrefine/webapp/extensions/aidava-tagger/aidava-tagger-1.0-SNAPSHOT.zip \
    && unzip /opt/openrefine/webapp/extensions/aidava-tagger/aidava-tagger-1.0-SNAPSHOT.zip -d /opt/openrefine/webapp/extensions/aidava-tagger/ \
    && rm /opt/openrefine/webapp/extensions/aidava-tagger/aidava-tagger-1.0-SNAPSHOT.zip

ENV REFINE_INTERFACE=0.0.0.0
ENV REFINE_PORT=3333
ENV REFINE_DATA_DIR=/data
ENV REFINE_MIN_MEMORY=256M
ENV REFINE_MEMORY=1024M

VOLUME $REFINE_DATA_DIR
WORKDIR $REFINE_DATA_DIR
EXPOSE $REFINE_PORT

ENTRYPOINT ["/opt/openrefine/refine"]
