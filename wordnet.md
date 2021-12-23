

Paul Preibisch explained several core tables, here are short explanations for the rest of them:
#adjpositiontypes
adjpositiontypes - defines three positions that adjectives can take in English language, predicate, attributive and immediatelly postnominal.

#adjpositions
adjpositions - links concrete words (adjectives) with their allowed position types in adjpositiontypes table.

#linktypes
linktypes - defines all relation (link) types used in wordnet, about two dozen of them. Both lexlinks and semlinks tables use this table to define the type of each link. Some link types are marked as recursive, meaning that if "furniture" is, for example, a hypernim to a "chair", then a "chair" is a hyponym to "furniture".

#lexlinks
lexlinks - lexical links, i.e., relations between words. Example:
#sad
sad - saddness (derivation)

#semlinks
semlinks - semantic links, i.e. relations between synsets. Example:
#chair
chair - furniture (hypernym)

#morphs
morphs - connected to "words" table, contains irregular word forms. One word can have multiple morphs, and one morph can be an irregular form for multiple words, so you additionally have the morphmaps table. Examples:

#abacus
abacus (word) - abaci (morph)
#abhor
abhor (word) - abhorred, abhorring (morphs)

#postypes
postypes - defines "parts of speech". Contains only following values:
n – noun, v –verb, a – adjective, r – adverb, s – adjective satellite.
#samples
samples - sample sentences for synsets. One synset can have multiple samples.
#vframemaps
vframemaps & vframes - vframes define a kind of standard "verb templates". Vframemaps links words (verbs) with corresponding vframes in which they can appear.
#vframesentencemaps
vframesentencemaps & vframesentences - similar to previous two tables, just here you have entire sentences as verb templates.
