Class {
	#name : #BaselineOfTiddlyWikiPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfTiddlyWikiPharo
}

{ #category : #baselines }
BaselineOfTiddlyWikiPharo >> baseline: spec [
	<baseline>
	spec
		for: #common 
		do: [ 
			 spec package: 'TiddlyWikiPharo'
		]
]

{ #category : #accessing }
BaselineOfTiddlyWikiPharo >> projectClass [ 
	^ MetacelloCypressBaselineProject 
]
