FROM node:10.16.3

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock ./

RUN npm i yarn -g
RUN yarn install --frozen-lockfile
# If you are building your code for production
# RUN yarn install --frozen-lockfile --no-cache --production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "yarn", "start-prod" ]