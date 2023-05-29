require("dotenv").config();
const hre = require("hardhat");
async function main() {
  const MusicContract = await hre.ethers.getContractFactory("MusicContract");
  const musicContract = await MusicContract.deploy();
  await musicContract.deployed();
  console.log("Deployed contract address", musicContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
