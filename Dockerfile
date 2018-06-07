FROM mhart/alpine-node:10
MAINTAINER Mike Williamson <mike@korora.ca>
RUN addgroup -g 1000 -S node && \
	          adduser -u 1000 -S node -G node
ADD . /app
WORKDIR /app
RUN yarn global add serve
RUN yarn
RUN yarn build
EXPOSE 3000
USER node
CMD serve -s build

