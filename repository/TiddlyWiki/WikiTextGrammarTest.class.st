Class {
	#name : #WikiTextGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
WikiTextGrammarTest >> parserClass [
	^ WikiTextGrammar
]

{ #category : #accessing }
WikiTextGrammarTest >> testLink [
	self
		parse: '[[Just testing]]'
		rule: #link
]
