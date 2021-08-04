Class {
	#name : #FedWikiPage,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
FedWikiPage >> host [
	^ self url host
]

{ #category : #accessing }
FedWikiPage >> isView [
	^ self url firstPathSegment = 'view'
]

{ #category : #accessing }
FedWikiPage >> scheme [
	^ self url scheme
]

{ #category : #accessing }
FedWikiPage >> url [
	^ url
]

{ #category : #accessing }
FedWikiPage >> url: aString [
	url  := aString asZnUrl
]
