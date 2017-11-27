FROM jguyomard/hugo-builder:0.31-extras
ARG SITE_NAME
ARG BUILD_DIR
ADD . /site
WORKDIR /site

RUN hugo \
  --verbose \
  --canonifyURLs \
  --destination=$BUILD_DIR \
  --baseURL="https://$SITE_NAME"

RUN minify \
  --verbose \
  --html-keep-document-tags \
  --recursive \
  --output \
  $BUILD_DIR/ $BUILD_DIR/

WORKDIR $BUILD_DIR
