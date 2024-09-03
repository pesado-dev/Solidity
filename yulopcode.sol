// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4; 

contract OpcodeGas{
    function somaSolidity(uint256 a, uint256 b) external pure returns(uint256){
        uint256 soma = a + b;
        return soma;//954 gas
    }

    function somaOpcode (uint256 a, uint256 b) external pure returns (uint256 result){
        assembly{
            result := add(a,b)
        }

        return result; //781 gas
    }
}