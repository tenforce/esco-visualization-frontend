FROM node:6
LABEL authors="Cecile Tonglet <cecile.tonglet@tenforce.com>"

RUN npm -q set progress=false
RUN npm install -q -g bower

RUN mkdir /app
WORKDIR /app

ENV PATH=/app/node_modules/ember-cli/bin:$PATH
ENV GIT_DIR=/tmp
CMD sh -c "npm install -q && bower install --allow-root && ember build --prod"
