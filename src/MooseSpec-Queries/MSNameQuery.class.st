Class {
	#name : #MSNameQuery,
	#superclass : #MSAbstractQuery,
	#category : #'MooseSpec-Queries-Terminal'
}

{ #category : #'instance creation' }
MSNameQuery class >> fromString: aString [
	^ self new
		pattern: aString;
		yourself
]

{ #category : #running }
MSNameQuery >> displayOn: aStream [
	aStream << 'mooseGroup select: [ :each | each includesSubstring: ' << self pattern << ' ]'
]

{ #category : #accessing }
MSNameQuery >> pattern [
	^ pattern
]

{ #category : #accessing }
MSNameQuery >> pattern: aString [ 
	pattern := aString
]

{ #category : #running }
MSNameQuery >> runOn: aMooseGroup [ 
	^ aMooseGroup select: [ :each | each name includesSubstring: self pattern ]
]
