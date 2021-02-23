"
I model a TiddlyWiki.
More information:

https://tiddlywiki.com/
"
Class {
	#name : #TiddlyWiki,
	#superclass : #Object,
	#instVars : [
		'tiddlers'
	],
	#category : #'TiddlyWiki-Model'
}

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
