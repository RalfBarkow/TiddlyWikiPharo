Class {
	#name : #FedWikiItem,
	#superclass : #Object,
	#instVars : [
		'text',
		'id',
		'type'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
FedWikiItem >> fromDictionary: aDictionary [ 
	text := aDictionary at: 'text'.
	id := aDictionary at: 'id'.
	type := aDictionary at: 'type'.
]

{ #category : #accessing }
FedWikiItem >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '( ',self type, ' | ', self text, ' )'
]

{ #category : #accessing }
FedWikiItem >> text [
	^ text
]

{ #category : #accessing }
FedWikiItem >> type [
	^ type
]
