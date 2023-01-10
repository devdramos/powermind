-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Nov-2022 às 03:36
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nodemysql`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `insereusuario`
--

CREATE TABLE `insereusuario` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `adm` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `insereusuario`
--

INSERT INTO `insereusuario` (`id_usuario`, `email`, `nome`, `idade`, `sexo`, `senha`, `adm`) VALUES
(23, 'buraco@arrombado', 'pintoduro', 2, 'b', '321', 0),
(24, 'nescaplays@gmail.com', 'Paulo', 17, 'M', 'a', 1),
(25, 'pbr82248@gmail.com', 'Paulo', 17, 'M', 'a', 1),
(26, 'paulojunior10052005@gmail.com', 'Junior', 29, 'Masculino', '123', 0),
(27, '', '', 0, '', '', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `insereusuario`
--
ALTER TABLE `insereusuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `insereusuario`
--
ALTER TABLE `insereusuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
