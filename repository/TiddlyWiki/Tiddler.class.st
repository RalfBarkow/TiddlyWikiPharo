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
Tiddler >> asDictionary [
	^ Dictionary new
		at: 'title' put: self title;
		at: 'text' put: self text;
		at: 'created' put: self created asString;
		at: 'tags' put: self tags;
		yourself.
]

{ #category : #converting }
Tiddler >> asJson [ 
	^ STONJSON toStringPretty: self asDictionary 
]

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

	^ created ifNil: [ created := DateAndTime now ]
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

{ #category : #utilities }
Tiddler >> markdownLinksAsWikiText [
	"I'm useful to convert _internal_ links between formats, as is a common pattern
	found when migrating content from Markdown to TiddlyWiki's WikiText.
	I DON'T work on external links. A better regex could be used for that.
	See: 
	- https://davidwells.io/snippets/regex-match-markdown-links
	- http://blog.michaelperrin.fr/2019/02/04/advanced-regular-expressions/"
	| markdownLinks |
	markdownLinks := (self text splitOn: Character space) select: [:each | each matchesRegex: '\[(.+)\)'].
	markdownLinks ifEmpty: [^ self].
	^ markdownLinks
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
Tiddler >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '( ', self title, ' )'
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
