# Pesquisa pública sobre Pedro Póvoa

Resumo do que existe online sobre o Mestre (pesquisa de 2026-10-07).  |  TLDR: o site precisa de factos verificáveis -> este ficheiro separa o confirmado do que falta / custo: manter atualizado / ganho: nada é inventado / ~30 min

Regra: só factos com fonte entram no site; o resto vem do Mestre (ver `questionario-mestre.md`).  |  TLDR: risco de inventar palmarés -> fonte obrigatória por facto / ganho: credibilidade / ~0h

## Nome

- **Grafia correta: Pedro Póvoa** (nome completo: Pedro Miguel Moreira Póvoa)  |  TLDR: o repositório e a organização usam "polvoa" -> a marca no site usa "Póvoa"; o nome antigo fica só onde já existe / custo: renomear implicaria perder o URL / ~0h
- **Confirmar com o Mestre** como quer ser apresentado ("Mestre", "Pedro Póvoa OLY", etc.)  |  TLDR: o título "Mestre" não tem fonte pública -> perguntar antes de o usar em destaque / ~5 min

## Factos confirmados em fontes públicas

- **Nascimento**: 27/05/1980, Porto  |  TLDR: biografia precisa de base -> Wikipedia / fonte secundária / ~0h
- **Categorias**: -58 kg (principal) e -54 kg (Europeu 2004)  |  TLDR: palmarés mistura categorias -> indicar sempre a categoria ao lado do resultado / ~0h
- **Bronze no Europeu de 2004** (Lillehammer, Noruega, -54 kg)  |  TLDR: resultado europeu -> citar com fonte Wikipedia / ~0h
- **Primeiro atleta português de taekwondo nos Jogos Olímpicos**: Pequim 2008, -58 kg, qualificado no torneio europeu de Istambul  |  TLDR: maior argumento do site -> destacar na página do Mestre / ~0h
- **Pequim 2008**: perdeu o combate inicial com Gabriel Mercedes (República Dominicana) e a repescagem com Chu Mu-yen (Taipé Chinesa), por (-1)-1  |  TLDR: detalhe de combate -> opcional; usar só "7.º lugar" se a carta do clube o confirmar / ~0h
- **Ouro nos Jogos da Lusofonia de 2009** (Lisboa, -58 kg), final ganha por 7-0 a Nicolau Noé Sambo (Moçambique)  |  TLDR: título internacional -> citar com RTP / ~0h
- **Campeão nacional durante 15 anos** (RTP)  |  TLDR: número forte mas sem lista de anos -> pedir ao Mestre os anos antes de escrever "15 títulos" / ~10 min
- **Líder do ranking europeu -58 kg em 2010** (RTP)  |  TLDR: facto de 2010 -> citar com fonte / ~0h
- **Formação**: antigo aluno da Universidade do Minho (Wikipedia); a RTP chamou-lhe estudante de Psicologia do Porto em 2009  |  TLDR: duas fontes diferentes -> confirmar curso e instituição com o Mestre / ~5 min

## Discrepâncias e dados NÃO confirmados

- **Clube**: Wikipedia diz Boavista; RTP diz Sporting de Braga  |  TLDR: fontes divergem -> pedir o percurso por clubes ao Mestre / provável fase diferente da carreira / ~5 min
- **Treinador na Universidade do Porto e no Boavista FC**: apareceu num resumo de pesquisa, sem fonte aberta que o confirme  |  TLDR: não usar -> só se o Mestre confirmar / ~0h
- **Grau (Dan), federação e data**: nenhuma fonte  |  TLDR: título de Mestre exige prova -> pedir diploma ou cartão federativo / ~10 min
- **Academia (nome oficial, morada, horários, preços)**: nenhuma fonte pública encontrada  |  TLDR: vem do clube -> `data/horarios.yaml` e `data/contacto.yaml` com a carta da época 2026/2027 / ~1h
- **Registo na federação ou associação do Norte**: não verificado (sites inacessíveis na pesquisa)  |  TLDR: possível selo de confiança -> voltar a tentar mais tarde / ~15 min

## Fontes consultadas

- Wikipedia, Pedro Póvoa: https://en.wikipedia.org/wiki/Pedro_P%C3%B3voa  |  TLDR: base biográfica -> secundária, confirmar com o Mestre / ~0h
- RTP, campeão nacional há 15 anos: https://www.rtp.pt/noticias/outras-modalidades/pedro-povoa-e-campeao-nacional-de-taekwondo-ha-15-anos_v461449  |  TLDR: sem data no texto obtido -> usar com cautela / ~0h
- RTP, ouro na Lusofonia: https://www.rtp.pt/noticias/jogos-da-lusofonia/pedro-povoa-de-ouro_d257826  |  TLDR: contém citação dele -> não reproduzir sem confirmar / ~0h
- Facebook, "Pedro Póvoa Treinador e Atleta Olímpico Taekwondo": https://www.facebook.com/p/Pedro-P%C3%B3voa-Treinador-e-Atleta-Ol%C3%ADmpico-Taekwondo-100063480403908/  |  TLDR: confirma a atividade de treinador no Porto -> conteúdo não lido / ~0h
- Superprof (anúncio de explicações): https://www.superprof.pt/aulas-artes-marciais-boavista-taekwondo-zona-porto-pedro-povoa-atleta-olimpico.html  |  TLDR: HTTP 403, conteúdo não lido -> só prova que o anúncio existe / ~0h
- Olympics.com, perfil: https://www.olympics.com/en/athletes/pedro-povoa  |  TLDR: timeout -> repetir a consulta para citar a fonte oficial / ~5 min

## Implicações para o site

- **Página do Mestre**: palmarés em `data/mestre.yaml`, cada item com `fonte`  |  TLDR: factos espalhados -> uma só fonte de dados / ~2h
- **Menores**: nunca nomear nem mostrar atletas menores sem autorização escrita (campo AUTORIZO / NÃO AUTORIZO da ficha de inscrição)  |  TLDR: RGPD -> verificar por atleta antes de publicar / ~0h
- **Citações**: não reproduzir frases do Mestre sem a sua confirmação  |  TLDR: risco de pôr palavras na boca dele -> pedir aprovação / ~0h
