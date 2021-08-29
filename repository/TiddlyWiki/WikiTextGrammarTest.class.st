Class {
	#name : 'WikiTextGrammarTest',
	#superclass : 'PP2CompositeNodeTest',
	#category : 'TiddlyWiki-Model'
}

{ #category : 'accessing' }
WikiTextGrammarTest >> parserClass [
	^ WikiTextGrammar
]

{ #category : 'accessing' }
WikiTextGrammarTest >> testDocument [
	| input |
	input := WikiText new sample.
	self parse: input rule: #document.
	self assert: result size equals: 2
]

{ #category : 'accessing' }
WikiTextGrammarTest >> testLink [
	self
		parse: '[[Just testing]]'
		rule: #link
]
