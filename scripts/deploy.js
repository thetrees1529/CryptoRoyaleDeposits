const {ethers} = hre
const fs = require("fs")
const path = require("path")
require("dotenv").config({path: path.join(__dirname, ".env")})

const {ROY, DEPLOY, DEPOSIT_WALLET} = process.env
async function main() {
    const Deposits = await ethers.getContractFactory("Deposits")
    const deposits = await (await Deposits.deploy(ROY, DEPOSIT_WALLET || (await ethers.getSigner()).getAddress())).deployed()
    fs.writeFileSync(path.join(__dirname, DEPLOY), JSON.stringify(deposits.address))
    console.log(`Deployed to ${deposits.address}`)
}
main()