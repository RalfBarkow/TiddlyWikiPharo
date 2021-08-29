Class {
	#name : 'WikiTextGrammar',
	#superclass : 'PP2CompositeNode',
	#instVars : [
		'document',
		'link',
		'linkOpen',
		'linkContent',
		'linkClose'
	],
	#category : 'TiddlyWiki-Model'
}

{ #category : 'accessing' }
WikiTextGrammar >> document [
	^ link islandInSea star
]

{ #category : 'accessing' }
WikiTextGrammar >> link [
	^ linkOpen, linkContent, linkClose ==> #second
]

{ #category : 'accessing' }
WikiTextGrammar >> linkClose [
	^ ']]' asPParser
]

{ #category : 'accessing' }
WikiTextGrammar >> linkContent [
	^ #any asPParser starLazy flatten
]

{ #category : 'accessing' }
WikiTextGrammar >> linkOpen [
	^ '[[' asPParser
]

{ #category : 'accessing' }
WikiTextGrammar >> linkSea [
	^ link sea ==> #second
]

{ #category : 'accessing' }
WikiTextGrammar >> start [
	^ document
]
