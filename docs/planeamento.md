# Planeamento do site da Academia de Taekwondo do Pedro Póvoa

Documento mestre: objetivos, âmbito, fases e perguntas em aberto.  |  TLDR: não há plano escrito -> este ficheiro é a fonte única / custo: manter atualizado / ganho: decisões rastreáveis / ~1h

## Objetivos

- **Apresentar a academia**: quem somos, o Mestre, a filosofia, onde treinamos  |  TLDR: pais novos não encontram a academia online -> página clara e rápida no telemóvel / ganho: novas inscrições / ~1 dia
- **Blog**: notícias, competições, exames de cinto, artigos educativos  |  TLDR: sem canal próprio, o conteúdo fica perdido em redes sociais -> blog indexável no Google / custo: ritmo de escrita / ganho: tráfego orgânico no Porto / ~1 dia
- **Horários e contactos**: tabela de turmas, morada, mapa, contacto  |  TLDR: informação dispersa -> um ficheiro de dados `data/horarios.yaml` usado em várias páginas / ~2h
- **Custo mínimo**: alojamento gratuito e manutenção simples  |  TLDR: uma academia não quer pagar servidor -> site estático no GitHub Pages / custo: sem backend / ganho: 0 EUR/mês (domínio à parte) / ~0h

## Fora de âmbito (primeira versão)

- **Parte administrativa (projeto separado, fora do GitHub Pages)**: ficha de inscrição, documentos para download, convocatórias com nomes de atletas, mensalidades por atleta, área de sócios, login, pagamentos  |  TLDR: exige backend e RGPD de menores -> outro projeto, noutra hospedagem; este site apenas liga para ele quando existir / custo evitado: dados pessoais num site público / decisão do utilizador
- **Pagamentos, área de sócios, login**  |  TLDR: exige backend e RGPD pesado -> adiar / custo evitado: semanas de trabalho / reavaliar após lançamento
- **Inscrição online com dados pessoais**  |  TLDR: formulário recolhe dados de menores -> primeiro versão usa contacto por telefone, email ou WhatsApp / reavaliar na fase 4
- **Comentários no blog**  |  TLDR: moderação e spam -> adiar; partilha via redes sociais basta / ~0h

## Fases

- **Fase 0 — Organização GitHub e repositório**  |  TLDR: nada existe online -> criar a organização e o repositório (ver `github-organizacao.md`) / ~1h
- **Fase 1 — Esqueleto Hugo**  |  TLDR: repositório vazio -> Hugo com config dividida, 3 línguas, tema escuro/claro, `make build` a passar / ~1 dia
- **Fase 2 — Páginas base**  |  TLDR: sem conteúdo -> início, a academia, o Mestre, modalidades e turmas, horários, contactos / depende do conteúdo do Mestre / ~2 dias
- **Fase 3 — Blog**  |  TLDR: sem blog -> listagem, página de artigo, etiquetas, RSS, arquétipo de artigo, 3 artigos iniciais / ~1 dia
- **Fase 4 — Publicação e domínio**  |  TLDR: site só local -> GitHub Actions ou `gh-pages`, HTTPS, domínio próprio / depende da decisão do domínio / ~2h
- **Fase 5 — Qualidade**  |  TLDR: sem verificações -> `make check` com links, HTML, acessibilidade e idiomas dos artigos / ~0,5 dia
- **Fase 6 — Evoluções**  |  TLDR: ideias soltas -> galeria com consentimento, calendário de eventos, ligação a Instagram / adiar

## Mapa de páginas (proposto)

- `/` Início  |  TLDR: primeira impressão -> destaque, próximos eventos, últimos artigos, botão de contacto / ~2h
- `/a-academia/`  |  TLDR: confiança -> história, valores, instalações / precisa de texto do Mestre
- `/o-mestre/`  |  TLDR: credibilidade -> percurso, graduação, palmarés lidos de `data/mestre.yaml` (só factos com estado "confirmado"); rascunho até o Mestre validar / precisa do questionário
- `/turmas/`  |  TLDR: escolha da turma -> crianças, juvenis, adultos, competição / alimentado por `data/turmas.yaml`
- `/horarios/` e `/contactos/`  |  TLDR: contacto rápido -> horário, morada, mapa, telefone, email / `data/contacto.yaml`
- `/blog/`  |  TLDR: conteúdo recorrente -> listagem paginada, etiquetas, RSS (ver `blog.md`)

## Referência: projeto signorini

- **Reaproveitar a estrutura** de `/opt/js/signorini/website`: Hugo, `config/_default/`, `i18n/`, `data/*.yaml`, `archetypes/`, `layouts/partials/`, `Makefile`, `deploy.sh`  |  TLDR: recomeçar do zero é lento -> copiar o esqueleto técnico / cuidado: não copiar conteúdo, biografia nem domínio / ~2h
- **Diferenças**: língua principal pt-PT (lá é en), 3 línguas (lá 4), sem diagramas Mermaid obrigatórios no blog, tom mais próximo  |  TLDR: público diferente -> ajustar regras do blog / ~1h

## Perguntas em aberto

- **Organização GitHub: DECIDIDO** — `taekwondo-pedro-polvoa`  |  TLDR: nome livre à data -> falta o utilizador criá-la na web / ~5 min
- **Nome oficial da academia (para textos do site)?**  |  TLDR: o nome do GitHub não substitui o nome oficial -> precisa de resposta do utilizador
- **Domínio: DECIDIDO** — usar `https://taekwondo-pedro-polvoa.github.io/website/` por agora, para mostrar ao Mestre  |  TLDR: demonstração rápida e grátis -> domínio próprio (por exemplo .pt, cerca de 10 a 15 EUR/ano) fica para depois da aprovação / custo da troca: DNS + ficheiro `CNAME` + `baseURL`, ~30 min
- **Línguas: só pt-PT no início, ou pt, en e es?**  |  TLDR: traduzir tudo atrasa o lançamento -> recomendado lançar em pt-PT com a estrutura i18n pronta / ~0h agora
- **Quem escreve e publica os artigos?**  |  TLDR: sem responsável o blog morre -> definir uma pessoa e um ritmo (por exemplo 2 artigos por mês)
- **Conta de email e redes sociais da academia?**  |  TLDR: contactos e ligações no rodapé -> precisa de dados do utilizador
- **Fotos e logótipo disponíveis? Há consentimento dos encarregados de educação?**  |  TLDR: RGPD para menores -> só publicar com consentimento escrito (ver `blog.md`)
- **Federação e filiação (por exemplo Federação Portuguesa de Taekwondo)?**  |  TLDR: texto institucional correto -> confirmar com o Mestre antes de escrever

## Riscos

- **Dados de menores**  |  TLDR: multa RGPD e dano de confiança -> consentimento escrito, sem nomes completos, sem localização de crianças / custo: processo
- **Conteúdo inventado ou desatualizado**  |  TLDR: horários errados afastam famílias -> um único `data/horarios.yaml` e data de revisão visível / ~15 min por revisão
- **Dependência de uma pessoa técnica**  |  TLDR: só uma pessoa publica -> documentar `docs/blog.md` e permitir edição pelo GitHub no browser / ~1h
