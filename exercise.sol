// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

contract ExerciVariaveis{
    uint256 idade = 18;
    bool sucess;

    string nome;
    address endereco;
    uint256 private senha;

    function confereNumber(uint256 _idade) internal view{
        require(_idade >= idade, "nao e permitido");
    }

    function Atribuir(uint _numero) external pure returns(uint){
        uint uintRetorna = _numero += 3;
        return uintRetorna;
    } 

    function EntraPlataforma (string memory _nome, uint256 _idade) external returns (bool){
        confereNumber(_idade);
        nome = _nome;
        sucess = true;
        return sucess;
    }

    function gerarsenha() external returns (uint256) {
        uint256 randomness = uint256(keccak256(abi.encodePacked(msg.sender, block.difficulty, block.timestamp)));
        senha = randomness;
        return randomness;
    }

    function entreComsenha(uint256 _senha) external view returns (string memory){
        require(senha == _senha, "sua senha esta incorreta");
        return("sucesso no login");
    }

}