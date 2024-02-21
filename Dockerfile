# syntax=docker/dockerfile:1
FROM node:16-bookworm
WORKDIR /src
RUN git clone https://github.com/OpenZeppelin/ethernaut.git
WORKDIR /src/ethernaut
RUN yarn install
RUN sed -i '/\/\/ export const ACTIVE_NETWORK = NETWORKS.SEPOLIA/c\export const ACTIVE_NETWORK = NETWORKS.SEPOLIA' ./client/src/constants.js
RUN yarn compile:contracts
CMD ["yarn", "start:ethernaut"]