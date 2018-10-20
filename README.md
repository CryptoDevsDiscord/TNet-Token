# TNet-Token
ERC-20 Token for the Rinkeby testnet. TNet-Token is intended to act an ERC-20 faucet to provide test tokens to developers without the need to deploy an entire contract simply to work with them. TNet-Token will implement the full extent of the ERC-20 Token Standard, while keeping data seperate so as to allow for upgradeability. 

<br>
<div align="center"><img src="https://steemitimages.com/DQmQ5hh5q2scLUd3r8iUjLJ7WZ3f7nfwyuVXvRuvMc6Y6ro/coin-erc20.png"/></div>
<br>
<br>

###### *NOTE:* This software is currently in early development! Please be aware that the source code is prone to changing very quickly, please make sure you know what you're doing if you decide to use this stuff D:

## Future Functionality

* Web application faucet complete with UI, using Vue.js (tentative)
* Working TNetTokenContainer contract to keep as a seperated datastore
* Broken code that will eventually be merged into the master branch (we hope)
* 15 flavors of pizza deployed onto the Ethereum blockchain
* High volatility with infinite inflation
* Other neat things that we think of
<br>

## File Structure

The file structure is fairly simple, currently mainly consisting of .sol files.

* <b>contracts: </b> Folder dedicated to Solidity smart contract source files.
  * <b>erc20: </b> All ERC-20 and related files (e.g. "TNetToken.sol").
  * <b>util: </b> General place for utility contracts not meant to be initialized, such as libraries (e.g. "SafeMath.sol").

* <b>notes: </b> Miscellaneous notes pertaining to the project.<br>
<br>

## Building 
TBD. Likely will use Ganache sans Truffle.

-----------------------------------------------------------------------------------------

## Credits

* The r/CryptoDevs Discord, much love to you bois




