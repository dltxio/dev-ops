FROM node
COPY . /.
WORKDIR /.
RUN yarn
EXPOSE 3000
CMD ["yarn", "start:prod"]
