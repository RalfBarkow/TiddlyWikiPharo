"
I model a TiddlyWiki.
More information:

https://tiddlywiki.com/
"
Class {
	#name : #TiddlyWiki,
	#superclass : #Object,
	#instVars : [
		'tiddlers',
		'file'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
TiddlyWiki >> file [
	^ file
]

{ #category : #accessing }
TiddlyWiki >> file: anObject [
	file := anObject
]

{ #category : #accessing }
TiddlyWiki >> importJSONTiddlers [
	| tiddlersDict |
	self tiddlersJSONFile ifNil: [ ^ self ].
	tiddlersDict := STONJSON fromString: self tiddlersJSONFile contents.
	self tiddlers: (tiddlersDict collect: [:each | 
		Tiddler new 
			fromDictionary: each;
			wiki: self 
		 ])
]

{ #category : #accessing }
TiddlyWiki >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '( ', self file basename ,' )'
]

{ #category : #accessing }
TiddlyWiki >> taggedWith: aTag [
	^ self tiddlers select: [:tiddler | 
		tiddler tags isNotNil and: [tiddler tags includesSubstring: aTag ]
	]
]

{ #category : #accessing }
TiddlyWiki >> tiddlers [

	^ tiddlers ifNil: [ tiddlers := OrderedCollection new ]
]

{ #category : #accessing }
TiddlyWiki >> tiddlers: anOrderedCollection [

	tiddlers := anOrderedCollection
]

{ #category : #accessing }
TiddlyWiki >> tiddlersJSONFile [
	file ifNil: [ self inform: 'You need to export tiddlers as JSON from TiddlyWiki'. 
		^ nil ].
	^ file parent / 'tiddlers.json'.
]
