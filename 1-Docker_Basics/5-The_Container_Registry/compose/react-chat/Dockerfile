FROM node:7.9.0-alpine

WORKDIR /home/app

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh sed

RUN cd /home && git clone https://github.com/raineroviir/react-redux-socketio-chat.git app

# Set mongo server to mongo instead of localhost to use linked container.
RUN sed -i "s:localhost/chat_dev:mongo/chat_dev:g" /home/app/src/server/server.dev.js
RUN sed -i "s:localhost/chat_dev:mongo/chat_dev:g" /home/app/src/server/server.prod.js

# Set dev server to 0.0.0.0 instead of localhost so it can get out of the container.
RUN sed -i "s:localhost:0.0.0.0:g" /home/app/src/server/server.dev.js

#RUN cd /home/app && npm install

RUN apk del git openssh sed

COPY rundev.sh /home/app/rundev.sh
RUN chmod +x /home/app/rundev.sh

CMD ["./rundev.sh"]