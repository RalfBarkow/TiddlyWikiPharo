Class {
	#name : #FedWikiPage,
	#superclass : #Object,
	#instVars : [
		'url',
		'title',
		'story',
		'journal',
		'importJournal'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
FedWikiPage >> dataDictionary [
	| dataUrl |
	self isView ifFalse: [
		self inform: 'Please provide a view url for the FedWiki page.'.
		^ self].
	dataUrl := self scheme , '://', self host, '/', self titleSegmentUrl, '.json'.
	^ STONJSON fromString: dataUrl asUrl retrieveContents
]

{ #category : #accessing }
FedWikiPage >> fromDataDictionary [
	title := self dataDictionary at: 'title'.
	story := self dataDictionary at: 'story'.
	self importJournal ifTrue: [ journal := self dataDictionary at: 'journal'].
]

{ #category : #accessing }
FedWikiPage >> host [
	^ self url host
]

{ #category : #accessing }
FedWikiPage >> importJournal [
	^ importJournal ifNil: [ importJournal := false ]
]

{ #category : #accessing }
FedWikiPage >> importJournal: aBoolean [
	importJournal := aBoolean
]

{ #category : #accessing }
FedWikiPage >> isView [
	^ self url firstPathSegment = 'view'
]

{ #category : #accessing }
FedWikiPage >> jsonData [
	| dataUrl |
	self isView ifFalse: [
		self inform: 'Please provide a view url for the FedWiki page.'.
		^ self].
	dataUrl := self scheme , '://', self host, self titleSegmentUrl, '.json'
]

{ #category : #accessing }
FedWikiPage >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '( ', self title, ' | ', self story size asString, ' items story )'
]

{ #category : #accessing }
FedWikiPage >> scheme [
	^ self url scheme
]

{ #category : #accessing }
FedWikiPage >> story [
	^ story
]

{ #category : #accessing }
FedWikiPage >> title [
	^ title.
]

{ #category : #accessing }
FedWikiPage >> titleSegmentUrl [
	self isView ifFalse: [
		self inform: 'Please provide a view url for the FedWiki page.'.
		^ self].
	^ self url segments last.
]

{ #category : #accessing }
FedWikiPage >> url [
	^ url
]

{ #category : #accessing }
FedWikiPage >> url: aString [
	url  := aString asZnUrl
]
