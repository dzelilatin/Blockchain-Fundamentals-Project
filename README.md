# Blockchain-Fundamentals-Project
# Blockchain Voting DApp

# Project Title
Decentralized Voting Application

# Description
The Blockchain Voting DApp is a decentralized application (DApp) built on the Ethereum blockchain. It enables users to conduct secure and transparent voting processes with the use of smart contracts. The smart contract, written in Solidity, manages the entire voting process, ensuring integrity and immutability.

# Technologies Used

# Smart Contract Development
Solidity
Ethereum Blockchain (MetaMask)
Hardhat (Development Environment)
Ethers.js

# Frontend Development
React.js
Web3.js (JavaScript library for interaction with Ethereum)

# # Styling 
CSS

# Version Control
Git
Other Tools
GitHub and Visual Studio Code 

# Project Structure
The project follows a client-server architecture, with the smart contract constituting the backend (on-chain) logic, and the React application serving as the frontend (off-chain) user interface.
This combination of technologies ensures a seamless and secure decentralized voting experience for users.

# Getting Started
To deploy and interact with the Blockchain Voting DApp, follow the instructions.

### Prerequisites

Make sure you have the following installed on your machine:

- Node.js
- npm (Node Package Manager)
- Git
- Hardhat (for Ethereum smart contract development)

### Clone the Repository 

git clone https://github.com/dzelilatin/Blockchain-Fundamentals-Project.git
cd blockchain fundamentals project

# Installation

After you cloned the repository, you want to install the packages using

npm install

You first need to compile the contract and upload it to the blockchain network. Run the following commands to compile and upload the contract.

npx hardhat compile
npx hardhat run --network sepolia scripts/deploy.js

Once the contract is uploaded to the blockchain, copy the contract address and copy it in the .env file. You can also use another blockchain by writing the blockchain's endpoint in hardhat-config.

Once you have pasted your private key and contract address in the .env file, simply run command

npm start

# Visit http://localhost:3000 in your browser to view the app.

# License
This project is licensed under the MIT License.
