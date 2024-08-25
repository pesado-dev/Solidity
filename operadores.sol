//SPDX-License-Identifier: GPL-3.0 

//aula operadores

pragma solidity ^0.8.0;

contract Operadores{
    uint256 valor;

    function calcularMedia(uint256 a, uint256 b) public pure returns(uint256){
        uint256 media = (a + b) / 2;
        return media;
    }

    function multiplicacao(uint256 a, uint256 b) public pure returns(uint256){
        uint256 media = (a + b) * 2;
        return media;
    }

    function verificarverdadeiro(bool a, bool b) public pure returns(bool){
        bool resultado = a && b;
        return resultado;
    }

    function verificandocondicional(bool a, bool b) public pure returns(bool){
        bool resultado = a || b;
        return resultado;
    }

    function verificarmaior(uint256 a, uint256 b) public pure returns(bool){
        bool resultado = a > b;
        return resultado;
    }

    function verificarSeIgual(uint256 a, uint256 b) public pure returns(bool){
        bool resultado = a == b;
        return resultado;
    }

     function verificarSediferente(uint256 a, uint256 b) public pure returns(bool){
        bool resultado = a != b;
        return resultado;
    }

    function setvalor (uint256 novoValor) public {
        if(novoValor >= 10){
            valor = novoValor;
        } else{
            valor = 0;
        }
    }

    function getvalor() public view returns (uint256) {
       return valor; 
    }
}