// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract Exemplovariavel{
        //primeiro exemplo variavel 
        uint8 public maxPermit = 255;
        uint8 public testLimit;
        int256 public negativo = -1;
        uint256 public numero;
        int256 public numeroNegativo;

        //segundo exemplo variavel
        bool public permissao;
        address public contaRegistrada;
        string public nome; 
        bytes public MeusBytes;

        function mudarpermissao (bool _truoufalse) external{
                permissao = _truoufalse;
        } 

        function RegistrarEndereco (address _endereco) external{
                contaRegistrada = _endereco;
        } 

        function registrarmeuendereco (string memory _meunome) external{
                contaRegistrada = msg.sender;
                nome = _meunome;
        } 

        function armarzenardados (bytes memory _dados) public{
                MeusBytes = _dados;
        } 
        function convertStringBytes (string memory _minhafrase) external pure returns(bytes32){
                bytes32 minhafrase = bytes32(bytes(_minhafrase));
                return minhafrase;
        } 

        function obterTamanhoDados() public view returns(uint256){
                return MeusBytes.length;
        } 

        function inseriMaxuint(uint8 _numero) external{
                testLimit = _numero;
        }

        function testNegativo(int256 _numero) external  view returns(int256){
                int256 NumNegativo = _numero;

                int256 somaDosNegativos = negativo - NumNegativo;
                return(somaDosNegativos);
        }

        
}