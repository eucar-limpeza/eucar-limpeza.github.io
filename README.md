# EUCar — Limpeza que protege

Website de servicos, marcacoes e gestao. A vitrine e o painel usam a mesma API e base D1; fotografias enviadas pelo painel ficam em R2.

## Utilizacao
- Area publica: servicos, precos em Kz, sobre, galeria, avaliacoes, contactos e formulario com revisao antes da confirmacao.
- Marcações ficam Pendentes e reservam um intervalo da agenda. O pedido e guardado antes do envio opcional pelo WhatsApp. O botao abre uma mensagem preparada; o cliente confirma o envio no WhatsApp. Nao utiliza a API comercial de envio automatico.
- Painel #/admin: pedidos, estados, valor cobrado, servicos, fotos, avaliacoes reais, horario, bloqueios, empresa/contactos, categorias, relatorios CSV e historico de clientes.
- Receitas incluem apenas pedidos Concluidos e o valor efectivamente cobrado. Relatorios filtram pela data do servico.
- Agenda configurada para uma equipa e um atendimento de cada vez. O intervalo inclui deslocacao. Duracao inicial: 120 minutos; segunda a sabado, 08h-18h. Configuracao editavel no painel.
- Servicos sem preco aparecem como A definir. Contactos e area de atendimento aguardam dados da proprietaria.
- As imagens iniciais de servicos sao ilustrativas, geradas para o projecto. A galeria e as avaliacoes reais comecam vazias. O logotipo original foi fornecido pelo cliente.

## Acesso
ADMIN_EMAIL, ADMIN_SALT e ADMIN_HASH sao segredos da hospedagem, nunca enviados ao browser. Palavra-passe derivada com PBKDF2 SHA-256 (100.000 iteracoes). Sessoes HttpOnly, Secure, SameSite=Strict, 8 horas. Proteccao de origem nas mutacoes e limite de tentativas no login e nas marcacoes.
A proprietaria pode substituir o acesso inicial em Acesso e seguranca. A palavra-passe actual e exigida. Caso a perca, o operador da hospedagem precisa efectuar a recuperacao; nao existe envio de e-mail de recuperacao.

## Desenvolvimento e publicacao
- GitHub Pages publica a pasta public automaticamente em cada push na branch main, pelo workflow pages.yml. Configurar Settings > Pages > Source como GitHub Actions.
- No github.io, a API continua hospedada em https://eucar-limpeza-protege.perkychair15.chatgpt.site. Reservas, imagens e gestao usam a mesma base. GitHub Pages sozinho nao executa o servidor nem guarda pedidos.
- O acesso administrativo no github.io usa um token de sessao de 8 horas, guardado apenas no sessionStorage da aba, enviado no cabecalho Authorization. O servidor permite essa origem explicitamente; no dominio original continua a usar cookie HttpOnly.
- Node >=22.13; npm install:ci.
- npm run db:generate para alteracoes de esquema. Preservar as migracoes ja aplicadas.
- node --test tests/eucar.test.mjs
- npm run dev -- --port 4174; segredos locais em .dev.vars (ignorado).
- Publicar com o fluxo Sites, preservando .openai/hosting.json. A base local e os seus dados de teste nao sao publicados.
- Dados pessoais podem ser removidos pela proprietaria nos pedidos; a eliminacao tambem altera os relatorios.
