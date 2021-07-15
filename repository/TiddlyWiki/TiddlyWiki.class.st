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

{ #category : #'instance creation' }
TiddlyWiki >> fromJSONString: aString [
	| rawData |
	rawData := NeoJSONReader fromString: aString.
	rawData do: [ :data | | temp |
		temp := Tiddler new.
		temp
			modified: (data at: 'modified');
			created: (data at: 'created' ifAbsent: [ temp created: nil ]);
			title: (data at: 'title');
			tags: (data at: 'tags' ifAbsent: [ temp tags: nil ]);
			type: (data at: 'type' ifAbsent: [ temp type: nil ]);
			caption: (data at: 'caption' ifAbsent: [ temp caption: nil ]);
			text: (data at: 'text').
		self tiddlers add: temp.
	].

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
