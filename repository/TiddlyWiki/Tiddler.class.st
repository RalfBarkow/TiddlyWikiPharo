"
I model a Tiddler object in [TiddlyWiki](https://tiddlywiki.com/).

I implement the standard fields as described in the standard documentation at: <https://tiddlywiki.com/#TiddlerFields>

"
Class {
	#name : #Tiddler,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'modified',
		'mofier',
		'created',
		'creator',
		'tags',
		'type',
		'list',
		'caption'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
Tiddler >> caption [

	^ caption
]

{ #category : #accessing }
Tiddler >> caption: anObject [

	caption := anObject
]

{ #category : #accessing }
Tiddler >> created [

	^ created
]

{ #category : #accessing }
Tiddler >> created: anObject [

	created := anObject
]

{ #category : #accessing }
Tiddler >> creator [

	^ creator
]

{ #category : #accessing }
Tiddler >> creator: anObject [

	creator := anObject
]

{ #category : #'instance creation' }
Tiddler >> fromMarkdownParsedItems: aCollection [
	| outputStream |
	outputStream := '' writeStream.
	aCollection children do: [ :each |
		each children
			ifEmpty: [ self itemContentsStringFor: each into: outputStream ] 
			ifNotEmpty: [ 
				each children do: [ :child | 
					self itemContentsStringFor: child into: outputStream ] ] 
	]
]

{ #category : #utilities }
Tiddler >> itemContentsStringFor: item into: stream [
	stream 
		nextPutAll: item text;
		nextPut: Character cr;
		nextPut: Character cr
]

{ #category : #accessing }
Tiddler >> list [

	^ list
]

{ #category : #accessing }
Tiddler >> list: anObject [

	list := anObject
]

{ #category : #accessing }
Tiddler >> modified [

	^ modified
]

{ #category : #accessing }
Tiddler >> modified: anObject [

	modified := anObject
]

{ #category : #accessing }
Tiddler >> mofier [

	^ mofier
]

{ #category : #accessing }
Tiddler >> mofier: anObject [

	mofier := anObject
]

{ #category : #accessing }
Tiddler >> tags [

	^ tags
]

{ #category : #accessing }
Tiddler >> tags: anObject [

	tags := anObject
]

{ #category : #accessing }
Tiddler >> text [

	^ text
]

{ #category : #accessing }
Tiddler >> text: anObject [

	text := anObject
]

{ #category : #accessing }
Tiddler >> title [

	^ title
]

{ #category : #accessing }
Tiddler >> title: anObject [

	title := anObject
]

{ #category : #accessing }
Tiddler >> type [

	^ type
]

{ #category : #accessing }
Tiddler >> type: anObject [

	type := anObject
]
