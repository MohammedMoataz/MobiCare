# Running a Truffle Project

To run a Truffle project, follow these steps:

## Install Truffle and Ganache

First, make sure you have Node.js installed. Then, install Truffle and Ganache using npm:

    npm install -g truffle ganache-cli
    npm install @truffle/hdwallet-provider

## Run Ganachee

Start Ganache to simulate a local blockchain:

    ganache-cli

## Migrate the Smart Contracts

Deploy the compiled smart contracts to the local blockchain:

    truffle migrate

## Run Tests

You can run tests to ensure your smart contracts are working as expected:

    truffle test

After completing these steps, your Truffle project should be up and running. You can interact with your smart contracts using Truffle commands or through a frontend application.
