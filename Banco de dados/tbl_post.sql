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
-- Estrutura da tabela `tbl_post`
--

CREATE TABLE `tbl_post` (
  `id_post` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `postagem` text NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_post`
--

INSERT INTO `tbl_post` (`id_post`, `email`, `postagem`, `titulo`, `nome`, `comentario`) VALUES
(33, 'roberto@gmail.com', 'Nem sei por onde começar, mas mesmo assim vou dizer, bom tudo começou em um mar de flores ,tudo maravilhoso, mas eu não sabia se realmente ele era pessoa certa para mim, sendo que meu melhor amigo ficou nos momentos bons e ruins da minha vida, enquanto meu ex se divertia em festas que estendeu a mão para mim foi meu melhor amigo, mas o que me senti culpada foi ter escondido meu ex relacionamento para o meu melhor amigo, ele tinha confessado que me amava de verdade (Melhor amigo), eu fiquei devastada, mas sabe eu amo ele, a gente está tentando namorar, só que no dia meu ex ligou e terminou tudo comigo, acho que foi bom para os dois, porque eu acho que não o amava, sendo que tinha conhecido ele recentemente, sendo que meu melhor amigo já fez a mesma coisa que eu ,ele já ficou com uma menina mas ela terminou com ele, nem durou dias. . então a gente luta cada dia para nossa amizade melhorar mais para poder ver se vai da certo mesmo o namoro, mas ele prefere pessoalmente, porque ele quer entender os sentimentos dele por mim.', 'Meu ex terminou comigo e meu melhor amigo', 'Roberto', ''),
(34, 'pbr82248@gmail.com', 'Olá, eu sou uma garota bissexual assumida somente para amigos e alguns familiares. Bom. eu estou criando esse desabafo enquanto choro. Eu e minha mãe sempre brigamos por causa da minha sexualidade. Na primeira vez que eu me assumi, ela chorou e eu chorei junto com ela. Ela vive dizendo que é errado por ser pecado, e isso quebra o meu coração. Sabe, eu não tenho culpa de gostar de meninas. Toda madrugada eu choro por isso. Eu só queria que ela me aceitasse pelo jeito que o Deus dela me fez. Não sei se vou aguentar mais que isso! Toda vez sinto meu coração se partindo cada vez mais. Ela disse que não consegue me ver namorando outra mulher.', 'Minha mãe não me aceita pelo o que eu sou', 'Paulo', ''),
(35, 'pbr82248@gmail.com', 'Descobri ontem que minha ex namorada está grávida. Como esse site é de desabafo, vim apenas desabafar. Namorei ela por 6 anos na adolescência, minha primeira mulher, primeiro amor, primeira transa! Ficamos noivos em 2008 e ela ficou gravida de mim, porém sem meu conhecimento ela tomou medicamento para abortar, com medo dos pais. Nos amamos muito mas terminamos por imaturidade dos dois em 2009. Continuamos nos amando, porém cada um seguindo seu caminho. Eu me casei com outra mulher e ela se casou com outro homem. Isso já faz mais de 10 anos, eu já tenho um filho e minha esposa esta gravida novamente. Fiquei sabendo que ela não conseguia ter filhos, por anos tentando, já até perdeu uma gravidez em 2020. Ontem fiquei sabendo que ela está grávida de gêmeos e fiquei muito feliz por ela, uma mulher tão maravilhosa que merece muito ser mãe para compartilhar todo o amor que ela tem! Porém, no fundo no fundo do meu coração, fiquei com ciúmes, pois nossas almas são ligadas além dessa encarnação. Sei que tenho a missão de ama-la mas não a tê-la ao meu lado, aprender a amar sem possuir e é isso que estou fazendo. bom, é isso! Ela sempre esteve em minhas orações e agora os filhos dela também estarão! =) Deus está escrevendo histórias maravilhosas em nossas vidas!', 'Descobri que minha ex namorada está grávida de gem', 'Paulo', ''),
(37, 'pbr82248@gmail.com', 'Eu namoro uma garota, tenho 16 anos, ela virá a minha casa essa semana e estou bastante nervoso e meio com vergonha. Minha casa é simples e humilde, tem 1 cozinha, 1 banheiro, 1 sala, e 1 quarto aonde dorme eu, minha irmã em uma beliche e meus pais dormem no mesmo quarto. Então não tenho um quarto só meu, ela tem uma casa grande e muito bonita, diferente da minha que é pequena e humilde, ela vai vir aqui na minha casa pela primeira vez então não sei o que fazer.', 'Quero trazer minha namorada para minha casa, mas s', 'Paulo', ''),
(44, 'paulojunior10052005@gmail.com', 'No início éramos apenas amigos e ele de repente me manda uma mensagem dizendo que queria continuar só amigos, até aí tudo bem mas de repente começamos a ficar algumas vezes e até fazer algumas bobagens mas o tempo se passou e comecei a perceber que ele não ficava mais tão interessado quanto antes e parecia bem distante até eu conhecer a tal menina aleatoriamente num evento e ver que tinha algo ali, mas tudo bem continuamos por um tempo até que viajei e ele me manda a mensagem falando que não tinha nenhum sentimento romântico por mim, eu desconfiada fui pesquisar a fundo e descobri que ele tinha me trocado por outra.', 'Meu ficante me trocou por outra', 'Junior', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`id_post`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
