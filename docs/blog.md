# Blog

Regras e fluxo de trabalho dos artigos.  |  TLDR: sem regras cada artigo sai diferente -> convenções simples e verificáveis / custo: disciplina / ganho: qualidade e RGPD / ~1h

## Para que serve

- **Notícias da academia**: exames de cinto, estágios, competições, resultados  |  TLDR: pais querem saber o que se passa -> artigo curto com data e fotos autorizadas / ~30 min por artigo
- **Artigos educativos**: o que é o poomsae, regras de kyorugi, como escolher o dobok, benefícios para crianças  |  TLDR: pesquisas locais e dúvidas de pais -> conteúdo evergreen que traz visitas / ~1h por artigo
- **Vida do Mestre e da academia**: história, filosofia, entrevistas  |  TLDR: confiança -> apenas factos fornecidos pelo Mestre / ~1h

## Ficheiros e nomes

- **Local**: `content/blog/<slug>/index.pt.md` (page bundle; imagens na mesma pasta)  |  TLDR: imagens junto do texto -> menos ficheiros perdidos / ~0h
- **Slug**: minúsculas, sem acentos, hífens, estável depois de publicado  |  TLDR: mudar o URL parte links -> escolher bem à primeira / ~0h
- **Versões**: `index.pt.md` e `index.en.md` são obrigatórios em todos os artigos; `index.es.md` só quando pedido  |  TLDR: artigo sem versão inglesa deixa a lista em inglês vazia -> `scripts/check-posts.sh` falha se faltar uma das duas / custo: traduzir cada artigo / ~15 min por artigo
- **Marcador de lacunas**: `[POR CONFIRMAR: ...]` em pt e `[TO CONFIRM: ...]` em en  |  TLDR: lacuna editorial não pode ir para o ar -> o mesmo script falha se um artigo publicado ainda tiver um marcador / ~0h
- **Criar um artigo**: `hugo new blog/<slug>/index.pt.md` usa `archetypes/blog.md`  |  TLDR: front matter esquecido -> o arquétipo preenche tudo / ~2 min

## Front matter

```yaml
---
title: ""
date: 2026-01-01
description: ""   # uma frase, usada em listagens e meta
draft: true       # passar a false ao publicar
tags: []          # por exemplo: exames, competicao, criancas
author: ""        # nome público do autor
image: ""         # opcional, ficheiro no bundle
image_alt: ""     # obrigatório se image existir
---
```

- **`description` obrigatória, uma frase**  |  TLDR: resultado do Google e cartões de partilha -> frase clara de 120 a 160 caracteres / ~2 min
- **`image_alt` obrigatória com imagem**  |  TLDR: acessibilidade -> falha a verificação sem ela / ~1 min

## Estrutura sugerida de um artigo

- **1. Abertura**: 1 a 2 frases que dizem do que trata  |  TLDR: leitor decide em 5 segundos -> ir direto ao assunto / ~5 min
- **2. Corpo**: 2 a 4 secções com títulos H2  |  TLDR: leitura no telemóvel -> parágrafos curtos / ~30 min
- **3. Glossário inline**: termos coreanos com explicação na primeira vez  |  TLDR: pais não conhecem os termos -> "poomsae (formas)", "kyorugi (combate)", "dobok (quimono)" / ~5 min
- **4. Fecho**: convite à ação (experimentar uma aula, contactar)  |  TLDR: o blog deve trazer alunos -> uma ligação para `/contactos/` / ~2 min
- **Sem resumo final tipo "em conclusão"**  |  TLDR: enchimento -> terminar no convite

## Tom

- **Próximo, respeitoso, educativo**; português europeu  |  TLDR: comunidade local -> "treino", "cinto", "encarregado de educação"
- **Nunca inventar** resultados, graduações, datas ou citações  |  TLDR: credibilidade do Mestre -> todos os factos vêm do utilizador / ~0h
- **Respeito pelos alunos**: foco no esforço e na aprendizagem, não só em medalhas  |  TLDR: pressão sobre crianças -> texto positivo / ~0h

## Menores e consentimento (RGPD)

- **Fotografias e nomes de menores só com consentimento escrito do encarregado de educação**  |  TLDR: obrigação legal e confiança -> modelo de consentimento guardado pela academia, fora do repositório / ~1h
- **Registo**: no artigo, comentário HTML ou campo `consent_ref: "AAAA-NN"` aponta para o registo interno (sem dados pessoais)  |  TLDR: provar consentimento sem expor dados -> referência opaca / ~5 min
- **Nomes**: primeiro nome ou iniciais para menores, mesmo com consentimento  |  TLDR: reduz exposição -> regra por omissão / ~0h
- **Retirar conteúdo** a pedido, rapidamente  |  TLDR: direito ao apagamento -> processo: remover do repositório e republicar; cópias em cache podem persistir / ~15 min
- **Metadados das fotos**: remover EXIF/GPS antes de commit  |  TLDR: localização de crianças -> ferramenta de limpeza no passo de imagens / ~15 min

## Fluxo editorial

- **1.** Redator cria rascunho (`draft: true`) numa branch ou no editor web do GitHub  |  TLDR: sem alterar o site -> PR em rascunho / ~30 min
- **2.** `make check` valida build, links, `description`, `image_alt`  |  TLDR: erros apanhados antes de publicar -> CI / automático
- **3.** Mantenedor revê e faz merge para `main`  |  TLDR: segunda pessoa vê o texto -> publicação automática / ~10 min
- **4.** Partilha em redes sociais com o link do artigo  |  TLDR: tráfego -> fora do repositório / ~5 min

## Ritmo

- **Sugestão**: 2 artigos por mês, 3 artigos antes do lançamento  |  TLDR: blog vazio parece abandonado -> escrever 3 antes de publicar / ~1 dia total
- **Ideias iniciais**: "O que é o taekwondo e para quem é", "Como funcionam os exames de cinto", "Primeira aula: o que levar"  |  TLDR: respondem às dúvidas mais comuns dos pais -> redigir com os factos do Mestre / ~1h cada

## Ilustrações de pontapés (por fazer)

Nota para depois: criar mais desenhos como `static/img/ilustracoes/pontape.svg`, o primeiro do artigo das calorias.  |  TLDR: só há um desenho de pontapé -> fazer uma pequena série com o mesmo estilo para os artigos / custo: ~30 min por desenho / ganho: artigos mais claros sem fotos de menores

- **Estilo**: boneco em traço branco (largura 16, pontas redondas), cabeça cheia, fundo azul `#001a48`, faixas e chão em vermelho `#f72502`, chama opcional, tela 800x450  |  TLDR: desenhos soltos ficam desencontrados -> copiar o estilo de `pontape.svg` / ~0h
- **Ideias de pontapés**: `ap chagi` (frontal), `dollyo chagi` (circular), `yop chagi` (lateral), `dwit chagi` (para trás), `naeryeo chagi` (machado), `dwi huryeo chagi` (rotativo)  |  TLDR: artigos sobre técnica precisam de exemplos -> um desenho por pontapé, com o nome coreano e a glosa em pt-PT / ~30 min cada
- **Texto e acessibilidade**: cada SVG leva `<title>`, `<desc>` e `alt` no shortcode; legenda com o nome do pontapé  |  TLDR: imagem sem texto exclui leitores de ecrã -> obrigatório / ~2 min
- **Onde ficam e como se usam**: `static/img/ilustracoes/` e `{{< figura src="img/ilustracoes/<nome>.svg" alt="..." >}}`  |  TLDR: um só sítio e um só shortcode -> sem imagens espalhadas / ~0h
- **Cuidado técnico**: desenhar as faixas com `<polygon>` e não com `transform="rotate(...)"`  |  TLDR: a rotação em torno de um ponto saiu fora da tela ao renderizar -> coordenadas explícitas / ~0h
- **Verificar**: converter para PNG (`convert -background none x.svg x.png`) e ver o resultado antes de usar  |  TLDR: o SVG pode estar válido e feio -> olhar sempre / ~2 min
- **Não usar fotos de menores**: os desenhos substituem-nas nos artigos técnicos  |  TLDR: RGPD -> boneco em vez de criança / ~0h
