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

{ #category : #conversions }
WikiText >> converMarkdownBold [
	self content: (self content copyReplaceAll: '**' with: '''''').
]

{ #category : #conversions }
WikiText >> convertMarkdownBold [
	self content: (self content copyReplaceAll: '**' with: '''''').
	^ self.
]

{ #category : #conversions }
WikiText >> convertMarkdownLinks [
	| markdownLinks markdownLinksRegex |
	markdownLinksRegex := '\[([\w|\s]+)\]\((\S+)\)'.
	"For the explanation of the Regex details see: http://scottradcliff.com/how-to-parse-urls-in-markdown.html"
	markdownLinks := self content regex: markdownLinksRegex matchesCollect: [:link | link ].
	markdownLinks ifEmpty: [ ^ self content ].
	markdownLinks do: [:markdownLink | | linkText closingLinkIndex newContent | 
		closingLinkIndex := markdownLink indexOf: $].
		linkText := markdownLink copyFrom: 2 to: closingLinkIndex.
		newContent := self content copyReplaceAll: markdownLink with: '[[', linkText, ']'.
		self content: newContent.
	].
	^ self content
]
