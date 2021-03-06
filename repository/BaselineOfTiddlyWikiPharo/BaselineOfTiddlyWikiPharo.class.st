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
			"Dependencies"
			spec baseline: 'ZTimestamp' with: [ spec repository: 'github://svenvc/ztimestamp/repository' ].
			
			"Packages" 
			 spec package: 'TiddlyWiki' with: [ spec requires: #('ZTimestamp') ]
		]
]

{ #category : #accessing }
BaselineOfTiddlyWikiPharo >> projectClass [ 
	^ MetacelloCypressBaselineProject 
]
