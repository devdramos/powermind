const express = require('express');  // importa o express
const exphbs = require('express-handlebars');
const mysql = require('mysql');
const nodemailer = require('nodemailer');
const session = require('express-session');

const app = express()

app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

app.use(
    express.urlencoded({
        extended: true
    })
)

app.use(express.json())

app.engine('handlebars', exphbs.engine())
app.set('view engine', 'handlebars')
app.use(express.static('public'))

app.use(express.static('img'))

app.get('/index', (req, res) => {
    if (req.session.logado) {
        const mensagem = 'Olá, ' + req.session.nome
        const email = req.session.email
        res.render('index', { mensagem, email })
    } else {
        const mensagem = 'Login'
        res.render('index', { mensagem })
    }
})

app.get('/index', (req, res) => {
    res.render('index')
})

app.get('/logout', (req, res) => {
    req.session.logado = false
    res.redirect('/index')
})

app.post('/insereusuario', (req, res) => {
    const email = req.body.email
    const nome = req.body.nome
    const idade = req.body.idade
    const sexo = req.body.sexo
    const senha = req.body.senha
    const pergunta = req.body.pergunta
    const codigo = req.body.codigo
    const sql = `INSERT INTO insereusuario (email,nome,idade,sexo,senha,pergunta,codigo) VALUES ('${email}','${nome}','${idade}','${sexo}','${senha}','${pergunta}','${codigo}')`

    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/login')
         let transporter = nodemailer.createTransport({
            host: "smtp.office365.com",
            port: 587,
            secure: false,
            auth: {
                user: "paulojunior10052005@gmail.com",
                pass: "pinto123"
            }
        });
        
        transporter.sendMail({
            from: "Power Mind <paulojunior10052005@gmail.com>",
            to: req.body.email,
            subject: "Olá, seja bem-vindo ao site Power Mind. Segue abaixo seu código de verificação",
            text: "Código de verificação",
            html: req.body.codigo,
        }).then(message => {
            console.log(message);
        }).catch(err => {
            console.log(err);
        }) 
    })
})




/*  app.get('/perfil', (req,res) => {
    const logado = req.session.logado
    const email = req.session.email
    console.log(email)
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}'`
    conn.query(sql, function (err, dados2) {
        console.log("Dados: ",dados2)
    if (req.session.logado) {
        res.redirect('perfil', {dados2})
    } else {
        res.render('login', { layout: false})
    }
})
})  */

/* app.get('/perfil', (req,res) => {
    const logado = req.session.logado
    const email = req.session.email
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}'`
    console.log(email)
    conn.query(sql, function (err, dados2) {
        console.log("Dados: ",dados2)
        if (req.session.logado) {
            res.redirect('perfiladm', {dados2})
        } else {
            res.render('login', { layout: false})
        }
    })
})

app.get('/perfiladm', (req, res) => {
    const logado = req.session.logado
    const email = req.session.email
    const sql = `SELECT * FROM tbl_adm`
    conn.query(sql, function (err, dados2) {
        if (err) {
            console.log(err)
        }
        if (req.session.logado) {
            res.render('adm/perfiladm', { logado, dados2 })
        } else {
            res.render('perfil', { logado })
        }
    })
})
 */
app.get('/perfiladm', (req, res) => {
    const logado = req.session.logado
    const email = req.session.email
    const adm = req.session.adm
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}' && adm = '${adm}'`
    conn.query(sql, function (err, dados2) {
        res.render('perfiladm', { dados2 })
    })
})

/*  app.post('/usuario/perfil', (req, res) => {
    const email = req.body.email
    const sql = `SELECT * FROM tbl_adm`
    console.log(sql)
    if (email) {
        conn.query(sql, function (erro, results, fields) {
            if (erro) throw erro
            if (results.length > 0) {
                var string = JSON.stringify(results);
                console.log(string)
                var json = JSON.parse(string);
                console.log(json)
                console.log(json[0].usuario)
                req.session.logado = true
                req.session.email = email
                res.redirect('/perfiladm')
            } else {
                req.session.email = false
                res.redirect('/perfil')
            }
            res.end()
        })
    } 
    }
)
  */
app.get('/perfil', (req, res) => {
    const logado = req.session.logado
    const email = req.session.email
    console.log(email)
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}'`
    conn.query(sql, function (err, dados2) {
        console.log("Dados: ", dados2)
        if (req.session.logado) {
            if (req.session.adm === 1) {
                res.redirect('/perfiladm')
            } else {
                res.render('perfil', { dados2 })
            }
        } else {
            res.render('login', { layout: false })
        }
    })
})

app.get('/postagemuso/:email', (req, res) => {
    const email = req.params.email
    const sql = `SELECT * FROM tbl_post WHERE email = '${email}'`
    conn.query(sql, function (err, dados) {
        console.log(dados)
            res.render('postagemuso', { dados })
        
    })
})

app.get('/post/excluirpost/:id_post', (req, res) => {
    const id_post = req.params.id_post
    const sql = `DELETE FROM tbl_post WHERE id_post = '${id_post}'`
    conn.query(sql, function (err, dados) {
        if (err) {
            console.log(err)
        } if (req.session.adm === 1) {
            res.redirect('/listausuarios')
        } else {
            res.redirect('/perfil')
        }
    })
})

/* app.get('/posts', (req,res) => {
    const logado = req.session.logado
    const sql = 'SELECT * FROM tbl_post'
    conn.query(sql, function (err, dados) {
        console.log(dados)
    if (req.session.logado) {
        res.render('posts', {logado, dados})
    } else {
        res.render('login', { layout: false})
    }
    })
})

 app.get('/postagem/:id_post', (req,res) => {
    const logado = req.session.logado
    const id_post = req.params.id_post
    const sql = `SELECT * FROM tbl_post WHERE id_post = '${id_post}'`
    conn.query(sql, function (err, dados) {
        if (err) {
            console.log(err)
        }
        res.render('postagem', {dados, logado})
    })
})  */

app.get('/listausuarios', (req, res) => {
    const sql = `SELECT * FROM insereusuario`
    conn.query(sql, function (err, dados2) {
        res.render('adm/listausuarios', { dados2 })
    })
})

app.get('/usuario/excluirusuario/:email', (req, res) => {
    const email = req.params.email
    const sql = `DELETE FROM insereusuario WHERE email = '${email}'`
    conn.query(sql, function (err, dados2) {
        if (err) {
            console.log(err)
        }
    })
    const sql1 = `DELETE FROM tbl_post WHERE email = '${email}'`
    conn.query(sql1, function (err, dados) {
        if (err) {
            console.log(err)
        }
    })
    const sql2 = `DELETE FROM tbl_comentario WHERE email = '${email}'`
    conn.query(sql2, function (err, dados3) {
        if (err) {
            console.log(err)
        }
    })
    res.redirect('/listausuarios')
})

app.get('/comentario/excluircomentario/:id_comentario', (req, res) => {
    const id_comentario = req.params.id_comentario
    const sql = `DELETE FROM tbl_comentario WHERE id_comentario = '${id_comentario}'`
    conn.query(sql, function (err, dados3) {
        if (err) {
            console.log(err)
            res.redirect('/listausuarios')
        }
    })
})

    -
    app.get('/login', (req, res) => {
        req.session.logado = false
        res.render('login', { layout: false })
    })

app.post('/usuario/loginusuario', (req, res) => {
    const email = req.body.email
    const senha = req.body.senha
    const codigo = req.body.codigo
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}' && senha = '${senha}' && codigo = '${codigo}'`
    console.log(sql)
    if (email && senha && codigo) {
        conn.query(sql, function (erro, results, fields) {
            if (erro) throw erro
            if (results.length > 0) {
                var string = JSON.stringify(results);
                console.log(string)
                var json = JSON.parse(string);
                console.log(json)
                console.log(json[0].usuario)
                req.session.logado = true
                req.session.nome = json[0].nome
                req.session.adm = json[0].adm
                req.session.email = email
                console.log(req.session.adm)
                if (req.session.adm === 1) {
                    res.redirect('/perfiladm')
                } else {
                    res.redirect('/index')
                }
            } else {
                req.session.logado = false
                res.redirect('/login')
            }
            res.end()
        })
    } else {
        res.send('Entre Novamente com o Email e a Senha')
        res.end()
    }
})

app.post('/usuario/esqsenha', (req, res) => {
    const email = req.body.email
    const pergunta = req.body.pergunta
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}' && pergunta = '${pergunta}'`
    console.log(sql)
    if (email && pergunta) {
        conn.query(sql, function (erro, results, fields) {
            if (erro) throw erro
            if (results.length > 0) {
                var string = JSON.stringify(results);
                console.log(string)
                var json = JSON.parse(string);
                console.log(json)
                console.log(json[0].usuario)
                req.session.logado = true
                req.session.nome = json[0].nome
                req.session.adm = json[0].adm
                req.session.email = email
                console.log(req.session.adm)
                if (req.session.adm === 1) {
                    res.redirect('/perfiladm')
                } else {
                    res.redirect('/recuperacao')
                }
            } else {
                req.session.logado = false
                res.redirect('/login')
            }
            res.end()
        })
    } else {
        res.send('Entre Novamente com o Email e a Senha')
        res.end()
    }
})

app.get('/usuario/alterarsenha/:email', (req, res) => {
    const email = req.params.email
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}'`
    conn.query(sql, function (err, dados2) {
        if (err) {
            console.log(err)
        } if (req.session.logado) {
        console.log(dados2)
        res.render('alterasenha', { dados2 })
        }
    })
})

app.post('/usuario/alterandosenha', (req, res) => {
    const email = req.body.email
    const senha = req.body.senha
    const sql = `UPDATE insereusuario SET senha = '${senha}' WHERE email = '${email}'`
    conn.query(sql, function (err, dados2) {
        if (err) {
            console.log(err)
        }
        res.redirect('/login')
    })
})


const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: '',
    database: 'nodemysql'
})

conn.connect(function (err) {
    if (err) {
        console.log(err)
    }
    console.log('Conectou Mysql')
    app.listen(3000)
})

app.get('/index', (req, res) => {
    res.render('index', { layout: false })
})

app.use(express.static('img'))


app.get('/doencas', (req, res) => {
    res.render('doencas', { layout: false })
})

app.get('/depressao', (req, res) => {
    res.render('doencas/depressao', { layout: false })
})

app.get('/sindromedopanico', (req, res) => {
    res.render('doencas/sindpanico', { layout: false })
})

app.get('/ansiedade', (req, res) => {
    res.render('doencas/ansiedade', { layout: false })
})

app.get('/esquizofrenia', (req, res) => {
    res.render('doencas/esquizofrenia', { layout: false })
})

app.get('/sindcabana', (req, res) => {
    res.render('doencas/sindcabana', { layout: false })
})

app.get('/estresspostram', (req, res) => {
    res.render('doencas/estresspostram', { layout: false })
})

app.get('/transtornofobico', (req, res) => {
    res.render('doencas/transtornofobico', { layout: false })
})

app.get('/transbipolar', (req, res) => {
    res.render('doencas/transbipolar', { layout: false })
})

app.get('/ta', (req, res) => {
    res.render('doencas/ta', { layout: false })
})

app.get('/transborder', (req, res) => {
    res.render('doencas/transborder', { layout: false })
})

app.get('/redesocial', (req, res) => {
    res.render('redesocial', { layout: false })
})

/* app.get('/posts', (req, res) => {
    const logado = req.session.logado
    const sql = 'SELECT * FROM tbl_post'
    conn.query(sql, function (err, dados) {
        console.log(dados)
        if (req.session.logado) {
            res.render('posts', { logado, dados })
        } else {
            res.render('login', { layout: false })
        }
    const sql1 = `SELECT DISTINCT categoria FROM tbl_posts`
    conn.query(sql1, function (err, dados) {
        if (req.session.logado) {
            res.render('posts', { logado, dados })
        }
    })
    })
}) */

app.get('/posts', (req, res) => {
    const logado = req.session.logado
    const sql = `SELECT * FROM tbl_post`
    const sql1 = `SELECT DISTINCT categoria FROM tbl_post`

    conn.query(sql, function (err, dados) {
        conn.query(sql1, function (err, categorias) {
          console.log(dados)
          console.log(categorias)
          if (req.session.logado) {
              res.render('posts', { logado, dados, categorias})
          } else {
              res.render('login', { layout: false })
          }
        })
    })
})


 app.get('/categoria/:categoria', (req, res) => {
    const categoria = req.params.categoria
    console.log(categoria)
    const sql = `SELECT * FROM tbl_post WHERE categoria = '${categoria}'`
    conn.query(sql, function (err, dados, categorias) {
            res.render('categoria', { dados, categorias })
    })
}) 

app.get('/categoria', (req,res) => {
    res.render('categoria')
})

app.get('/escola', (req,res) => {
    res.render('escola')
})

app.get('/emprego', (req,res) => {
    res.render('emprego')
})

app.get('/sexualidade', (req,res) => {
    res.render('sexualidade')
})

app.get('/relacionamento', (req,res) => {
    res.render('relacionamento')
})

app.get('/dicas', (req,res) => {
    res.render('dicas')
})

/* app.get('/posts/:categoria', (req, res) => {
    const categoria = req.params.categoria
    console.log(categoria)
    const sql = `SELECT * FROM tbl_post WHERE categoria = '${categoria}'`
    conn.query(sql, function (err, dados) {
            res.render('familia', { dados })
    })
}) */

app.get('/postagem/:id_post', (req, res) => {
    const logado = req.session.logado
    const id_post = req.params.id_post
    const sql = `SELECT * FROM tbl_post WHERE id_post = '${id_post}'`
    conn.query(sql, function (err, dados) {
        if (err) {
            console.log(err)
        }
        // var string = JSON.stringify(dados);
        // var json = JSON.parse(string);
        // let id_post_Post = JSON[0].id_post;
        const sql1 = `SELECT * FROM tbl_comentario WHERE id_post = '${id_post}'`
        conn.query(sql1, function (err, dados3) {
            req.session.id_post = id_post
            if (err) {
                console.log(err)
            }
            res.render('postagem', { dados, dados3, logado })
        })
    })
})

app.post('/criarcomentario/inserecomentario', (req, res) => {
    const comentario = req.body.comentario
    const id_post = req.session.id_post
    const email = req.session.email
    const nome = req.session.nome
    const sql = `INSERT INTO tbl_comentario
    (comentario,id_post,nome,email)
    VALUES ('${comentario}','${id_post}','${nome}','${email}')`



    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/posts')
    })
})


app.get('/loja', (req, res) => {
    res.render('loja', { layout: false })
})

app.get('/projeto', (req, res) => {
    res.render('projeto', { layout: false })
})

app.get('/cadastro', (req, res) => {
    res.render('cadastro', { layout: false })
})

app.get('/login', (req, res) => {
    res.render('login', { layout: false })
})

app.get('/esqsenha', (req, res) => {
    res.render('esqsenha')
})


app.get('/recuperacao', (req, res) => {
    const logado = req.session.logado
    const email = req.session.email
    console.log(email)
    const sql = `SELECT * FROM insereusuario WHERE email = '${email}'`
    conn.query(sql, function (err, dados2) {
        console.log("Dados: ", dados2)
        if (req.session.logado) {
          res.render('recuperacao', { dados2 })          
    
    }    })
})


app.get('/criardesabafo', (req, res) => {
    const logado = req.session.logado
    const email = req.session.email
    const nome = req.session.nome
    if (req.session.logado) {
        res.render('criardesabafo', { logado, email, nome })
    } else {
        res.render('login', { layout: false })
    }
})

app.post('/criardesabafo/inserepost', (req, res) => {
    const postagem = req.body.postagem
    const email = req.body.email
    const titulo = req.body.titulo
    const categoria = req.body.categoria
    const nome = req.body.nome
    const avaliacao = req.body.avaliacao
    const sql = `INSERT INTO tbl_post
    (postagem,email,titulo,nome,categoria,avaliacao)
    VALUES ('${postagem}','${email}','${titulo}','${nome}','${categoria}','${avaliacao}')`
    



    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/posts')
    })
})

app.get('/comentario', (req, res) => {
    const logado = req.session.logado
    const email = req.session.email
    const nome = req.session.nome
    if (req.session.logado) {
        res.render('comentario', { logado, email, nome })
    } else {
        res.render('login', { layout: false })
    }
})

app.post('/comentario/inserecomentario', (req, res) => {
    const comentario = req.body.comentario
    const email = req.body.email
    const nome = req.body.nome
    const sql = `INSERT INTO tbl_comentario
    (comentario,email,nome)
    VALUES ('${comentario}','${email}','${nome}')`



    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/vercomentario')
    })
})

app.get('/vercomentario/:email', (req, res) => {
    const email = req.params.email
    const sql = `SELECT * FROM tbl_comentario WHERE email = '${email}'`
    conn.query(sql, function (err, dados3) {
        console.log(dados3)
        res.render('vercomentario', { dados3 })
    })
})

app.get('/avaliacao', (req, res) => {
    const logado = req.session.logado
    const sql = 'SELECT * FROM tbl_post'
    conn.query(sql, function (err, dados) {
        if (req.session.logado) {
            res.render('avaliacao', { logado, dados})
        } else {
            res.render('login', { layout: false })
        }
})
})

app.get('/listaposts', (req, res) => {
    const sql = 'SELECT * FROM tbl_post'
    conn.query(sql, function (err, dados) {
        if (req.session.logado) {
            res.render('listaposts', {dados})
        }
})
})

app.get('/posts/alterarposts/:id_post', (req, res) => {
    const id_post = req.params.id_post
    const sql = `SELECT * FROM tbl_post WHERE id_post = ${id_post}`
    conn.query(sql, function (err, dados) {
        if (err) {
            console.log(err)
        }
        console.log(dados)
        res.render('listaposts', { dados })
    })
})

app.post('/posts/alterandopost', (req, res) => {
    const id_post = req.body.id_post
    const avaliacao = req.body.avaliacao
    console.log(id_post)
    console.log(avaliacao)
    const sql = `UPDATE tbl_post SET avaliacao = '${avaliacao}' WHERE id_post = '${id_post}'`
    conn.query(sql, function (err, dados) {
        if (err) {
            console.log(err)
        }
        res.redirect('/listaposts')
    })
})


/*  app.get('/comentario', (req,res) => {
    const logado = req.session.logado
    const email = req.session.email
    const nome = req.session.nome
    if (req.session.logado) {
        res.render('comentario', {logado, email, nome})
    } else {
        res.render('login', { layout: false})
    }
}) 


app.post('/comentario/inserecomentario', (req, res) => {
    const email = req.body.email
    const nome = req.body.nome
    const comentario = req.body.comentario
    const sql = `INSERT INTO tbl_comentario
    (comentario,email,nome)
    VALUES ('${comentario}','${email}','${nome}')`

    
    conn.query(sql, function (err, dados3) {
        console.log("Dados: ",dados3)
        if (err) {
            console.log(err)
        }
        res.redirect('/comentario', {dados3})
    })
})
 
 */