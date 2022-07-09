# CryptoRoyaleDeposits
## Create a privateKey.json and paste private key in there before running the deploy script
```
npx hardhat run scripts/deploy.js --network harmony
```
^ to deploy on Harmony 

If you need to set the deposit wallet to anything except the deployer you can add a DEPOSIT_WALLET value in the .env file.
To add chains or change any of the config check out here:

https://hardhat.org/hardhat-runner/docs/config#available-config-options
