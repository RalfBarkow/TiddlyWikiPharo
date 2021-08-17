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
		'created',
		'creator',
		'tags',
		'type',
		'list',
		'caption',
		'modifier',
		'wiki'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #'instance creation' }
Tiddler class >> nowLocal [
	^ (ZTimestampFormat fromString: '200102031605067') 
			format: (ZTimestamp fromString: Time nowLocal  asDateAndTime asString)
]

{ #category : #accessing }
Tiddler >> asDictionary [
	^ Dictionary new
		at: 'title' put: self title;
		at: 'text' put: self text;
		at: 'created' put: self created asString;
		at: 'tags' put: self tags;
		at: 'type' put: self type;
		yourself.
]

{ #category : #converting }
Tiddler >> asJson [ 
	^ STONJSON toStringPretty: self asDictionary 
]

{ #category : #accessing }
Tiddler >> asJsonTempFile [
	^ MarkupFile exportAsFileOn: FileLocator temp / self title, 'json' containing:self asJson 
		
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

{ #category : #accessing }
Tiddler >> fromDictionary: aDictionary [
	self
		title: (aDictionary at: 'title');
		text: (aDictionary at: 'text');
		tags: (aDictionary at: 'tags' ifAbsentPut: [ nil ]);
		created: (aDictionary at: 'created' ifAbsentPut: [ nil ]);
		creator: (aDictionary at: 'creator' ifAbsentPut: [ nil ]);
		modified: (aDictionary at: 'modified' ifAbsentPut: [ nil ]);
		modifier: (aDictionary at: 'modifier' ifAbsentPut: [ nil ]);
		type: (aDictionary at: 'type' ifAbsentPut: [ nil ]);
		caption: (aDictionary at: 'caption' ifAbsentPut: [ nil ]).
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

{ #category : #accessing }
Tiddler >> importFedWikiPage: pageViewUrlString [
	| pageTitle pageViewUrl pageData |
	pageViewUrl := pageViewUrlString asZnUrl.
	pageTitle := pageViewUrl segments second.
	pageData := (pageViewUrl scheme, '://', pageViewUrl host, '/', pageTitle, '.json') asZnUrl.
	^ STONJSON fromString: pageData retrieveContents	
]

{ #category : #utilities }
Tiddler >> itemContentsStringFor: item into: stream [
	stream 
		nextPutAll: item text;
		nextPut: Character cr;
		nextPut: Character cr
]

{ #category : #accessing }
Tiddler >> linkedTiddlers [
	"At the begining we are going to introduce 'pureTiddlers' as thos included in the wiki which are not linked
	via aliases. Future versions of this method sould included internal aliased tiddlers."
	| pureTiddlersTitles |
	pureTiddlersTitles := self rawLinks difference: self rawAliasedLinks.
	^ self wiki tiddlers select: [:tiddler | pureTiddlersTitles includes: tiddler title ].
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
Tiddler >> modifier [

	^ modifier
]

{ #category : #accessing }
Tiddler >> modifier: anObject [

	modifier := anObject
]

{ #category : #accessing }
Tiddler >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '( ', self title, ' )'
]

{ #category : #'as yet unclassified' }
Tiddler >> rawAliasedLinks [
	^ self rawLinks select: [ :each | each includesSubstring: '|'	 ]
]

{ #category : #accessing }
Tiddler >> rawLinks [
	^ (WikiTextGrammar new linkSea star parse: self text) asSet
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

{ #category : #accessing }
Tiddler >> wiki [
	^ wiki
]

{ #category : #accessing }
Tiddler >> wiki: aTiddlyWiki [
	wiki := aTiddlyWiki
]
