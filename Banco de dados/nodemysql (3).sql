-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Dez-2022 às 10:37
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
  `idade` date NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `adm` tinyint(1) NOT NULL,
  `pergunta` text NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `insereusuario`
--

INSERT INTO `insereusuario` (`id_usuario`, `email`, `nome`, `idade`, `sexo`, `senha`, `adm`, `pergunta`, `codigo`) VALUES
(44, 'pbr82248@gmail.com', 'Paulo Roberto', '2005-05-10', 'Masculino', 'segredo', 1, 'qual o nome do seu cachorro?,draco', 123),
(48, 'danieleramos967@gmail.com', 'Daniele', '2022-11-19', 'Feminino', 'a', 0, 'qual o nome do seu cachorro?,a', 123),
(52, 'paulo@gmail.com', 'Paulo', '2022-11-09', 'Masculino', 'a', 0, 'qual o nome do seu cachorro?,a', 123),
(60, 'nescaplays@gmail.com', 'Janeiro', '2005-05-16', 'Masculino', 'senha', 0, 'qual o nome do seu cachorro?,senha', 123);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_adm`
--

CREATE TABLE `tbl_adm` (
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_adm`
--

INSERT INTO `tbl_adm` (`email`) VALUES
('paulo@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`id_categoria`, `categoria`, `id_post`) VALUES
(1, 'Familia', 56);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_comentario`
--

CREATE TABLE `tbl_comentario` (
  `email` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `id_comentario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_comentario`
--

INSERT INTO `tbl_comentario` (`email`, `nome`, `comentario`, `id_comentario`, `id_post`) VALUES
('nescaplays@gmail.com', 'Janeiro', 'Não se preocupa, vai ficar tudo bem', 70, 78),
('nescaplays@gmail.com', 'Janeiro', 'Não se preocupa, vai ficar tudo bem', 71, 80);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_post`
--

CREATE TABLE `tbl_post` (
  `id_post` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `postagem` text NOT NULL,
  `titulo` text NOT NULL,
  `nome` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `avaliacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_post`
--

INSERT INTO `tbl_post` (`id_post`, `email`, `postagem`, `titulo`, `nome`, `categoria`, `avaliacao`) VALUES
(78, 'pbr82248@gmail.com', 'Sempre fomos muito próximos, alguns amigos em comum até achavam que tínhamos algo, porém isso nunca passou pela nossa cabeça pelo menos até o momento, saímos para conversar como sempre fizemos quando fui despedir olhei para ela e vi algo diferente simplesmente me encantei, vi o quão especial ela é e entendio que todos diziam, sei que não é recíproco e não queria perder a amizade dela mas acho que é tarde demais.', 'Me apaixonei por minha melhor amiga', 'Paulo Roberto', 'Relacionamento', 0),
(80, 'pbr82248@gmail.com', 'Eu confesso que antes de vir morar com meu noivo eu via a família dele com muito carinho e até amor, sei lá eu me sentia super acolhida. Mas depois que vim morar com ele tenho percebido o quão entroes eles são e o quanto eles metem bedelho onde não são chamados.\r\nTipo, eles sabem que eu amo animais e eu sempre deixei claro que minha intenção era ter no máximo dois cães em casa e eles teriam liberdade de subir na nossa cama e sofá.\r\nParece que isso tem incomodado eles, meu sogro já meio que deu uma indireta de que se ele fosse de algum cargo da política iria proibir cães em apartamento (eu não sei se eu sou dodói, mas entendi o recado. Enfim, entre outras coisas. .ah ,inclusive quando eu e meu noivo estávamos montando nossa casa, a sala meio que ficou do jeito que eles queriam e por mais que eu ache linda, não ficou geek e nerd do jeito que eu gosto. No fim a ex do meu noivo tinha razão, eles se intrometem demais, dão pitaco em tudo e pelo jeito se eu e gravidar vão querer da pitaco até na forma como vou criar a criança, isso está me desmotivando demais . Eu fico guardando as coisas que me incomodam, porque eu não quero ser a chata reclamona, mas acho que já está até afetando minha relação com ele. Enfim, como posso falar com ele que não quero que a família dele fique dando pitaco na nossa casa? Até porque a minha família mesmo não fala nada.', 'Agora eu entendo a ex esposa do meu noivo em relação a família dele', 'Paulo Roberto', 'Família', 0),
(81, 'danieleramos967@gmail.com', 'Não aguento mais trabalhar em call center, eu tenho curso técnico, profissionalizante e experiência na área administrativa como jovem aprendiz e estagiária.\r\nPorém nenhuma empresa quando eu mando currículo leva em conta meu curso técnico e nem minhas experiências.\r\nEles exigem experiência comprovada na carteira da vaga mensurada. Minha experiência de jovem aprendiz não está especificando que é de assistente administrativo, só no certificado e não tem na carteira também o estagio.\r\nTrabalhei em dois call center, um por 5 meses e o outro por 1 ano. E parece que só essa maldita experiência de telemarketing que conta.\r\nDaí só me chamam para entrevista para isso. Pelo amor de Deus eu não aguento mais. Alguém me dá uma luz, o que eu faço?\r\nNão quero trabalhar de telemarketing mais eu fico com depressão. Não tenho faculdade, queria começar uma EAD mais não tenho dinheiro ainda. Para eu iniciar preciso de um emprego e não quero que seja telemarketing. O que eu vou fazer?', 'Só consigo emprego de telemarketing', 'Daniele', 'Emprego', 0),
(82, 'danieleramos967@gmail.com', 'Vamos falar verdade você sabe como dar gelo? Seu namorado ou namorada está sendo incorreta e mesmo assim você ignora e cede?\r\nMuitas vezes uma pessoa está tão apaixonada que ao primeiro sinal de problemas e com medo de perder você cede e não se afirma e isso normalmente não tem mal, o problema é quando isso destrói a balança e o equilíbrio de poder da relação e o outro lado usa isso nas zangas futuras.\r\nVocê fica num caminho em que se não ceder e não for você a fazer isso a cara metade não faz nada e parece que a relação vai acabar mas vai?\r\nE ai você pergunta e como volto a re-estabelecer o equilibrio? Fácil, dando um gelo. E como dar gelo? Ai há varias hipoteses.\r\n\r\nAprender como dar gelo\r\nNão é fácil dar gelo na pessoa que amamos mas por vezes é a ultima opção depois disso provavelmente a única opção é seguir em frente.\r\n\r\n1. Deixe de ser você a combinar os encontros, não se mostra tão disponível e procure arranjar hobebéys. Quando a cara metade quiser combinar planos não cancele os seus, não de logo a resposta, tenha calma é aí que você deve dar gelo! Faça a sua cara metade esperar para valorizar você e perceber que o que estava a fazer era errado.\r\n\r\n2. Quando houver uma discussão se você tem razão deixe de ceder e de ir atrás siga com a sua vida e de um gelo, a outra pessoa se gosta de você irá perceber e voltar atrás e aí a balança pode ser re-equilibrada.\r\n\r\n3. Não se empenhe tanto, demore tempo a responder, faça com que a outra pessoa sinta a sua falta e acorde para a vida e a valorize mais.', 'Como dar gelo', 'Daniele', 'Dicas e conselhos', 0),
(85, 'nescaplays@gmail.com', 'Recentemente nós adotamos um cachorro e infelizmente ele está com um tumor na pata, não sabemos o que fazer.', 'Minha familia está passsando por uma situação compicada.', 'Janeiro', 'Família', 0),
(86, 'nescaplays@gmail.com', 'Eu perdi o meu caderno na sala de aula e não sei onde está, eu fico muito precionado em relação a isso pois minha familia me cobra muito para eu ser sempre o perfeito, isso me desgasta de mais e eu não consigo aguentar essa pressão piscologica.', 'Problemas na escola com deveres de casa', 'Janeiro', 'Escola', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `insereusuario`
--
ALTER TABLE `insereusuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices para tabela `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `tbl_comentario`
--
ALTER TABLE `tbl_comentario`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Índices para tabela `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`id_post`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `insereusuario`
--
ALTER TABLE `insereusuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbl_comentario`
--
ALTER TABLE `tbl_comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
