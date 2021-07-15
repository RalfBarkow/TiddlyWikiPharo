Class {
	#name : #WikiText,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'TiddlyWiki-Model'
}

{ #category : #accessing }
WikiText >> content [
	^ content
]

{ #category : #accessing }
WikiText >> content: aString [
	content := aString
]
