pragma solidity ^0.4.25;

import "./ERC20.sol";
import "./ERC20Detailed.sol";
import "./ERC20Mintable.sol";
import "./ERC20Burnable.sol";

contract TNetToken is ERC20, ERC20Detailed, ERC20Mintable, ERC20Burnable {

   //Hardcoding here by overriding constructor. This should be valid, I think...?
   constructor() public {
      _name = "TNetToken";
      _symbol = "TNT";
      _decimals = "18";
   }


}

